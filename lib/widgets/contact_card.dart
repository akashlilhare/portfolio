import 'package:flutter/material.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/custom_button.dart';
import 'package:portfoli/widgets/secation_header.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: double.infinity,
            decoration: BoxDecoration(color: Colors.blue.shade100,borderRadius: BorderRadius.all(Radius.circular(16))),
            margin: AppPadding(context: context).mainPadding(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height*.04),
                SectionHeader(
                  title: "Have a Project in mind",
                  subTitle: "Let me help you",
                ),
                CustomButton(onTap: () {}, title: "Contact Now"),
                SizedBox(height: height*.04,) ,
              ],

            )),
        SizedBox(height: height*.03,)
      ],
    );
  }
}
