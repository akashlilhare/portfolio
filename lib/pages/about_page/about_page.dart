import 'package:flutter/material.dart';
import 'package:portfoli/pages/about_page/about_skills.dart';
import 'package:portfoli/pages/about_page/qualification_page.dart';
import 'package:portfoli/widgets/contact_card.dart';
import 'package:portfoli/widgets/seaction_sub_header.dart';

import '../footer_section.dart';
import '../header_section.dart';
import 'about_header.dart';

class AboutPage extends StatelessWidget {
  static const routeName = "about-page";

  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: const BuildDrawer(),
      appBar: buildAppBar(context, width),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            AboutHeader(),
            AboutQualification(),
            AboutSkillsPage(),
            ContactCard(),
            FooterSection()
          ],
        ),
      ),
    );
  }
}
