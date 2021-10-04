import 'package:flutter/material.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/database/skills_database.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/seaction_sub_header.dart';

class AboutSkillsPage extends StatefulWidget {
  const AboutSkillsPage({Key? key}) : super(key: key);

  @override
  _AboutSkillsPageState createState() => _AboutSkillsPageState();
}

class _AboutSkillsPageState extends State<AboutSkillsPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    AppPadding appPadding = AppPadding(context: context);
    int getCrossCount() => width > 950
        ? 6
        : width > 725
            ? 5
            : 4;

    getSkills() {
      return
      Wrap(
        children:  skills.map(
              (skill) => Container(
                margin:EdgeInsets.all(8) ,
            padding: EdgeInsets.all(8),
            child: Text(skill.title),
            decoration: BoxDecoration(
              border: Border.all(color: Constants.lightPrimaryColor),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
          ),
        ).toList()
      );
    }

    return Padding(
      padding: appPadding.mainPadding(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * .05,
          ),
          SectionSubHeader(title: "Skills"),
          getSkills(),
          // GridView.builder(
          //   physics: NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   itemCount: skills.length,
          //   gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: getCrossCount(),
          //       crossAxisSpacing: width *.02,
          //       mainAxisSpacing: height *.02),
          //   itemBuilder: (BuildContext context, int index) {
          //     return Card(
          //         color: Colors.blue.shade50,
          //         child: Padding(
          //           padding: EdgeInsets.all(height * .01),
          //           child: Image.asset(
          //             skills[index].imageSrc,
          //             height: height * 0.05,
          //             width: height * 0.05,
          //           ),
          //         ));
          //   },
          // ),
          SizedBox(
            height: height * .05,
          ),
        ],
      ),
    );
  }
}
