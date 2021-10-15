import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:portfoli/constants/personal_info.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/send_button.dart';
import '../../constants/constants.dart';
import 'package:http/http.dart' as http;



class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    PersonalInfo info = PersonalInfo();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController messageController = TextEditingController();

    Future sendEmail(
        {required String name,
        required String email,
        required String message}) async {
      final url = Uri.parse(info.serviceUrl);
      final response = await http.post(url,
          headers: {
            'origin': 'http://localhost',
            'Content-Type': "application/json",
          },
          body: json.encode({
            'service_id': info.serviceId,
            'template_id': info.templateTd,
            'user_id': info.userId,
            'template_params': {
              'user_name': name,
              'user_email': email,
              'user_message': message,
            }
          }));

      if (response.statusCode == 200) {
        Constants().showToast("Message sent successfully");
        FocusScope.of(context).unfocus();
        // nameController.clear();
        // emailController.clear();
        // messageController.clear();
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
            hintText: title,


            border:  InputBorder.none,);
      }

      getTextFieldTitle(String title) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: .01 * height,
              top: title.contains("Name") ? 0 : 0.03 * height),
          child: Text(
            "Your " + title,
            style:
        theme.textTheme.headline1!.copyWith(fontSize: width>725?22:20, fontWeight: FontWeight.w600),
          ),
        );
      }

      getTextField(Widget field){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)),border: Border.all(color:theme.colorScheme.secondaryVariant,width: 1.5)),
          child: field,
        );
      }

      return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getTextFieldTitle("Name"),

            getTextField(
            TextFormField(
                controller: nameController,
                decoration: getInputDecoration("Name"),
              textInputAction: TextInputAction.next,),),
            getTextFieldTitle("Email"),
        getTextField( TextFormField(
                controller: emailController,
                decoration: getInputDecoration("Email"),
              textInputAction: TextInputAction.next,)),
            getTextFieldTitle("Message"),
        getTextField(   TextFormField(
              controller: messageController,
              maxLines: 8,
              decoration: getInputDecoration("Message"),
              textInputAction: TextInputAction.done,
        )),
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
                   CircularProgressIndicator(color: theme.textTheme.headline3!.color,),
                  SizedBox(width: height * 0.05,),
                   Text("Sending...",style: theme.textTheme.headline3!.copyWith(fontSize: 16,fontWeight: FontWeight.w600),)
                ],
              ): Text("Send",style: theme.textTheme.headline3!.copyWith(fontSize: 16,fontWeight: FontWeight.w600),)

              ),

          ],
        ),
      );
    }

    return Container(child: contactForm());
  }
}


