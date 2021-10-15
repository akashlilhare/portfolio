import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomResponsiveBuilder {
  final BuildContext context;

  CustomResponsiveBuilder({required this.context});

  getSizedBox(
    double d,
    double t,
    double m,
  ) {
    double width = MediaQuery.of(context).size.width;
    double pad = 0;
    if (width >= 950) {
      pad = d;
    } else if (width >= 768) {
      pad = t;
    } else {
      pad = m;
    }
    return pad / 100 * width;
  }

  mainPadding() {
    return EdgeInsets.symmetric(horizontal: getSizedBox(9, 10, 8));
  }

  leftPadding(){
    return EdgeInsets.only(left: getSizedBox(9, 10, 8));

  }

  rightPadding(){
    return EdgeInsets.only(right: getSizedBox(9, 10, 8));

  }

  TextStyle descriptionStyle() {
    var theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    return theme.textTheme.headline2!.copyWith(
        fontSize: width > 725 ? 18 : 16,
        letterSpacing: 2,fontWeight: FontWeight.w500);
  }
}
