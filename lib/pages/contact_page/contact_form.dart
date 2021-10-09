import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/send_button.dart';
import '../../constants/constants.dart';
import 'package:http/http.dart' as http;

import 'contact_card.dart';

enum ButtonState { init, loading, success, failure }

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

    contactForm() {
      getInputDecoration(String title) {
        return InputDecoration(

            fillColor: Colors.white70,
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

    return Container(child: contactForm());
  }
}


