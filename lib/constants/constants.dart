import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Constants {






 showToast(String message) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue.shade100,
      textColor: Colors.black,
      fontSize: 16.0
  );
 }

}