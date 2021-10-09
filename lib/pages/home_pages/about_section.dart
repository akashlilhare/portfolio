import 'package:flutter/material.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/custom_button.dart';
import 'package:portfoli/widgets/secation_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 500;

    buildImage() {
      return Container(
        height: isMobile ? height * .3 : width * .30,
        width: isMobile ? height * .3 : width * .30,
        child: Image.asset("assets/dev3.gif"),
      );
    }

    buildCard() {
      buildText() {
        return Text(
          "Full Stack developer, with good amount of experience, working in full stack development and delivering quality work.",
          style: TextStyle(fontSize: 18, color: Colors.black54),
        );
      }

      buildNumberCard() {
        buildCard(String num, String title, String subtitle) {
          return Container(
            child: Column(
              children: [
                Text(
                  num,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.black54),
                ),
                Text(subtitle, style: TextStyle(color: Colors.black54))
              ],
            ),
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
        return Column(

          children: [
            SizedBox(height:height*  .03,),
            CustomButton(
              onTap: () {},
              title: "Download Resume",
            ),
            SizedBox(height:height* .02,),

            CustomButton(
              onTap: () {},
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
      padding: AppPadding(context: context).mainPadding(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .05,
            ),
            const SectionHeader(
                title: "About Me", subTitle: "Let me introduce myself"),
            width > 725
                ? Container(
                    child: Row(
                    children: [
                      buildImage(),
                      SizedBox(
                        width: width * .1,
                      ),
                      Expanded(child: buildCard()),
                    ],
                  ))
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
