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

    buildImage() {
      return Container(
        height: width * .30,
        width: width * .30,
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
                SizedBox(
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

      buildButton(String title) {
        return CustomButton(
          onTap: () {},
          title: title,
        );
      }

      return Column(
        children: [
          buildText(),
          SizedBox(
            height: height * .04,
          ),
          buildNumberCard(),
          SizedBox(
            height: height * .03,
          ),
          buildButton("Download Resume"),
          SizedBox(
            height: height * .02,
          ),
          buildButton("Read More"),
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
            SectionHeader(
                title: "About Me", subTitle: "Let me introduce myself"),
            SizedBox(
              height: height * .1,
            ),
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
                        height: height * .1,
                      ),
                      buildCard()
                    ],
                  ),
            SizedBox(
              height: height * .1,
            ),
          ],
        ),
      ),
    );
  }
}
