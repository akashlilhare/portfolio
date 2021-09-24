import 'package:flutter/material.dart';
import 'package:portfoli/database/project_database.dart';
import 'package:portfoli/utils/responsive.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    AppPadding appPadding = AppPadding(context: context);
    double radius = 24;
    int getCrossAxisCount() {
      if (width >= 950) {
        return 3;
      } else if (width >= 725) {
        return 2;
      } else {
        return 1;
      }
    }

    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
      padding: appPadding.mainPadding(),
      shrinkWrap: true,
      itemCount: projectList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getCrossAxisCount(),
          childAspectRatio: 2/3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius))),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius),
                        topRight: Radius.circular(radius)),
                    child: Image.asset(
                      projectList[index].imageSrc,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  )),
              SizedBox(
                height: height * .02,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .03),
                  child: Column(
                    children: [
                      Text(
                        projectList[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: height * 0.025),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Text(projectList[index].subtitle,maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white),),
                      SizedBox(
                        height: height * .01,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
