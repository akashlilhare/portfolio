import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final IconData icon;
  const CustomButton({Key? key,required this.onTap,required this.title,required this.icon,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    ElevatedButton(
      style: ElevatedButton.styleFrom(

        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0)),
        minimumSize: const Size(150, 50),
        maximumSize: const Size(200, 50),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
        const  SizedBox(width: 10,),
          Text(title),

        ],
      ),
    );
  }
}
