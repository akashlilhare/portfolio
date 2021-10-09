import 'package:flutter/material.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/database/certificate_database.dart';
import 'package:portfoli/widgets/seaction_sub_header.dart';

class CertificatePage extends StatelessWidget {
  const CertificatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    buildcertificate() {
      return
      Column(
        children:
        certificateList
          .map((certificate) => Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(border:Border.all(color: Constants.lightPrimaryColor), borderRadius: BorderRadius.all(Radius.circular(16)),),
            child: ExpansionTile(
              expandedAlignment: Alignment.bottomCenter,
              subtitle: Text("2012-2022"),

              expandedCrossAxisAlignment:CrossAxisAlignment.end ,
            
                  title: Text(
                    certificate.title,
                  ),

                  children: [Text(certificate.university)],
                ),
          ))
          .toList());
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionSubHeader(title: "Certificate"),
          buildcertificate(),
        ],
      ),
    );
  }
}


