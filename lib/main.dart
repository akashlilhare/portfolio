import 'package:flutter/material.dart';
import 'package:portfoli/constants/app_theme.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/pages/main_page.dart';
import 'package:sizer/sizer.dart';

void main() {
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
            title: 'Flutter Demo',
            theme: AppTheme().lightThemeData,
            darkTheme: AppTheme().darkThemeData,
            home: const MainPage(),
          );
        });
  }}
