import 'package:flutter/material.dart';

import 'constants.dart';


Constants constants = Constants();

class AppTheme {
  ThemeData lightThemeData = ThemeData(
    backgroundColor: Constants.lightPrimaryColor,
    primarySwatch: Colors.blue,
    primaryColor: Constants.lightPrimaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  ThemeData darkThemeData = ThemeData(
    backgroundColor: Constants.darkBackgroundColor,
    primarySwatch: Colors.blue,
    primaryColor: Constants.darkPrimaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
