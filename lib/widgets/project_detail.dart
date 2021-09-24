import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfoli/database/project_database.dart';
import 'package:sizer/sizer.dart';

class ProjectDetailBox extends StatelessWidget {
  final int index;

  const ProjectDetailBox({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildFeatures() {
      return projectList[index]
          .features
          .map((feature) => Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 20,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(feature)
                    ],
                  ),
                  SizedBox(
                    height: .5.h,
                  ),
                ],
              ))
          .toList();
    }

    buildTechUsed() {
      return Row(
          children: projectList[index]
              .techUsed
              .map((tech) => Tooltip(
            message:tech.title,
                child: Container(
                  padding:  EdgeInsets.all( 1.h),
                  margin:EdgeInsets.only(right: 2.h) ,
                  decoration: BoxDecoration(
                    borderRadius:const BorderRadius.all(Radius.circular(12)),
                    color: Colors.blue.shade100,

                  ),
                  child: ClipRRect(
                        child: Image.asset(tech.imageSrc,height: 5.h,width: 5.h,),
                      ),
                ),
              ))
              .toList());
    }

    buildSourceButton(){
      List<ElevatedButton> btnList =[];
      var currItem = projectList[index].projectSrc;

      if(currItem[0] !=""){
        btnList.add(ElevatedButton.icon(onPressed: (){}, label: Text("Github"),icon: Icon(FeatherIcons.github,)));
      }
      if(currItem[0] !=" "){
        btnList.add(ElevatedButton.icon(onPressed: (){}, label: Text("PlayStore"),icon: Icon(FeatherIcons.play,)));
      }
      if(currItem[0] !=" "){
        btnList.add(ElevatedButton.icon(onPressed: (){}, label: Text("WebSite"),icon: Icon(FeatherIcons.globe,)));
      }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ...btnList.map((btn) => Padding(
          padding:  EdgeInsets.only(right: 2.w),
          child: btn,
        )).toList()
      ],
    );


    }

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal:40.w,vertical: 0.h),
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  projectList[index].title,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 2.5.w),
                ),
                Spacer(),
                IconButton(
                  tooltip: "Close",
                icon:  Icon(Icons.cancel_outlined,color: Colors.black54,),
                  onPressed: ()=>Navigator.pop(context),

                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            buildTechUsed(),
            SizedBox(
              height: 2.h,
            ),
            Text(projectList[index].subtitle),
            SizedBox(
              height: 2.h,
            ),
            ...buildFeatures(),
            SizedBox(
              height: 2.h,
            ),
            buildSourceButton(),
          ],
        ),
      ),
    );
  }
}
