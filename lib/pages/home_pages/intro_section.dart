import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfoli/constants/personal_info.dart';
import 'package:portfoli/pages/contact_page/contact_page.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/swipe_button.dart';
import 'package:portfoli/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroSection extends StatefulWidget {
  final ScrollController scrollController;

  const IntroSection({Key? key, required this.scrollController})
      : super(key: key);

  @override
  State<IntroSection> createState() => _IntroSectionState();
}

class _IntroSectionState extends State<IntroSection> {
  bool showSwipeButton = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    PersonalInfo info = PersonalInfo();
    bool isMobile = width < 450;


    void launchURL(url) async => await canLaunch(url)
        ? await launch(url)
        : throw 'Could not launch $url';

    onSwipe() {

      setState(() {
        showSwipeButton = false;
      });
      widget.scrollController.animateTo(
          height <400? height * 1.5*.88 :height * .94,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }

    buildSocialButton() {
      socialButton(
          {required IconData icon,
          required String title,
          required Function onTap}) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: IconButton(
            tooltip: title,
            onPressed: () => onTap(),
            icon: Icon(
              icon,

            ),
            // tooltip: title,
          ),
        );
      }

      return SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: height * .18,
            ),
            socialButton(
                onTap: () => launchURL(info.linkedin),
                icon: FeatherIcons.linkedin,
                title: "Linkedin"),
            socialButton(
                onTap: () => launchURL(info.github),
                icon: FontAwesomeIcons.githubAlt,
                title: "Github"),
            socialButton(
                onTap: () => launchURL(info.twitter),
                icon: FeatherIcons.twitter,
                title: "Twitter"),
            socialButton(
                onTap: () => launchURL("mailto:${info.email}"),
                icon: Icons.email_outlined,
                title: "Email"),
          ],
        ),
      );
    }

    buildButton() {
      return CustomButton(
        onTap: () => Navigator.pushNamed(context, ContactPage.routeName),
        title: "Contact Me",
      );
    }

    buildHeaderText() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text:  TextSpan(children: [
              TextSpan(
                text: "Hi,\nI'am ",
                style:theme.textTheme.headline1!.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,),
              ),
              const WidgetSpan(
                  child: SizedBox(
                height: 28,
              )),
              TextSpan(
                text: "Akash",
                style:theme.textTheme.headline1!.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,),
              )
            ]),
          ),
          const SizedBox(
            height: 12,
          ),
          DefaultTextStyle(
              style:  theme.textTheme.headline1!.copyWith(
                  fontSize: 20.0,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TyperAnimatedText('A Student._'),
                  TyperAnimatedText('A Flutter Dev._'),
                  TyperAnimatedText('A Web Dev._'),
                ],
              )),
          const SizedBox(
            height: 40,
          ),
          Text(
            "I'm Durg base Full Stack developer. I like to code things from scratch, and enjoy bringing ideas to life in the browser.",
            style:CustomResponsiveBuilder(context: context).descriptionStyle(),
            textAlign: TextAlign.start,
          ),
        ],
      );
    }

    buildImage() {
      return Container(
        constraints:const BoxConstraints(maxHeight: 300) ,
        height: isMobile ? height * .3 : width * .3,
        width: isMobile ? height * .3 : width * .3,
        child: Image.asset("assets/dev6.gif"),
      );
    }

    return GestureDetector(
      onPanStart: (details) {
           onSwipe();

      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * .05),
        height:height <400? height * 1.5*.88 : height *.88,
        child: width <= 725
            ? Padding(
                padding: EdgeInsets.only(right: 0.02 * width, left: 0.0 * width),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Spacer(
                          flex: 2,
                        ),
                        Row(
                          children: [
                            buildSocialButton(),
                            SizedBox(
                              width: width * 0.05,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildHeaderText(),
                                  Center(
                                    child: buildImage(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * .05,
                        ),
                        buildButton(),
                        Spacer(flex: showSwipeButton? 2 : 3,),
                      ],
                    ),
                    if (showSwipeButton)
                      Column(
                        children: [
                          const Spacer(),
                          SwipeButton(onPress:()=> onSwipe,),
                        ],
                      ),
                  ],
                ),
              )
            : Padding(
                padding: CustomResponsiveBuilder(context: context).mainPadding(),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            buildSocialButton(),
                            SizedBox(
                              width: width * .05,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildHeaderText(),
                                SizedBox(
                                  height: height * .05,
                                ),
                                buildButton(),
                              ],
                            )),
                            SizedBox(
                              width: width * .05,
                            ),
                            Expanded(child: buildImage()),
                          ],
                        ),
                        const Spacer()


                      ],
                    ),
                    if (showSwipeButton)
                      Column(
                        children: [
                          const Spacer(),
                          SwipeButton(onPress:()=> onSwipe,),
                        ],
                      ),
                  ],
                ),
              ),
      ),
    );
  }
}
