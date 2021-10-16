import 'package:flutter/material.dart';
import 'package:portfoli/database/project_database.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/project_detail.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({Key? key}) : super(key: key);

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  final _controller = TextEditingController();
  List<Project> projects = [];
  Set<String> allTag = {};
  List<ProjectTag> projectTags = [];

  @override
  void initState() {
    projects.addAll(projectList);
    initAllTag();
    initTagList();
    super.initState();
  }

  initAllTag() {
    for (var project in projectList) {
      for (var element in project.tag) {
        allTag.add(element);
      }
    }
  }

  initTagList() {
    int i=0;
    for (String tag in allTag) {
      projectTags.add(ProjectTag(title: tag, isSelected:i==0?true: false));
      i++;
    }

  }

  searchByTag(String inputTag) {
    projects = [];
    for(ProjectTag projectTag in projectTags){
      if(!projectTag.isSelected){
        for (var project in projectList) {
          for (var tag in project.tag) {
            if (tag == projectTag.title) {
              projects.add(project);
              continue;
            }
          }
        }
      }
    }

    setState(() {});
  }

  searchProject(String input) {
    projects = [];
    for (var project in projectList) {
      if (project.title.toLowerCase().contains(input)) {
        projects.add(project);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
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

    buildSearchBox() {
      return Padding(
        padding:  EdgeInsets.symmetric(horizontal:width>950 ?width*.2: 8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              //  color: Colors.blue.shade50,
              borderRadius:const BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: theme.colorScheme.secondaryVariant, width: 1.5)),
          child: TextField(
            controller: _controller,
            cursorColor: theme.colorScheme.secondaryVariant,
            decoration:  InputDecoration(

                border: InputBorder.none,
                hintText: "Project Name",
                icon: Icon(
                  Icons.search,
                  color:theme.colorScheme.secondaryVariant,
                )),
            onChanged: (input) => searchProject(input),
          ),
        ),
      );
    }

    buildProjectCard() {
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: projects.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getCrossAxisCount(),
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus ) {
                currentFocus.focusedChild!.unfocus();
              }else {
                showDialog(
                    context: context,
                    builder: (context) =>
                        ProjectDetailBox(
                          index: projects[index].index,
                        ));
              }    },
            child: Card(
              color: theme.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius))),
              child: Column(
                children: [
                  Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(radius),
                            topRight: Radius.circular(radius)),
                        child: Image.asset(
                          projects[index].imageSrc,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      )),
                  SizedBox(
                    height: height * .02,
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * .03),
                      child: Column(
                        children: [
                          const Spacer(),
                          Text(
                            projects[index].title,
                            style: theme.textTheme.headline3!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          const    Spacer(),
                          Text(
                            projects[index].subtitle,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.headline4!.copyWith(fontSize: width>725?16:14),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }



    return Padding(
      padding: CustomResponsiveBuilder(context: context).mainPadding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildSearchBox(),
          SizedBox(
            height: height * .03,
          ),
          buildProjectCard()
        ],
      ),
    );
  }
}

class ProjectTag {
  String title;
  bool isSelected;

  ProjectTag({required this.title, required this.isSelected});
}