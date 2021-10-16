import 'package:flutter/material.dart';
import 'package:portfoli/database/certificate_database.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/section_sub_header.dart';

class CertificatePage extends StatelessWidget {
  const CertificatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);

    int getCrossCount() => width > 950
        ? 2
        : width > 725
            ? 1
            : 1;

    buildCourseWork() {
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: certificateList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getCrossCount(),
          crossAxisSpacing: width * .1,
          childAspectRatio: 1 / 5,
          mainAxisSpacing: 8,
          mainAxisExtent: 88,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(right: 0, bottom: 16),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                border: Border.all(color: theme.colorScheme.secondaryVariant)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(

                        certificateList[index].title,
                        maxLines: 1,
                        style:  theme.textTheme.headline1!.copyWith(
                        overflow: TextOverflow.ellipsis,
                            letterSpacing: 1.3,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Flexible(

                        child: Text(

                      certificateList[index].university,maxLines: 1,
                      style:  theme.textTheme.headline2!.copyWith(letterSpacing: 1.3,overflow: TextOverflow.ellipsis,fontSize: 14),
                    )),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return Container(
        padding: CustomResponsiveBuilder(context: context).mainPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionSubHeader(title: "Certificate"),
            buildCourseWork(),
            SizedBox(
              height: height * .08,
            ),
          ],
        ));
  }
}


