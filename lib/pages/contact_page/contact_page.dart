

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfoli/pages/footer_section.dart';
import 'package:portfoli/widgets/secation_header.dart';

import '../header_section.dart';
import 'contact_form.dart';

class ContactPage extends StatelessWidget {
  static const routeName = "contact-page";
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer:  BuildDrawer(),
      appBar: buildAppBar(context, width),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SectionHeader(
              title: "Contact Me",
              subTitle: "Get in touch",
            ),

            ContactForm(),
            FooterSection()
          ],
        ),
      ),
    );
  }
}
