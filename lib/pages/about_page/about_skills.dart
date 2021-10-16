import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:portfoli/constants/app_theme.dart';
import 'package:portfoli/database/skills_database.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/section_sub_header.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class AboutSkillsPage extends StatefulWidget {
  const AboutSkillsPage({Key? key}) : super(key: key);

  @override
  _AboutSkillsPageState createState() => _AboutSkillsPageState();
}

class _AboutSkillsPageState extends State<AboutSkillsPage>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  int currIdx = -1;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;

    var theme = Theme.of(context);
    CustomResponsiveBuilder appPadding =
        CustomResponsiveBuilder(context: context);

    buildCategory(String categoryName, List<Skill> skillList, int index){
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin:  EdgeInsets.only(right: 0,bottom: index == 3 ? 0: 18),

        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            border:
            Border.all(
              width:(isExpanded &&  currIdx == index)? 2:1,
                color:(isExpanded &&  currIdx == index)?theme.colorScheme.primaryVariant: theme.colorScheme.secondaryVariant,)),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent,),
          child: ExpansionTile(
           collapsedIconColor:  theme.colorScheme.secondaryVariant,
            iconColor:  theme.colorScheme.primaryVariant,
            childrenPadding: EdgeInsets.zero,
            onExpansionChanged: (val)=>setState((){
              currIdx = index;
               isExpanded = val;
            }),
            tilePadding: EdgeInsets.zero,
            textColor: theme.textTheme.headline1!.color,
            title: Text(categoryName,style: theme.textTheme.headline1!.copyWith(fontSize:width>750? 18:16,fontWeight: FontWeight.w600),),
            children: skillList.map((skill) => Column(
              children: [
                Row(
                  children: [
                            Text(
                              "  " + skill.title,
                              style: theme.textTheme.headline1!.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            Text(skill.rating.toString() + " % "),
                          ],
                ),
                const SizedBox(
                          height: 4,
                        ),
                LinearPercentIndicator(
                  animation: true,
                  animateFromLastPercent: true,
                  lineHeight: 4.0,
                  percent: skill.rating / 100,
                  backgroundColor: isDark?theme.colorScheme.secondaryVariant:theme.colorScheme.secondary,
                  progressColor:  theme.colorScheme.primaryVariant,
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            )).toList(),
          ),
        ),
      );
    }


    buildSkillCategory() {
      return Wrap(
      //  mainAxisSize: MainAxisSize.min,
        children: [
          buildCategory("Programing Languages", programingLanguages,0),
          buildCategory("FrameWork & Libraries", frameWorks,1),
          buildCategory("Databases", dataBases,2),
          buildCategory("Other Skills",otherSkills,3)
        ],
      );
    }

    return Padding(
      padding: appPadding.mainPadding(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * .05,
          ),
          const SectionSubHeader(title: "Skills"),
          // getSkills(),


        buildSkillCategory(),

          SizedBox(
            height: height * .05,
          ),
        ],
      ),
    );
  }
}
