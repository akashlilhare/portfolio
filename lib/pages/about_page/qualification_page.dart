import 'package:flutter/material.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/database/qualification.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/seaction_sub_header.dart';
import 'package:timelines/timelines.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AboutQualification extends StatelessWidget {
  const AboutQualification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

  double  getPadding(){
      if(width < 650){
        return width* .03;
      }else{
        return width* .05;
      }
    }

    buildContent(int index) {
      return Container(
        padding: EdgeInsets.only(
            left: index % 2 == 0 ? getPadding()  : 0,
            right: index % 2 != 0 ? getPadding() : 0,
            bottom: height * .1),
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              qualificationList[index].title,
              style: TextStyle(
                  fontSize: height * .025, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: height * .01,
            ),
            Text(
              qualificationList[index].subTitle,
              style: const TextStyle(color: Colors.blueGrey),
            ),
            SizedBox(
              height: height * .03,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment:  index % 2 == 0
            ? WrapAlignment.end
                : WrapAlignment.end,
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Colors.blueGrey,
                ),
                SizedBox(width: width * .01),
                Text(
                  qualificationList[index].date[0],
                  style: const TextStyle(color: Colors.blueGrey),
                ),
                Text(
                  qualificationList[index].date[1],
                  style: const TextStyle(color: Colors.blueGrey),
                )
              ],
            )
          ],
        ),
      );
    }

    buildcertificate() {
      return
        Column(
            children:
            qualificationList
                .map((certificate) => Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(border:Border.all(color: Constants.lightPrimaryColor), borderRadius: BorderRadius.all(Radius.circular(16)),),
              child: ExpansionTile(
                expandedAlignment: Alignment.bottomCenter,


                expandedCrossAxisAlignment:CrossAxisAlignment.end ,

                title: Text(
                  certificate.title,
                ),

                children: [Text(certificate.subTitle)],
              ),
            ))
                .toList());
    }

    return Container(
      padding: AppPadding(context: context).mainPadding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height*.05,),
          const SectionSubHeader(title: "Qualification"),
          buildcertificate()
          // Center(
          //   child: ToggleSwitch(
          //     initialLabelIndex: 0,
          //     totalSwitches: 3,
          //     labels: ['America', 'Canada', 'Mexico'],
          //     onToggle: (index) {
          //       print('switched to: $index');
          //     },
          //   ),
          // ),
          // FixedTimeline.tileBuilder(
          //   builder: TimelineTileBuilder.connected(
          //     indicatorPositionBuilder: (context, index) => 0.3,
          //     connectionDirection: ConnectionDirection.before,
          //     contentsAlign: ContentsAlign.alternating,
          //     contentsBuilder: (context, index) => buildContent(index),
          //     connectorBuilder: (_, index, __) => const SolidLineConnector(),
          //     indicatorBuilder: (_, index) => Indicator.dot(),
          //     itemCount: qualificationList.length,
          //   ),
          // ),
        ],
      ),
    );
  }
}
