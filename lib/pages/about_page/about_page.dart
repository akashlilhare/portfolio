import 'package:flutter/material.dart';
import 'package:portfoli/pages/about_page/about_skills.dart';
import 'package:portfoli/pages/about_page/qualification_page.dart';
import 'package:portfoli/widgets/contact_card.dart';

import '../footer_section.dart';
import '../header_section.dart';
import 'about_header.dart';
import 'certificate_page.dart';
import 'course_work.dart';

class AboutPage extends StatelessWidget {
  static const routeName = "about";

  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer:  buildDrawer(context, width),
      appBar: buildAppBar(context, width,1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            AboutHeader(),
            AboutQualification(),
            AboutSkillsPage(),
            CourseWork(),
           CertificatePage(),
            ContactCard(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
