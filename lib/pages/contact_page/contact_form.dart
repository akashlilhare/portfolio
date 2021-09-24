import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:portfoli/utils/responsive.dart';
import '../../constants/constants.dart';
import 'package:http/http.dart' as http;


enum ButtonState{init, loading, success, failure}

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}



class _ContactFormState extends State<ContactForm> {
  ButtonState state = ButtonState.init;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController messageController = TextEditingController();

    Future sendEmail(
        {required String name,
          required String email,
          required String message}) async {
      const serviceId = "service_nsn2v8d";
      const templateTd = "template_j9qvrsw";
      const userId = "user_cKUgVy2ZuSrzEXU2rYTun";
      final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
      final response = await http.post(url,
          headers: {
            'origin': 'http://localhost',
            'Content-Type': "application/json",
          },
          body: json.encode({
            'service_id': serviceId,
            'template_id': templateTd,
            'user_id': userId,
            'template_params': {
              'user_name': name,
              'user_email': email,
              'user_message': message,
            }
          }));

      if (response.statusCode == 200) {
        nameController.clear();
        emailController.clear();
        messageController.clear();
        Constants().showToast("Message sent successfully");
      } else {
        Constants().showToast("Not able to send message");
      }
    }


    sendMessage({required String name,
      required String email,
      required String message})async{
      if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
        Constants().showToast("Enter Valid Email");
        nameController = TextEditingController(text: email);
        return;
      }

      if(message.isEmpty){
        Constants().showToast("Write something in message");
        return;
      }

      if(name.isEmpty){
        Constants().showToast("Enter Valid Name");
        return;
      }

      FocusScope.of(context).unfocus();

      setState(() => isLoading = true);
     await  sendEmail(
          email: emailController.text,
          message: messageController.text,
          name: nameController.text);
      setState(() => isLoading = false);

    }


    contactCard() {
      copyText(String contact) async {
        FlutterClipboard.copy(contact).then((value) {
          return Constants().showToast('copied to clipboard');
        });
      }

      buildContactCard(IconData icon, String title, String subtitle) {
        return Container(
            margin: EdgeInsets.only(bottom: height * .04),
            padding: EdgeInsets.symmetric(
                vertical: height * .04, horizontal: width * .02),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  child: Icon(icon),
                ),
                SizedBox(
                  width: width * .02,
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: height * .025,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                              fontSize: height * .02,
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                ),
                IconButton(
                  onPressed: () => copyText(subtitle),
                  icon: const Icon(
                    Icons.copy,
                  ),
                  tooltip: "copy : $subtitle",
                ),
              ],
            ));
      }

      return Column(
        children: [
          buildContactCard(Icons.phone_outlined, "Phone", "+91-9669395879"),
          buildContactCard(
              Icons.email_outlined, "Email", "akashlilhare14@gmail.com"),
          buildContactCard(
              Icons.location_on_outlined, "Location", "Rajnandgao, India"),
        ],
      );
    }

    contactForm() {
      getInputDecoration(String title) {
        return InputDecoration(
            fillColor: Colors.blue.shade50,
            filled: true,
            hintText: title,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(12),
            )));
      }

      getTextFieldTitle(String title) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: .01 * height,
              top: title.contains("Name") ? 0 : 0.03 * height),
          child: Text(
            "Your " + title,
            style:
                TextStyle(fontSize: height * .025, fontWeight: FontWeight.w600),
          ),
        );
      }

      return Form(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getTextFieldTitle("Name"),
            TextFormField(
                controller: nameController,
                decoration: getInputDecoration("Name"),
              textInputAction: TextInputAction.next,),
            getTextFieldTitle("Email"),
            TextFormField(
                controller: emailController,
                decoration: getInputDecoration("Email"),
              textInputAction: TextInputAction.next,),
            getTextFieldTitle("Message"),
            TextFormField(
              controller: messageController,
              maxLines: 8,
              decoration: getInputDecoration("Message"),
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: height * .04,
            ),

            SendButton(
                onTap: ()  {
                   sendMessage(
                      email: emailController.text,
                      message: messageController.text,
                      name: nameController.text);
                },
              widget: isLoading? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(color: Colors.white,),
                  SizedBox(width: height * 0.05,),
                  const Text("Sending...")
                ],
              ):const Text("Send")

              ),

          ],
        ),
      );
    }

    return Padding(
      padding: AppPadding(context: context).mainPadding(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          width >= 850
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: contactCard()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * .06),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(200))),
                          height: height * .4,
                          width: 4,
                        ),
                      ),
                    ),
                    Expanded(child: contactForm())
                  ],
                )
              : Column(
                  children: [
                    contactCard(),
                    SizedBox(
                      height: height * .07,
                    ),
                    contactForm()
                  ],
                ),
          SizedBox(
            height: height * .1,
          ),
        ],
      ),
    );
  }
}


class SendButton extends StatelessWidget {
  final Widget widget;
  final Function onTap;


   const SendButton({Key? key,required this.widget, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)),
        minimumSize: const Size(150, 55),

      ),
      onPressed: () {onTap();},
      child: widget



    );
  }
}


