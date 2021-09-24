import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfoli/utils/responsive.dart';
class Constants {


  // Light theme color
 static const  lightBackgroundColor =  Color(0xffF1F0F2);
 static const lightPrimaryColor =  Color(0xff27255E);
 static const lightSecondaryColor =  Color(0xff9D96AF);

  //Dark them color
 static const darkBackgroundColor =  Color(0xff281633);
 static const darkPrimaryColor =  Color(0xff312EF9);
 static const darkSecondaryColor =  Color(0xff605AFA);

 showToast(String message){
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0
  );
 }
}


