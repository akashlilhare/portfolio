import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/database/project_database.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailBox extends StatelessWidget {
  final int index;

  const ProjectDetailBox({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    buildFeatures() {
      return projectList[index]
          .features
          .map((feature) => Column(
                children: [
                  Row(
                    children: [
                       Icon(
                        Icons.check_circle_outline,
                        size: 20,
                        color: theme.colorScheme.primaryVariant,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Flexible(child: Text(feature,style: theme.textTheme.headline2!.copyWith(fontSize: 14,fontWeight: FontWeight.w400)))
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
                              const BorderRadius.all(Radius.circular(8)),
                          border:
                              Border.all(color:theme.colorScheme.secondaryVariant )),
                      child: Text(tech.title),
                    ),
                  ))
              .toList());
    }

    buildSourceButton(){
      void launchURL(url) async => await canLaunch(url)
          ? await launch(url)
          : throw 'Could not launch $url';

      List<ElevatedButton> btnList = [];
      var currItem = projectList[index].projectSrc;
      var btnStyle = ElevatedButton.styleFrom(
          primary: theme.colorScheme.primaryVariant,
          minimumSize: Size(120, 45),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))));

      if (currItem[0] != "") {
        btnList.add(ElevatedButton.icon(
            style: btnStyle,
            onPressed: () =>launchURL(currItem[0]),
            label: Text("Github",style: theme.textTheme.headline1!.copyWith(fontWeight: FontWeight.w500,fontSize: 14)),
            icon: Icon(
              FontAwesomeIcons.github,
              color: theme.textTheme.headline1!.color,
            )));
      }
      if (currItem[1] != "") {
        btnList.add(ElevatedButton.icon(
            style: btnStyle,
            onPressed: () =>launchURL(currItem[1]),
            label: Text("PlayStore"),
            icon: Icon(
              FeatherIcons.play,
            )));
      }
      if (currItem[2] != "") {
        btnList.add(ElevatedButton.icon(
            style: btnStyle,
            onPressed: () =>launchURL(currItem[2]),
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

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:width<500? 0: width< 725 ? width * .05 :width<1000 ? width*.1 : width*.15),
      child: Dialog(
        backgroundColor: theme.colorScheme.primary,


        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18))),
        child: Padding(
          padding: EdgeInsets.all(width * .05 ),
          child: ListView(
          shrinkWrap: true,
            children: [
              Row(
                children: [
                  Text(
                    projectList[index].title,
                    style: theme.textTheme.headline1!.copyWith(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Spacer(),
                  SizedBox(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                          primary:theme.colorScheme.primaryVariant),
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
              Text(projectList[index].subtitle,style: theme.textTheme.headline1!.copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
              SizedBox(height: height * .02),
              ...buildFeatures(),
              SizedBox(height: height * .02),
              buildSourceButton(),
            ],
          ),
        ),
      ),
    );
  }
}
