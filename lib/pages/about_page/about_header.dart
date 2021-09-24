import 'package:flutter/material.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/custom_button.dart';
import 'package:portfoli/widgets/seaction_sub_header.dart';

class AboutHeader extends StatelessWidget {
  const AboutHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    String p1 =
        "I am from chittagong, Bangladesh. A place of beauty and nature. Since my childhood, i love art and design. I always try to design stuff with my unique point of view. I also love to create things that can be usefull to others.";
    String p2 =
        "I started coding since I was in high school. Coding is also an art for me. I love it and now I have the opportunity to design along with the coding. I find it really interesting and I enjoyed the process a lot.";
    String p3 =
        "My vision is to make the world a better place. Now almost everything is becoming better than ever. It is time for us to create more good stuff that helps the world to become a better place.";

    buildIntro(String content) {
      return Padding(
        padding: EdgeInsets.only(bottom: height * .02),
        child: Text(content),
      );
    }

    buildName() {
      return RichText(
          text: TextSpan(children: [
        WidgetSpan(
            child: Container(
          child: Text("Hi, I am ",style: TextStyle(fontSize: height*.03,fontWeight: FontWeight.w500),),
          padding: EdgeInsets.symmetric(vertical: height * .01),
        )),
        WidgetSpan(
            child: Container(
          child: Text("Akash Lilhare",style: TextStyle(fontSize: height*.03,fontWeight: FontWeight.w500),),
          padding: EdgeInsets.all(height * .01),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              color: Colors.blue.shade100),
        ))
      ]));
    }

    buildDownloadButton(){
      return CustomButton(onTap: (){}, title: "Download CV");
    }

    return Container(
      padding: AppPadding(context: context).mainPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height*.02,),

        buildName(),
        SectionSubHeader(title: "Flutter Developer"),
        buildIntro(p1),
        buildIntro(p2),
        buildIntro(p3),
        buildDownloadButton(),
        SizedBox(height: height*.02,),
      ],
    ));
  }
}
