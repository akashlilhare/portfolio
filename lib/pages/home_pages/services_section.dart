import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfoli/constants/app_theme.dart';
import 'package:portfoli/models/services_model.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/section_header.dart';
import 'package:provider/provider.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    var theme = Theme.of(context);

    List<Service> services = [
      Service(
          title: "App Development",
          subTitle:
              "I develop mobile application. I create mobile app with eye catching ui.",
          icon: FontAwesomeIcons.mobileAlt),
      Service(
          title: "Ui/Ux Design",
          subTitle:
              "I do ui/ux design for the mobile and website that helps website and mobile app to get a unique look.",
          icon: FontAwesomeIcons.quidditch),
      Service(
          title: "Web Development",
          subTitle:
              "I also develop websites. I create high performance website with blazing fast speed.",
          icon: FontAwesomeIcons.code),
    ];

    buildServices() {
      buildService(Service service) {
        return Container(
          margin: EdgeInsets.only(left: width*.02,right:  width*.02,bottom: height*.02),
          padding: EdgeInsets.all(width * .04),
          decoration: BoxDecoration(
              borderRadius:const BorderRadius.all(Radius.circular(16)),
              color: theme.colorScheme.secondary),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: height * .01),
              Icon(
                service.icon,
                color:isDark?theme.textTheme.headline1!.color: theme.textTheme.headline2!.color!.withOpacity(.8),
              ),
              SizedBox(height: height * .02),
              Text(
                service.title,
                textAlign: TextAlign.center,
                style: theme.textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.w600, fontSize:20
              ),),
              SizedBox(height: height * .01),

              Text(
                service.subTitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.headline2!.copyWith(fontSize: 15,letterSpacing: 1.2),
              ),
              SizedBox(height: height * .01),
            ],
          ),
        );
      }

      return services.map((service) {
        return width >= 750
            ? Expanded(
                child: buildService(service),
              )
            : buildService(service);
      }).toList();
    }

    return Column(
      children: [
        const SectionHeader(title: "Services", subTitle: "What i will do for you"),
        Container(
            padding: CustomResponsiveBuilder(context: context).mainPadding(),
            child: width >= 750
                ? Row(children: buildServices())
                : Column(
                    children: buildServices(),
                  )),
      ],
    );
  }
}
