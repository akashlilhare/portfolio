import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:sizer/sizer.dart';


class FooterPage extends StatelessWidget {
  const FooterPage({Key? key}) : super(key: key);

  buildSocialButton() {
    socialButton(
        {required IconData icon,
          required String title,
          required Function onTap}) {
      return Container(
        margin: AppPadding().rightPadding(8, 2, 2),
        child: IconButton(
          onPressed: () => onTap(),
          icon: Icon(icon,color: Colors.white,),
          // tooltip: title,
        ),
      );
    }

    return Row(
      children: [
        socialButton(
            onTap: () {}, icon: FeatherIcons.github, title: "Github"),
        socialButton(
            onTap: () {}, icon: FeatherIcons.linkedin, title: "Linkedin"),
        socialButton(
            onTap: () {}, icon: FeatherIcons.twitter, title: "Twitter"),
        socialButton(
            onTap: () {}, icon: Icons.email_outlined, title: "Email"),
      ],
    );
  }

  buildName(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Akash",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Colors.white),),
            Text("Flutter Developer",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
          ],
        ),
        Spacer(),
        buildSocialButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      color: ThemeData.light().primaryColor,
      padding: Constants().padding,
      child: Column(
        children: [
          Spacer(),
          buildName(),
          Spacer(),
          Text("© Copyright 2021 Akash Lilhare",style: TextStyle(color: Colors.white54),),
          SizedBox(height: 1.h,),
        ],
      ),
    );
  }
}
