import 'package:flutter/material.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/seaction_sub_header.dart';

class CourseWork extends StatelessWidget {
  const CourseWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);

    List<String> courses = [
      "DataBase Management System (DBMS)",
      "Data Structure And Algorithm (DSA)",
      "Operating System",
      "Object Oriented Programing",
    ];

    int getCrossCount() => width > 950
        ? 2
        : width > 725
        ? 1
        : 1;



    buildCourseWork(){
      return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: courses.length,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getCrossCount(),
          crossAxisSpacing: width*.1,
          childAspectRatio: 1/5,

          mainAxisSpacing: 0,

          mainAxisExtent: 70,
        ),
        itemBuilder: (BuildContext context, int index) {
          return

            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(right: 0,bottom: 16),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),

                  ),
                  border:
                  Border.all(color: theme.colorScheme.secondaryVariant)),
              child: Text(courses[index],style:  theme.textTheme.headline1!.copyWith(fontSize:width>750? 18:16,fontWeight: FontWeight.w600),maxLines: 1,overflow: TextOverflow.ellipsis,),

          );
        },
      );
    }

    return Container(
        padding: CustomResponsiveBuilder(context: context).mainPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionSubHeader(title: "Course Work"),
            buildCourseWork(),
            SizedBox(
              height: height * .03,
            ),


          ],
        ));
  }
}
