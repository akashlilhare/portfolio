import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfoli/models/services_model.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/secation_header.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
              "I also develop the websites. I create high performance website with blazing fast speed.",
          icon: FontAwesomeIcons.code),
    ];

    buildServices() {
      buildService(Service service) {
        return Container(
          margin: EdgeInsets.all(height * .02),
          padding: EdgeInsets.all(width * .04),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.blue.shade100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                service.icon,
                color: Colors.blue,
              ),
              SizedBox(height: height * .03),
              Text(
                service.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: height * .025),
              ),
              SizedBox(height: height * .02),
              Text(
                service.subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              )
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
        SectionHeader(title: "Services", subTitle: "What i will do for you"),
        Container(
            padding: AppPadding(context: context).mainPadding(),
            child: width >= 750
                ? Row(children: buildServices())
                : Column(
                    children: buildServices(),
                  )),
      ],
    );
  }
}
