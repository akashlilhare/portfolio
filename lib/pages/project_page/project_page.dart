
import 'package:flutter/material.dart';
import 'package:portfoli/pages/footer_section.dart';
import 'package:portfoli/pages/project_page/project_widget.dart';
import 'package:portfoli/widgets/secation_header.dart';

import '../header_section.dart';
class ProjectPage extends StatelessWidget {
  static const routeName = "project-page";
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: BuildDrawer(),
      appBar: buildAppBar(context, width),
      body: SingleChildScrollView(

        child: Column(
          children:  [
            const SectionHeader(
              title: "Projects",
              subTitle: "Some of my recent works",
            ),
            const ProjectWidget(),
            SizedBox(height: height*.05,),
            const FooterSection()
          ],
        ),
      ),
    );
  }
}
