import 'package:flutter/material.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/models/important_link_model.dart';
import 'package:portfoli/pages/project_page/project_page.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about_page/about_page.dart';
import 'contact_page/contact_page.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Function onTap = () {

    };

    void launchURL(url) async =>
        await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

     List<ImportantLink> importantLinks = [
    ImportantLink(
    link: "Home", onTap: ()=>Navigator.pushNamed(context, "/")),

    ImportantLink(
    link: "About", onTap: ()=>Navigator.pushNamed(context, AboutPage.routeName)),

    ImportantLink(
    link: "Project", onTap: ()=>Navigator.pushNamed(context, ProjectPage.routeName)),

    ImportantLink(
    link: "Contacts", onTap: ()=>Navigator.pushNamed(context, ContactPage.routeName)),

    ];

    List<ImportantLink> contactInfo = [
      ImportantLink(link: "+91-9669395879", onTap: ()=>launchURL("tel:+1 555 010 999")),
      ImportantLink(link: "akashlilhare14@gmail.com", onTap: ()=>launchURL("mailto:akashlilhare14@gmail.com")),
      ImportantLink(link: "Durg, India", onTap:()=> launchURL("https://www.google.com/maps/search/?api=1&query=21.1904,81.2849")),
    ];

    List<ImportantLink> socialLinks = [
      ImportantLink(link: "Github", onTap: onTap),
      ImportantLink(link: "Linkedin", onTap: onTap),
      ImportantLink(link: "Twitter", onTap: onTap),
    ];

    buildName() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * .05,
          ),
          const Text(
            "Akash Lilhare",
            style: TextStyle(
                letterSpacing: 2,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          SizedBox(
            height: height * .02,
          ),
          const Text(
            "A full stack developer from Durg, India. I always make product that have unique designs and also has a good performance rate.",
            style: TextStyle(
                letterSpacing: 1.5,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ],
      );
    }

    buildLinkButton(String title, List<ImportantLink> link) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * .05,
          ),
          Text(
            title,
            style: const TextStyle(
                letterSpacing: 2,
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: height * .02,
          ),
          ...link
              .map((item) => TextButton(

                    style: TextButton.styleFrom(
                      alignment:Alignment.centerLeft ,
                        primary: Colors.white,
                        minimumSize: Size(600,50),
                        padding: const EdgeInsets.only(right: 20)),
                    onPressed:(){ item.onTap();},

                    child: Text(
                      item.link,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5),
                    ),
                  ))
              .toList()
        ],
      );
    }

    buildCopyRight() {
      String currYear = DateTime.now().year.toString();
      return Column(
        children: [
          SizedBox(
            height: height * .05,
          ),
          Text(
            "© $currYear - Akash Lilhare | Designed By Akash Lilhare",
            style: const TextStyle(color: Colors.white54),
          ),
          SizedBox(
            height: height * .02,
          ),
        ],
      );
    }

    return Container(
      color: Constants.darkPrimaryColor,
      padding: AppPadding(context: context).mainPadding(),
      child: width <= 950
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildName(),
                buildLinkButton("Important Links", importantLinks),
                buildLinkButton("Social Links", socialLinks),
                buildLinkButton("Contact Info", contactInfo),
                buildCopyRight()
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: buildName()),
                    SizedBox(
                      width: width * .03,
                    ),
                    Expanded(
                        child:
                            buildLinkButton("Important Links", importantLinks)),
                    SizedBox(
                      width: width * .01,
                    ),
                    Expanded(
                        child: buildLinkButton("Social Links", socialLinks)),
                    SizedBox(
                      width: width * .01,
                    ),
                    Expanded(
                        child: buildLinkButton("Contact Info", contactInfo)),
                  ],
                ),
                buildCopyRight(),
              ],
            ),
    );
  }
}
