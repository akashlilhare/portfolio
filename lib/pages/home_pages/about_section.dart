import 'package:flutter/material.dart';
import 'package:portfoli/constants/personal_info.dart';
import 'package:portfoli/pages/about_page/about_page.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/custom_button.dart';
import 'package:portfoli/widgets/section_header.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 500;

    buildImage() {
      return SizedBox(
        height: isMobile ? height * .28 : width * .30,
        width: isMobile ? height * .28 : width * .30,
        child: Image.asset("assets/dev3.gif"),
      );
    }

    buildCard() {
      buildText() {
        return Text(
          "Full Stack developer, with good amount of experience, working in full stack development and delivering quality work.",
          style:CustomResponsiveBuilder(context: context).descriptionStyle(),
        );
      }

      buildNumberCard() {
        buildCard(String num, String title, String subtitle) {
          return Column(
            children: [
              Text(
                num,
                style: theme.textTheme.headline1!.copyWith(fontWeight: FontWeight.w700, fontSize: 22),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                title,
                style: theme.textTheme.headline2!.copyWith(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Text(subtitle,style:theme.textTheme.headline2!.copyWith(fontWeight: FontWeight.w500,fontSize: 16),)
            ],
          );
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildCard("02+", "years", "experience"),
            buildCard("05+", "completed", "project"),
            buildCard("02+", "companies", "worked"),
          ],
        );
      }

      

      buildButton() {
        void launchURL(url) async => await canLaunch(url)
            ? await launch(url)
            : throw 'Could not launch $url';

        return Column(

          children: [
            SizedBox(height:height*  .03,),
            CustomButton(
              onTap: () =>launchURL(PersonalInfo().resume),
              title: "Download Resume",
            ),
            SizedBox(height:height* .01,),

            CustomButton(
         onTap: ()=>Navigator.pushNamed(context, AboutPage.routeName),
              title: "Read More",
            ),


          ],
        );
      }

      return Column(
        children: [
          buildText(),
          SizedBox(
            height: height * .04,
          ),
          buildNumberCard(),
          buildButton()
         
        ],
      );
    }

    return Padding(
      padding: CustomResponsiveBuilder(context: context).mainPadding(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .04,
            ),
            const SectionHeader(
                title: "About Me", subTitle: "Let me introduce myself"),
            width > 725
                ? Row(
                children: [
                  buildImage(),
                  SizedBox(
                    width: width * .1,
                  ),
                  Expanded(child: buildCard()),
                ],
                  )
                : Column(
                    children: [
                      buildImage(),
                      SizedBox(
                        height: height * .05,
                      ),
                      buildCard()
                    ],
                  ),
            SizedBox(
              height: height * .05,
            ),
          ],
        ),
      ),
    );
  }
}
