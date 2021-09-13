import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class AppPadding {
  horizontalPadding(double d, double t, double m) {
    double pad = 0;
    if (SizerUtil.width >= 950) {
      pad = d;
    } else if (SizerUtil.width >= 768) {
      pad = t;
    } else {
      pad = m;
    }
    return EdgeInsets.symmetric(horizontal: pad.w);
  }

  verticalPadding(double d, double t, double m) {
    double pad = 0;
    if (SizerUtil.width >= 950) {
      pad = d;
    } else if (SizerUtil.width >= 768) {
      pad = t;
    } else {
      pad = m;
    }
    return EdgeInsets.symmetric(vertical: pad.h);
  }

  leftPadding(double d, double t, double m) {
    double pad = 0;
    if (SizerUtil.width >= 950) {
      pad = d;
    } else if (SizerUtil.width >= 768) {
      pad = t;
    } else {
      pad = m;
    }
    return EdgeInsets.only(left: pad.w);
  }

  rightPadding(double d, double t, double m) {
    double pad = 0;
    if (SizerUtil.width >= 950) {
      pad = d;
    } else if (SizerUtil.width >= 768) {
      pad = t;
    } else {
      pad = m;
    }
    return EdgeInsets.only(right: pad.w);
  }

  topPadding(double d, double t, double m) {
    double pad = 0;
    if (SizerUtil.width >= 950) {
      pad = d;
    } else if (SizerUtil.width >= 768) {
      pad = t;
    } else {
      pad = m;
    }
    return EdgeInsets.only(top: pad.h);
  }

  bottomPadding(double d, double t, double m) {
    double pad = 0;
    if (SizerUtil.width >= 950) {
      pad = d;
    } else if (SizerUtil.width >= 768) {
      pad = t;
    } else {
      pad = m;
    }
    return EdgeInsets.only(bottom: pad.h);
  }
}
