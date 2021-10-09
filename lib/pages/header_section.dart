

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:portfoli/models/important_link_model.dart';
import 'package:portfoli/pages/about_page/about_page.dart';
import 'package:portfoli/pages/contact_page/contact_page.dart';
import 'package:portfoli/pages/project_page/project_page.dart';

List<ImportantLink> headerTitle = [
  ImportantLink(
      link: "Home", onTap: (BuildContext context)=>Navigator.pushNamed(context, "/")),

  ImportantLink(
      link: "About", onTap: (BuildContext context)=>Navigator.pushNamed(context, AboutPage.routeName)),

  ImportantLink(
      link: "Project", onTap: (BuildContext context)=>Navigator.pushNamed(context, ProjectPage.routeName)),

  ImportantLink(
      link: "Contacts", onTap: (BuildContext context)=>Navigator.pushNamed(context, ContactPage.routeName)),

];

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    double width = 660;
    return width < 750
        ? Container(
      color: Colors.white,

      child: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor:Colors.white, //This will change the drawer background to blue.
            //other styles
          ),
          child: Drawer(
            child: Column(
                children:[
                    Image.asset("assets/devloper.gif"),
                    SizedBox(
                      height: 20,
                    ),
                    ...headerTitle
                        .map((item) => ListTile(
                              title: Text(item.link),
                              onTap: () {
                                item.onTap(context);
                              },
                            ))
                        .toList(),
                    const Spacer(),
                    ClipPath(
                      clipper: OvalTopBorderClipper(),
                      //     clipper: WaveClipperTwo(flip: true,reverse: true),
                      child: Container(
                          height: 100,
                          width: double.infinity,
                          color: Colors.blue.shade100,
                          child: TextButton(
                            child: Text(
                              "Exit",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                          if (Platform.isAndroid) {
                            SystemNavigator.pop();
                          } else if (Platform.isIOS) {
                            exit(0);
                          }

                      },)
                    ),
                  ),

                ]
            ),
          ),
        ),
      ),
    )
        : Container();
  }
}


buildDrawer(BuildContext context, double width) {
  return width < 750
      ? Container(
    color: Colors.blue,

        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.blue.shade800, //This will change the drawer background to blue.
            //other styles
          ),
          child: Drawer(
              child: Column(
                children:[
                  Image.asset("assets/dev1.gif"),
                  ...headerTitle
                      .map((item) => ListTile(
                    title: Text(item.link),
                    onTap: () {
                      item.onTap(context);
                    },
                  ))
                      .toList(),
                ]
              ),
            ),
        ),
      )
      : null;
}

buildAppBar(BuildContext context, double width) {
  return  width >= 750
      ? AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: const Text(
      "Akash",
      style: TextStyle(color: Colors.black),
    ),
    actions: width >= 750
        ? headerTitle
            .map((item) => Padding(
                  padding: EdgeInsets.only(right: width*.03),
                  child: TextButton(
                    style: TextButton.styleFrom(primary: Colors.black),

                    child: Text(item.link),
                    onPressed: () {
                      item.onTap(context);
                    },
                  ),
                ))
            .toList()
        : [],
  ):AppBar(backgroundColor: Colors.transparent,elevation: 0,);
}
