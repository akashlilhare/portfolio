import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfoli/constants/app_theme.dart';
import 'package:portfoli/pages/about_page/about_page.dart';
import 'package:portfoli/pages/contact_page/contact_page.dart';
import 'package:portfoli/pages/main_page.dart';
import 'package:portfoli/pages/project_page/project_page.dart';
import 'package:sizer/sizer.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor:Colors.transparent,
    systemStatusBarContrastEnforced: false,


  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(debugShowCheckedModeBanner: false,
            title: 'Akash',
            theme: AppTheme().lightThemeData,
            darkTheme: AppTheme().darkThemeData,
            home: const MainPage(),
            routes: {
              ProjectPage.routeName: (ctx) =>const ProjectPage(),
              AboutPage.routeName: (ctx) =>const AboutPage(),
              ContactPage.routeName: (ctx) =>const ContactPage(),
            },
          );
        });
  }}
