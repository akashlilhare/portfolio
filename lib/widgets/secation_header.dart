import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  const SectionHeader({Key? key,required this.title,required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width;
var theme = Theme.of(context);
     return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          SizedBox(height: .05*height,),
          Text(title,style: theme.textTheme.headline1!.copyWith(fontSize: width>750?28:36,fontWeight: FontWeight.w700 ,letterSpacing: 1.2),textAlign: TextAlign.center,),
          Text(subTitle,style: theme.textTheme.headline2!.copyWith(fontSize: width>750?14:18,fontWeight: FontWeight.w500, ),),
          SizedBox(height: .05*height,),
        ],
      ),
    );
  }
}
