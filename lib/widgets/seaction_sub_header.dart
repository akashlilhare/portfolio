import 'package:flutter/material.dart';

class SectionSubHeader extends StatelessWidget {
  final String title;

  const SectionSubHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.04),
      child: Text(
        title,
        style: TextStyle(
            fontSize: height * .035,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5),
      ),
    );
  }
}
