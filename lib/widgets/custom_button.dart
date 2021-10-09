import 'package:flutter/material.dart';
import 'package:portfoli/constants/constants.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String title;

  const CustomButton({Key? key,required this.onTap,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    ElevatedButton(
      style: ElevatedButton.styleFrom(
primary: Constants.darkPrimaryColor,
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)),
        minimumSize: const Size(150, 55),
        maximumSize: const Size(200, 55),
      ),
      onPressed: () {onTap();},
      child:
          Text(title),


    );
  }
}
