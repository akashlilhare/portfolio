import 'package:flutter/material.dart';
import 'package:portfoli/constants/app_theme.dart';
import 'package:portfoli/database/project_database.dart';
import 'package:portfoli/pages/project_page/project_page.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/custom_button.dart';
import 'package:portfoli/widgets/project_detail.dart';
import 'package:portfoli/widgets/section_header.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    buildLeftButton() {
      return InkWell(
          onTap: () => _onRightAction(),
          child: Container(
            decoration: BoxDecoration(
                color: i1 >= projectList.length - 1
                    ? isDark
                    ? theme.colorScheme.primary
                    : theme.colorScheme.secondary : theme.colorScheme.primaryVariant,
                borderRadius:const BorderRadius.all(Radius.circular(8))),
            padding:const EdgeInsets.all(6),
            child: Icon(
              Icons.arrow_forward_ios,
              color: i1 < projectList.length - 1
                  ? theme.textTheme.headline3!.color
                  : isDark
                      ? Colors.grey
                      : Colors.white,
            ),
          ));
    }

    buildRightButton() {
      return InkWell(
        onTap: () => i1 != 0 ? _onLeftAction() : null,
        child: Container(
          decoration: BoxDecoration(
              color: i1 != 0
                  ? theme.colorScheme.primaryVariant
                  : isDark
                      ? theme.colorScheme.primary
                      : theme.colorScheme.secondary,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          padding: const EdgeInsets.all(6),
          child: Icon(
            Icons.arrow_back_ios,
            color: i1 == 0
                ? isDark
                    ? Colors.grey
                    : Colors.white
                : theme.textTheme.headline3!.color,
          ),
        ),
      );
    }

    buildButton() {
      return CustomButton(
          onTap: () => Navigator.pushNamed(context, ProjectPage.routeName),
          title: "View All");
    }

    buildVerticalCard() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              buildRightButton(),
              const SizedBox(
                width: 8,
              ),
              buildLeftButton(),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
          SizedBox(
            height: height * .02,
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            child: Container(
              height: height * .6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  color: theme.colorScheme.secondary),
              padding: EdgeInsets.symmetric(
                  horizontal: CustomResponsiveBuilder(context: context)
                      .getSizedBox(5, 0, 0)),
              child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: projectList.length,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) => ProjectDetailBox(
                                index: projectList[index].index,
                              )),
                      child: AspectRatio(
                        aspectRatio: 2 / 3,
                        child: Card(
                          elevation: 1,
                          color: theme.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(radius))),
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * .03),
                                  child: Column(
                                    children: [
                                      Text(
                                        projectList[index].title,
                                        style: theme.textTheme.headline3!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                      Text(
                                        projectList[index].subtitle,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.headline4!
                                            .copyWith(fontSize: 16),
                                      ),
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
                      ),
                    );
                  }),
            ),
          ),
        ],
      );
    }

    buildHorizontalCard() {
      buildImage(String imgSrc) {
        return Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          constraints: BoxConstraints(maxWidth: 600, maxHeight: height * .5),
          child: ClipRRect(
              borderRadius:const BorderRadius.all(Radius.circular(16)),
              child: Image.asset(imgSrc)),
        );
      }

      buildViewButton(int index) {
        return OutlinedButton(
          onPressed: () => showDialog(
                context: context,
                builder: (context) => ProjectDetailBox(
                      index: projectList[index].index,
                    )),
          style: ButtonStyle(
              side: MaterialStateProperty.all(BorderSide(
                  color: theme.colorScheme.secondaryVariant,
                  width: 1.0,
                  style: BorderStyle.solid))),


            child: Text("View Detail",style: theme.textTheme.headline2!.copyWith(fontSize: 14,fontWeight: FontWeight.w600),) ,);
      }

      buildContent(String title, String subTitle, int index) {
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5),
              )),
              SizedBox(
                height: height * .05,
              ),
              Flexible(
                  child: Text(subTitle,
                      style: const TextStyle(
                          color: Colors.blueGrey, letterSpacing: 1.5))),
              SizedBox(
                height: height * .05,
              ),
              buildViewButton(index)
            ],
          ),
        );
      }

      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: width > 1200
                ? width * .08
                : width > 900
                    ? width * .05
                    : 0),
        height: height * .6,
        child: Row(
          children: [
            buildRightButton(),
            SizedBox(
              width: width * .04,
            ),
            Expanded(
              child:
              PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: projectList.length,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        buildImage(projectList[index].imageSrc),
                        SizedBox(
                          width: width * .05,
                        ),
                        buildContent(projectList[index].title,
                            projectList[index].subtitle, index),
                      ],
                    );
                  }),
            ),
            SizedBox(
              width: width * .04,
            ),
            buildLeftButton(),
          ],
        ),
      );
    }

    return Padding(
      padding: CustomResponsiveBuilder(context: context).mainPadding(),
      child: Column(
        children: [
          const SectionHeader(
              title: "Projects", subTitle: "See my recent works"),
          width <= 625
              ? Column(
                  children: [
                    SizedBox(
                      height: height * .02,
                    ),
                    buildVerticalCard(),
                    SizedBox(
                      height: height * .02,
                    ),
                  ],
                )
              : buildHorizontalCard(),
          SizedBox(
            height: height * .01,
          ),
          buildButton(),
          SizedBox(
            height: height * .05,
          ),
        ],
      ),
    );
  }
}
