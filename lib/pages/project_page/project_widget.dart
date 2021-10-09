import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfoli/constants/constants.dart';
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

    buildTag() {
      return Wrap(
          children: projectTags
              .map((tag) => Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: FilterChip(
                        showCheckmark: false,
                        selected: tag.isSelected,
                        selectedColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: tag.isSelected
                                    ? Constants.darkPrimaryColor
                                    : Colors.blue.shade50),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 8),
                        backgroundColor: Colors.transparent,
                        label: Text(
                          tag.title,
                          style: TextStyle(
                              color: tag.isSelected
                                  ? Constants.darkPrimaryColor
                                  : Colors.black54),
                        ),
                        onSelected: (val) {
                          searchByTag(tag.title);
                          setState(() => tag.isSelected = val);
                        }),
                  ))
              .toList());
    }

    buildSearchBox() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: Constants.darkPrimaryColor)),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(border: InputBorder.none),
          onChanged: (input) => searchProject(input),
        ),
      );
    }

    buildProjectCard() {
      return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: projects.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getCrossAxisCount(),
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => showDialog(
                context: context,
                builder: (context) => ProjectDetailBox(
                      index: index,
                    )),
            child: Card(
              color: Constants.darkPrimaryColor,
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
                          Text(
                            projects[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: height * 0.025),
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Text(
                            projects[index].subtitle,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white),
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
          );
        },
      );
    }

    buildTitle(String title) {
      return Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle("Search Project"),
          SizedBox(height: 8,),
          buildSearchBox(),
          SizedBox(height: 16,),
          buildTitle("Project Type"),
          SizedBox(height: 2,),
          buildTag(),
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