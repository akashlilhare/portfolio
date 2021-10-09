import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/database/project_database.dart';

class ProjectDetailBox extends StatelessWidget {
  final int index;

  const ProjectDetailBox({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    buildFeatures() {
      return projectList[index]
          .features
          .map((feature) => Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        size: 20,
                        color: Constants.darkPrimaryColor,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Flexible(child: Text(feature))
                    ],
                  ),
                  SizedBox(height: height * .02),
                ],
          ))
          .toList();
    }

    buildTechUsed() {
      return Wrap(
          children: projectList[index]
              .techUsed
              .map((tech) => Tooltip(
                    message: tech.title,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 12, bottom: 12),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          border:
                              Border.all(color: Constants.darkPrimaryColor)),
                      child: Text(tech.title),
                    ),
                  ))
              .toList());
    }

    buildSourceButton(){
      List<ElevatedButton> btnList = [];
      var currItem = projectList[index].projectSrc;
      var btnStyle = ElevatedButton.styleFrom(
          primary: Constants.darkPrimaryColor,
          minimumSize: Size(120, 45),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))));

      if (currItem[0] != "") {
        btnList.add(ElevatedButton.icon(
            style: btnStyle,
            onPressed: () {},
            label: Text("Github"),
            icon: Icon(
              FeatherIcons.github,
            )));
      }
      if (currItem[1] != "") {
        btnList.add(ElevatedButton.icon(
            style: btnStyle,
            onPressed: () {},
            label: Text("PlayStore"),
            icon: Icon(
              FeatherIcons.play,
            )));
      }
      if (currItem[2] != "") {
        btnList.add(ElevatedButton.icon(
            style: btnStyle,
            onPressed: () {},
            label: Text("WebSite"),
            icon: Icon(
              FeatherIcons.globe,
            )));
      }

      return Row(
        // direction: Axis.horizontal,
        // alignment: WrapAlignment.end,
        // runAlignment: WrapAlignment.end,
        //
        // crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Spacer(),
          ...btnList
              .map((btn) => Padding(
                    padding: EdgeInsets.only(
                        bottom: height * .01, right: height * .01),
                    child: btn,
                  ))
              .toList()
        ],
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: Padding(
        padding: EdgeInsets.all(width * .05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  projectList[index].title,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Spacer(),
                SizedBox(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                        primary: Constants.darkPrimaryColor),
                    child: Icon(Icons.close),
                  ),
                  width: 40,
                  height: 40,
                )
              ],
            ),
            SizedBox(height: height * .02),
            buildTechUsed(),
            SizedBox(height: height * .02),
            Text(projectList[index].subtitle),
            SizedBox(height: height * .02),
            ...buildFeatures(),
            SizedBox(height: height * .02),
            buildSourceButton(),
          ],
        ),
      ),
    );
  }
}
