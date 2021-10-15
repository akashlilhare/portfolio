import 'package:flutter/material.dart';
import 'package:portfoli/constants/app_theme.dart';
import 'package:portfoli/pages/contact_page/contact_page.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/custom_button.dart';
import 'package:portfoli/widgets/secation_header.dart';
import 'package:provider/provider.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    var theme = Theme.of(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
            decoration: BoxDecoration(color:theme.colorScheme.secondary,borderRadius: BorderRadius.all(Radius.circular(16))),
            margin: CustomResponsiveBuilder(context: context).mainPadding(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height*.08),
                 Text(
                 "Have a Project in mind",style: theme.textTheme.headline1!.copyWith(fontSize: width>750?28:36,fontWeight: FontWeight.w700 ,letterSpacing: 1.2),textAlign: TextAlign.center,),
                Text(   "Let me help you",style: theme.textTheme.headline2!.copyWith(fontSize: width>750?14:18,fontWeight: FontWeight.w500, ),),
                SizedBox(height: .05*height,),
                CustomButton(onTap: ()=>Navigator.pushNamed(context, ContactPage.routeName), title: "Contact Now"),
                SizedBox(height: height*.04,) ,
              ],

            )),
        SizedBox(height: height*.03,)
      ],
    );
  }
}
