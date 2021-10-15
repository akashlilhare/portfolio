import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:portfoli/constants/app_theme.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/constants/personal_info.dart';
import 'package:portfoli/models/important_link_model.dart';
import 'package:portfoli/pages/about_page/about_page.dart';
import 'package:portfoli/pages/contact_page/contact_page.dart';
import 'package:portfoli/pages/project_page/project_page.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/custom_button.dart';
import 'package:portfoli/widgets/theme_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBarLink extends ImportantLink {
  final String curLink;
  final Function onPress;
  final int index;

  AppBarLink(
      {required this.curLink, required this.onPress, required this.index})
      : super(link: curLink, onTap: onPress);
}

List<AppBarLink> headerTitle = [
  AppBarLink(
      curLink: "Home",
      onPress: (BuildContext context) => Navigator.pushNamed(context, "/"),
      index: 0),
  AppBarLink(
      curLink: "About",
      onPress: (BuildContext context) =>
          Navigator.pushNamed(context, AboutPage.routeName),
      index: 1),
  AppBarLink(
      curLink: "Projects",
      onPress: (BuildContext context) =>
          Navigator.pushNamed(context, ProjectPage.routeName),
      index: 2),
  AppBarLink(
      curLink: "Contacts",
      onPress: (BuildContext context) =>
          Navigator.pushNamed(context, ContactPage.routeName),
      index: 3),
];



buildDrawer(BuildContext context, double width) {
  double height= MediaQuery.of(context).size.height;
  var theme = Theme.of(context);

  void launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  return width < 750
      ? Theme(
    
        data: Theme.of(context).copyWith(

          canvasColor: Theme.of(context).scaffoldBackgroundColor, //This will change the drawer background to blue.
          //other styles
        ),
        child: Drawer(
            child: Stack(
              children: [
                ListView(
                  shrinkWrap: true,

                      children: [
                        Container(height: 10),
                    Image.asset("assets/developer.gif"),

                    ...headerTitle
                        .map((item) => ListTile(
                              title: Text(item.curLink),
                              onTap: () {
                                Navigator.of(context).pop();
                                item.onPress(context);
                              },
                            ))
                        .toList(),



                  ]),
                Positioned(
                  right: 18,
                  top: 20,child: SafeArea(
                    child: ThemeButton()),
                ),
                Column(
                  children: [
                    Spacer(),
                    Container(
                      height: 85,
                      width: double.infinity,
                      padding: const EdgeInsets.all(18.0),
                      child: CustomButton(
                        onTap: () => launchURL(PersonalInfo().resume),
                        title: "Download Resume",
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                )
              ],
            ),
            ),
      )

      : null;
}

buildAppBar(BuildContext context, double width, int idx) {
  var theme = Theme.of(context);
  bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;
  return AppBar(
    backgroundColor:isDark?theme.colorScheme.primary:theme.scaffoldBackgroundColor,
    automaticallyImplyLeading: width >= 750 ? false : true,
    iconTheme: IconThemeData(color:isDark? theme.textTheme.headline1!.color:  theme.textTheme.headline1!.color),

    elevation: 1,
    title: Padding(
      padding:width >= 750 ? CustomResponsiveBuilder(context: context).leftPadding():EdgeInsets.all(0),
      child: Text(
        "Akash",style: theme.textTheme.headline1!.copyWith(fontSize: 18,fontWeight: FontWeight.bold),
      ),
    ),
    actions: width >= 750
        ? [
            Padding(
              padding: CustomResponsiveBuilder(context: context).rightPadding(),
              child: Row(
                children:
              [  ...headerTitle
                    .map((item) => Padding(
                          padding: EdgeInsets.only(right: width * .01),
                          child: TextButton(

                            child: Container(
                              padding: EdgeInsets.all(
                                 8, // Space between underline and text
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: idx == item.index
                                    ? theme.colorScheme.primaryVariant
                                    : Colors.transparent,
                                width: 3.0, // Underline thickness
                              ))),
                              child: Text(
                                item.curLink,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                    color:
                                   idx == item.index ? theme.textTheme.headline1!.color: theme.textTheme.headline1!.color
                                    ),
                              ),
                            ),
                            onPressed: () {
                              item.onPress(context);
                            },
                          ),
                        ))
                    .toList(),
                SizedBox(width: 18,),
                ThemeButton()
              ]
              ),
            )
          ]
        : [],
  );
}
