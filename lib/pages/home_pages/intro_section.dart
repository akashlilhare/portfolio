import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/custom_button.dart';

class IntroSection extends StatelessWidget {
  final ScrollController scrollController;

  const IntroSection({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    buildSocialButton() {
      socialButton(
          {required IconData icon,
          required String title,
          required Function onTap}) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: IconButton(tooltip: title,
            onPressed: () => onTap(),
            icon: Icon(icon,color: Colors.blue,),
            // tooltip: title,
          ),
        );
      }

      return SizedBox(
        child: Column(
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
        ),
      );
    }

    buildButton() {
      return CustomButton(
        onTap: () {},
        title: "Contact Me",
      );
    }

    buildHeaderText() {
      return Padding(
        padding:  EdgeInsets.only(right: width*.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, I am Akash Lilhare",
              style: TextStyle(fontSize: height * .04,fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Full Stack Developer",
              style: TextStyle(fontSize: height * .03,color: Colors.black87),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "I'm Durg base Flutter developer. I like to code things from scratch, and enjoy bringing ideas to life in the browser.",
              style: TextStyle(fontSize: height * 0.02,color: Colors.grey),
              textAlign: TextAlign.start,
            ),

          ],
        ),
      );
    }

    buildImage() {
      return Container(
        height: width * .3,
        width: width * .3,
        child: Image.asset("assets/dev4.gif"),
      );
    }



    buildSwipeButton() {
      return Column(
        children: [
          Center(
            child: Container(
                height: height * .1,
                child: InkWell(
                    onTap: () {
                      scrollController.animateTo(height,
                          duration: Duration(milliseconds: 500), curve: Curves.ease);
                    },
                    child: Image.asset("assets/swipe/swipe3.gif"))),
          ),

          SizedBox(
            height: height * .1,
          ),
        ],
      );
    }

    return Container(
        padding: EdgeInsets.symmetric(horizontal: width*.05),
        height: height,
        child: width <= 725
            ? Padding(
          padding: EdgeInsets.only(right: 0.08*width,left: 0.03*width),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: height *0.15,),
                  Row(
                    children: [
                      buildSocialButton(),
                      SizedBox(width: width *0.05,),
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
                  const Spacer(),
                   buildSwipeButton(),
                ],
              ),
            )
            : Padding(
              padding: AppPadding(context: context).mainPadding(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * .22,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        buildSocialButton(),

                        SizedBox(
                          width: width * .05,
                        ),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildHeaderText(),
                            SizedBox(
                              height: height*.05,
                            ),
                            buildButton(),
                          ],
                        )),

                        SizedBox(
                          width: width * .05,
                        ),
                        Expanded(
                          child: buildImage(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .05,
                    ),


                    Spacer(),
                   buildSwipeButton()

                  ],
                ),
            ));
  }
}