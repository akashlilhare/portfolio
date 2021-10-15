import 'package:flutter/material.dart';
import 'package:portfoli/constants/app_theme.dart';
import 'package:portfoli/constants/personal_info.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/custom_button.dart';
import 'package:portfoli/widgets/seaction_sub_header.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutHeader extends StatelessWidget {
  const AboutHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersonalInfo info = PersonalInfo();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;

    var theme = Theme.of(context);
    String p1 =
        "I am from ${info.location}, India. A place of beauty and nature. Since my childhood, i love art and design. I always try to design stuff with my unique point of view. I also love to create things that can be useful to others.";
    String p2 =
        "I started coding since I was in high school. Coding is also an art for me. I love it and now I have the opportunity to design along with the coding. I find it really interesting and I enjoyed the process a lot.";
    String p3 =
        "My vision is to make the world a better place. Now almost everything is becoming better than ever. It is time for us to create more good stuff that helps the world to become a better place.";

    buildIntro(String content) {
      return Padding(
        padding: EdgeInsets.only(bottom: height * .02),
        child: Text(
          content,
          style: CustomResponsiveBuilder(context: context).descriptionStyle().copyWith(fontSize: width <1100?16:18),
        ),
      );
    }

    buildImage(){
      return SizedBox(
          child: Image.asset(
        "assets/dev6.gif",

      ));
    }

    buildName() {
      return RichText(
          text: TextSpan(children: [
        WidgetSpan(
            child: Container(
          child: Text(
            "Hi,\nI am ",
            style:
            theme.textTheme.headline1!.copyWith(fontSize: 28, fontWeight: FontWeight.w900,letterSpacing: 1.5),
          ),
          padding: EdgeInsets.symmetric(vertical: height * .01),
        )),
        WidgetSpan(
            child: Container(
          child: Text(
            "Akash Lilhare",
            style:
            theme.textTheme.headline1!.copyWith(fontSize: 28, fontWeight: FontWeight.w900,letterSpacing: 1.5),
          ),
          padding: EdgeInsets.all(height * .01),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              color:theme.colorScheme.secondary),
        ))
      ]));
    }

    buildDownloadButton() {
      void launchURL(url) async => await canLaunch(url)
          ? await launch(url)
          : throw 'Could not launch $url';

      return CustomButton(
        onTap: () => launchURL(PersonalInfo().resume),
        title: "Download Resume",
      );
    }

    buildHeader() {
      return width > 950
          ? Column(
              children: [

                Row(
                  children: [
                    Expanded(
                      flex: width<1200 ? 1:2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildName(),
                          SizedBox(
                            height: height * .04,
                          ),
                          buildIntro(p1),
                          buildIntro(p2),
                          buildIntro(p3),
                          SizedBox(
                            height: height * .02,
                          ),
                          buildDownloadButton(),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * .05,
                    ),
                    Expanded(
                        flex: width>1200 ? 2:1,

                        child: buildImage()),
                  ],
                ),

              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildName(),
                SizedBox(
                  height: height * .04,
                ),
                buildImage(),
                SizedBox(
                  height: height * .04,
                ),
                buildIntro(p1),
                buildIntro(p2),
                buildIntro(p3),
                SizedBox(
                  height: height * .02,
                ),
                buildDownloadButton(),
              ],
            );
    }

    return Container(
        padding: CustomResponsiveBuilder(context: context).mainPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .08,
            ),

            buildHeader(),

            SizedBox(
              height: height * .02,
            ),
          ],
        ));
  }
}
