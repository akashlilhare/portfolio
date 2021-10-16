import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeProvider extends ChangeNotifier {
  final String _themeKey = "saved-theme";
  ThemeMode themeMode = ThemeMode.light;

  _saveTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, value);
  }

  Future<ThemeMode> getSavedTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool(_themeKey) ?? false;
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    return themeMode;
  }

  set isDarkMode(val) => themeMode = val;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) async {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    await _saveTheme(isOn);
    notifyListeners();
  }
}

class AppTheme {
  // Light theme color
  static const lightBackgroundColor = Color(0xffffffff);
  static const lightPrimaryColor = Color(0xff4937CE);
  static  const lightSecondaryColor = Color(0xffE4EEF8);
  static const lightHeadline1Color = Color(0xff1D1D1F);
  static const lightHeadline2Color = Color(0xff28282A);
  static const lightHeadline3Color = Color(0xffF5F5F7);
  static const lightHeadline4Color = Color(0xffF7F7F9);
  static const lightBorderColor = Color(0xff283349);
  static const lightButtonColor = Color(0xff4937CE);

  //Dark them color
  static const darkBackgroundColor = Color(0xff1F1D2C);
  static const darkPrimaryColor = Color(0xff262837);
  static const darkSecondaryColor = Color(0xff2E303F);
  static const darkHeadline1Color = Color(0xffF7F7F9);
  static const darkHeadline2Color = Color(0xff989EB2);
  static const darkHeadline3Color = Color(0xffF7F7F9);
  static const darkHeadline4Color = Color(0xff989EB2);
  static const darkBorderColor = Color(0xffC996CC);
  static const darkButtonColor = Color(0xff6B5ECD);

  // colorSchema.primaryVariant = button color
  // colorSchema.secondaryVariant = border color

  ThemeData lightThemeData = ThemeData(
    appBarTheme: const AppBarTheme(color: lightBackgroundColor),
    primaryColor: lightPrimaryColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    colorScheme: const ColorScheme.light(
        primary: lightPrimaryColor,
        secondary: lightSecondaryColor,
        primaryVariant: lightButtonColor,
        secondaryVariant: lightBorderColor),
    textTheme: const TextTheme(
      headline1: TextStyle(color: lightHeadline1Color),
      headline2: TextStyle(color: lightHeadline2Color),
      headline3: TextStyle(color: lightHeadline3Color),
      headline4: TextStyle(color: lightHeadline4Color),
    ),
    brightness: Brightness.light,
    buttonTheme: ButtonThemeData(
        buttonColor: lightButtonColor,
        hoverColor: darkButtonColor.withOpacity(.5)),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  ThemeData darkThemeData = ThemeData(
    appBarTheme: const AppBarTheme(color: darkBackgroundColor),
    primaryColor: darkPrimaryColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    colorScheme: const ColorScheme.dark(
        primary: darkPrimaryColor,
        secondary: darkPrimaryColor,
        primaryVariant: darkButtonColor,
        secondaryVariant: darkBorderColor),
    textTheme: const TextTheme(
      headline1: TextStyle(color: darkHeadline1Color),
      headline2: TextStyle(color: darkHeadline2Color),
      headline3: TextStyle(color: darkHeadline3Color),
      headline4: TextStyle(color: darkHeadline4Color),
    ),
    brightness: Brightness.dark,
    buttonTheme: const ButtonThemeData(buttonColor: darkButtonColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
