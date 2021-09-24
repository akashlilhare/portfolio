import 'package:flutter/material.dart';
import 'package:portfoli/models/important_link_model.dart';
import 'package:portfoli/pages/project_page/project_page.dart';
import 'package:portfoli/utils/responsive.dart';

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

     List<ImportantLink> importantLinks = [
    ImportantLink(
    link: "Home", onTap: (BuildContext context)=>Navigator.pushNamed(context, "/")),

    ImportantLink(
    link: "About", onTap: (BuildContext context)=>Navigator.pushNamed(context, AboutPage.routeName)),

    ImportantLink(
    link: "Project", onTap: (BuildContext context)=>Navigator.pushNamed(context, ProjectPage.routeName)),

    ImportantLink(
    link: "Contacts", onTap: (BuildContext context)=>Navigator.pushNamed(context, ContactPage.routeName)),

    ];

    List<ImportantLink> contactInfo = [
      ImportantLink(link: "+91-9669395879", onTap: onTap),
      ImportantLink(link: "akashlilhare14@gmail.com", onTap: onTap),
      ImportantLink(link: "Durg, India", onTap: onTap),
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
            "A freelance web designer and developer from Chittagong, Bangladesh. I always make websites that have unique designs and also has a good performance rate.",
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
                        primary: Colors.white,
                        padding: const EdgeInsets.only(right: 20)),
                    onPressed:(){ item.onTap(context);},
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
      color: ThemeData.light().primaryColor,
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
