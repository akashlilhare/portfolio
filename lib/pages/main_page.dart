import 'package:flutter/material.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/pages/footer_section.dart';
import 'package:portfoli/pages/project_page/project_page.dart';
import 'package:portfoli/widgets/contact_card.dart';
import 'package:portfoli/widgets/secation_header.dart';
import 'package:sizer/sizer.dart';

import 'contact_page/contact_page.dart';
import 'header_section.dart';
import 'home_pages/about_section.dart';
import 'home_pages/intro_section.dart';
import 'home_pages/project_seaction.dart';
import 'about_page/qualification_page.dart';
import 'about_page/about_skills.dart';
import 'home_pages/services_section.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    ScrollController _scrollController = ScrollController();

    return Scaffold(
      //backgroundColor: Colors.white,
      drawer: buildDrawer(context, width),
      appBar: buildAppBar(context, width,0),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  IntroSection(
                    scrollController: _scrollController,
                  ),
                  AboutSection(),
                  ProjectSection(),
                  ServicesSection(),
                  ContactCard(),
                  FooterSection(),
                ],
              ),
            ),
    ],
    ),
    ),
    );
    }
}
