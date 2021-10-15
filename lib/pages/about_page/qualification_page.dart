import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/database/qualification.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/seaction_sub_header.dart';
import 'package:timelines/timelines.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AboutQualification extends StatefulWidget {
  const AboutQualification({Key? key}) : super(key: key);

  @override
  State<AboutQualification> createState() => _AboutQualificationState();
}

class _AboutQualificationState extends State<AboutQualification> {
  int switchIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double getPadding() {
      if (width < 650) {
        return width * .03;
      } else {
        return width * .05;
      }
    }

    buildSwitchButton() {
      return Center(
        child: ToggleSwitch(
          cornerRadius: 10.0,
          initialLabelIndex: switchIndex,
          minHeight: 42,
          minWidth: 125,
          activeFgColor:theme.textTheme.headline3!.color,
          inactiveBgColor: theme.colorScheme.secondary,
          inactiveFgColor: theme.textTheme.headline2!.color,
          activeBgColor: [
            theme.colorScheme.primaryVariant,
            theme.colorScheme.primaryVariant,
          ],

          totalSwitches: 2,
          radiusStyle: true,
          labels: const [
            'Education',
            'Work Experience',
          ],
          onToggle: (index) {
            setState(() {
              switchIndex = index;
            });
          },
        ),
      );
    }

    buildContent(int index) {
      List<Qualification> items = switchIndex == 0 ? educationList : workList;
      return Container(
        padding: EdgeInsets.only(
            left: index % 2 == 0 ? getPadding() : 0,
            right: index % 2 != 0 ? getPadding() : 0,
            top: height * .05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              items[index].title,
              style: theme.textTheme.headline1!.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              items[index].subTitle,
              style: theme.textTheme.headline2!.copyWith(fontSize: 15,fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 12,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment:  index % 2 == 0
                  ? WrapAlignment.end
                  : WrapAlignment.end,
              children: [
                 Icon(
                  Icons.calendar_today,
                  color:theme.textTheme.headline2!.color
                ),
                SizedBox(width: width * .01),
                Text(
                  items[index].date[0],
                    style: theme.textTheme.headline2!.copyWith(fontSize: 15),
                ),
                Text(
                  items[index].date[1],
                  style: theme.textTheme.headline2!.copyWith(fontSize: 15),
                )
              ],
            )
          ],
        ),
      );
    }

    buildTimeLine() {
      return FixedTimeline.tileBuilder(
        builder: TimelineTileBuilder.connected(
          indicatorPositionBuilder: (context, index) => 0.3,
          connectionDirection: ConnectionDirection.before,
          contentsAlign: ContentsAlign.alternating,
          contentsBuilder: (context, index) => buildContent(index),
          connectorBuilder: (_, index, __) =>  SolidLineConnector(color: theme.colorScheme.primaryVariant,),
          indicatorBuilder: (_, index) => Indicator.dot(color: theme.colorScheme.primaryVariant,),
          itemCount: switchIndex == 0 ? educationList.length : workList.length,
        ),
      );
    }

    return Container(
      padding: CustomResponsiveBuilder(context: context).mainPadding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * .05,
          ),
          const SectionSubHeader(title: "Qualification"),
          buildSwitchButton(),
          buildTimeLine()
        ],
      ),
    );
  }
}
