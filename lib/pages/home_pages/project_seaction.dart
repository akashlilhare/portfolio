import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/database/project_database.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/custom_button.dart';
import 'package:portfoli/widgets/project_detail.dart';
import 'package:portfoli/widgets/secation_header.dart';

class ProjectSection extends StatefulWidget {
  const ProjectSection({Key? key}) : super(key: key);

  @override
  _ProjectSectionState createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  int i1 = 0;
  late PageController _controller;
  double radius = 24;

  @override
  void initState() {
    _controller = PageController(initialPage: i1);
    super.initState();
  }

  _onLeftAction() {
    if (i1 > 0) {
      setState(() {
        i1--;
      });
      _controller.animateToPage(i1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate);
    }
  }

  _onRightAction() {
    if (i1 < projectList.length - 1) {
      setState(() {
        i1++;
      });
      _controller.animateToPage(i1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate);
    }
  }

  buildCard(PageController _controller, int currIdx, double height,
      double width, BuildContext context) {
    buildInfoCard(int index) {
      return Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              projectList[currIdx + index].title,
              style:
                  TextStyle(fontWeight: FontWeight.w700, fontSize: 0.02 * height),
            ),
            Padding(
                padding: EdgeInsets.all(0.015 * height),


                child: Text(
                  projectList[currIdx + index].subtitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                )
          ],
        ),
      );
    }

    buildImageCard(int index) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              projectList[currIdx + index].imageSrc,
              fit: BoxFit.cover,
              height: .4 * height,
              width: .4 * height,
            )),
      );
    }

    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: Container(
          height: height*.6,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(radius)),color: Constants.darkPrimaryColor),
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding(context: context).getSizedBox(5, 0, 0)),
          child: PageView.builder(
              itemCount: projectList.length,
              controller: _controller,
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 2/3,
                  child: Card(
                    elevation: 0,
                      color: Constants.darkPrimaryColor,
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
                  ),
                );
              }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          SectionHeader(title: "Projects", subTitle: "See my recent works"),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                color: i1==0? Colors.grey: Constants.darkPrimaryColor,
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () =>
                  i1!=0? _onLeftAction() : null
              ),

          
              buildCard(_controller, i1, height, width, context),

              IconButton(
                color: i1<projectList.length-1?  Constants.darkPrimaryColor:Colors.grey,
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  _onRightAction();
                },
              ),
            ],
          ),
          SizedBox(height: height*.02,),
          CustomButton(onTap: () {}, title: "View All"),
          SizedBox(height: height*.05,),
        ],
      ),
    );
  }
}
