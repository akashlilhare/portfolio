import 'package:flutter/cupertino.dart';

class AppPadding {
 final BuildContext context;
 AppPadding({required this.context});


  getSizedBox(double d, double t, double m,){
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.width;
    double pad = 0;
    if (width >= 950) {
      pad = d;
    } else if (width >= 768) {
      pad = t;
    } else {
      pad = m;
    }
    return pad/100 * width;
  }

   mainPadding(){
   return   EdgeInsets.symmetric(horizontal: getSizedBox(9,10,8));
   }

  // allPadding(double d, double t, double m) {
  //
  //   double pad = 0;
  //   if (width >= 950) {
  //     pad = d;
  //   } else if (width >= 768) {
  //     pad = t;
  //   } else {
  //     pad = m;
  //   }
  //   return EdgeInsets.all( pad/100 * width);
  // }
  //
  //
  // horizontalPadding(double d, double t, double m,double width) {
  //   double pad = 0;
  //   if (width >= 950) {
  //     pad = d;
  //   } else if (width >= 768) {
  //     pad = t;
  //   } else {
  //     pad = m;
  //   }
  //   return EdgeInsets.symmetric(horizontal: pad/100 * width);
  // }
  //
  // verticalPadding(double d, double t, double m, double height, double width) {
  //   double pad = 0;
  //   if (width >= 950) {
  //     pad = d;
  //   } else if (width >= 768) {
  //     pad = t;
  //   } else {
  //     pad = m;
  //   }
  //   return EdgeInsets.symmetric(vertical: pad/100 * height);
  // }
  //
  // leftPadding(double d, double t, double m, width) {
  //   double pad = 0;
  //   if (width >= 950) {
  //     pad = d;
  //   } else if (width >= 768) {
  //     pad = t;
  //   } else {
  //     pad = m;
  //   }
  //   return EdgeInsets.only(left: pad/100 * width);
  // }
  //
  // rightPadding(double d, double t, double m, width) {
  //   double pad = 0;
  //   if (width >= 950) {
  //     pad = d;
  //   } else if (width >= 768) {
  //     pad = t;
  //   } else {
  //     pad = m;
  //   }
  //   return EdgeInsets.only(right: pad/100 * width);
  // }
  //
  // topPadding(double d, double t, double m, double height, double width) {
  //   double pad = 0;
  //   if (width >= 950) {
  //     pad = d;
  //   } else if (width >= 768) {
  //     pad = t;
  //   } else {
  //     pad = m;
  //   }
  //   return EdgeInsets.only(top: pad/100 * height);
  // }
  //
  // bottomPadding(double d, double t, double m, double height, double width) {
  //   double pad = 0;
  //   if (width >= 950) {
  //     pad = d;
  //   } else if (width >= 768) {
  //     pad = t;
  //   } else {
  //     pad = m;
  //   }
  //   return EdgeInsets.only(bottom: pad/100 * height);
  // }
}

