import 'package:flutter/material.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController messageController = TextEditingController();

    contactCard() {
      buildContactCard(IconData icon, String title, String subtitle) {
        return ListTile(
          leading: Icon(icon),
          title: Text(title),
          subtitle: Text(subtitle),
        );
      }

      return Column(
        children: [
          buildContactCard(Icons.phone_outlined, "Call Me", "+91-9669395879"),
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
            hintText: title,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(12),
            )));
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                    controller: nameController,
                    decoration: getInputDecoration("Name")),
              ),
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                child: TextFormField(
                    controller: emailController,
                    decoration: getInputDecoration("Email")),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          TextFormField(
            controller: messageController,
            maxLines: 8,
            decoration: getInputDecoration("Message"),
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomButton(
            title: "Send",
            onTap: () {},
            icon: Icons.send_outlined,
          )
        ],
      );
    }

    return Padding(
      padding: AppPadding().horizontalPadding(25, 12, 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Contact Me",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const Text("Get in Touch"),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: contactCard()),
              Expanded(child: contactForm())
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
