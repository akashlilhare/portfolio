import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  const SectionHeader({Key? key,required this.title,required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          SizedBox(height: .05*height,),
          Text(title,style: TextStyle(fontSize: .05*height,fontWeight: FontWeight.w700,color:Colors.black ),textAlign: TextAlign.center,),
          Text(subTitle,style: TextStyle(fontSize:  .02*height,fontWeight: FontWeight.w500,color:Colors.black54 ),),
          SizedBox(height: .05*height,),
        ],
      ),
    );
  }
}
