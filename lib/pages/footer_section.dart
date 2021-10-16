import 'package:flutter/material.dart';
import 'package:portfoli/constants/app_theme.dart';
import 'package:portfoli/constants/personal_info.dart';
import 'package:portfoli/models/important_link_model.dart';
import 'package:portfoli/pages/project_page/project_page.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about_page/about_page.dart';
import 'contact_page/contact_page.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersonalInfo info = PersonalInfo();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;


    void launchURL(url) async => await canLaunch(url)
        ? await launch(url)
        : throw 'Could not launch $url';

    List<ImportantLink> importantLinks = [
      ImportantLink(
          link: "Home", onTap: () => Navigator.pushNamed(context, "/")),
      ImportantLink(
          link: "About", onTap: ()=>Navigator.pushNamed(context, AboutPage.routeName)),

      ImportantLink(
          link: "Project", onTap: ()=>Navigator.pushNamed(context, ProjectPage.routeName)),

      ImportantLink(
          link: "Contacts", onTap: ()=>Navigator.pushNamed(context, ContactPage.routeName)),

    ];

    List<ImportantLink> contactInfo = [
      ImportantLink(
          link: "+91 ${info.phone}",
          onTap: () => launchURL("tel: +91 ${info.phone}")),
      ImportantLink(
          link: info.email, onTap: () => launchURL("mailto:${info.email}")),
      ImportantLink(
          link: "${info.location}, India",
          onTap: () => launchURL(
              "https://www.google.com/maps/search/?api=1&query=${info.locLat},${info.locLong}")),
    ];

    List<ImportantLink> socialLinks = [
      ImportantLink(link: "Github", onTap: () => launchURL(info.github)),
      ImportantLink(link: "Linkedin", onTap: () => launchURL(info.linkedin)),
      ImportantLink(link: "Twitter", onTap: () => launchURL(info.twitter)),
    ];

    buildName() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * .05,
          ),
           Text(
            "Akash Lilhare",
            style: theme.textTheme.headline1!.copyWith(
                letterSpacing: 2,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
          ),
          SizedBox(
            height: height * .02,
          ),
           Text(
            "A full stack developer from Durg, India. I always make product that have unique designs and also has a good performance rate.",
            style: theme.textTheme.headline2!.copyWith(
                letterSpacing: 1.5,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                ),
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
            style:  theme.textTheme.headline2!.copyWith(
                letterSpacing: 2,
                fontSize: 18,
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
                minimumSize: const Size(600,50),
                padding: const EdgeInsets.only(right: 20)),
            onPressed:(){ item.onTap();},

            child: Text(
              item.link,
              textAlign: TextAlign.start,
              style: theme.textTheme.headline1!.copyWith(
                  fontSize: 16,
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
            style:theme.textTheme.headline1!.copyWith(fontSize: 14,fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: height * .02,
          ),
        ],
      );
    }

    return Container(
      color:isDark? theme.primaryColor :theme.textTheme.headline3!.color,
      padding: CustomResponsiveBuilder(context: context).mainPadding(),
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
