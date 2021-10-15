

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfoli/pages/footer_section.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/secation_header.dart';

import '../header_section.dart';
import 'contact_card.dart';
import 'contact_form.dart';

class ContactPage extends StatelessWidget {
  static const routeName = "/contact";
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    buildCard(){
      return  GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Padding(
          padding: CustomResponsiveBuilder(context: context).mainPadding(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              width >= 850
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Expanded(child: ContactSection()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .06,vertical: height*.1),
                    child:
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius:
                           const     BorderRadius.all(Radius.circular(30))),
                            height: height * .4,
                            width: 4,

                    ),
                        ),
                  ),

                const  Expanded(child: ContactForm())
                ],
              )
                  : Column(
                children: [
                 const ContactSection(),
                  SizedBox(
                    height: 40
                  ),
                  const ContactForm()
                ],
              ),
              SizedBox(
                height: height * .1,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(

      drawer:  buildDrawer(context, width),
      appBar: buildAppBar(context, width,3),
      body: SingleChildScrollView(
        child: Column(
          children:  [
           const SectionHeader(
              title: "Contact Me",
              subTitle: "Get in touch",
            ),
           buildCard(),

            FooterSection(),
          ],
        ),
      ),
    );
  }
}

