import 'package:flutter/material.dart';
import 'package:portfoli/pages/footer_section.dart';
import 'package:portfoli/widgets/contact_card.dart';
import 'header_section.dart';
import 'home_pages/about_section.dart';
import 'home_pages/intro_section.dart';
import 'home_pages/project_seaction.dart';
import 'home_pages/services_section.dart';


class MainPage extends StatelessWidget {
  static const routeName = "main-page";

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                  const AboutSection(),
                  const ProjectSection(),
                  const ServicesSection(),
                  const ContactCard(),
                  const FooterSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
