import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:portfoli/constants/constants.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    contactCard() {
      copyText(String contact) async {
        FlutterClipboard.copy(contact).then((value) {
          return Constants().showToast('copied to clipboard');
        });
      }

      buildContactCard(IconData icon, String title, String subtitle) {
        return Container(
            margin: EdgeInsets.only(bottom: height * .04),
            padding: EdgeInsets.symmetric(
                vertical: height * .025, horizontal: width * .02),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: height * .01,
                ),
                CircleAvatar(
                  backgroundColor: Constants.darkPrimaryColor,
                  child: Icon(icon),
                ),
                SizedBox(
                  width: height * .015,
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ]),
                ),
                IconButton(
                  onPressed: () => copyText(subtitle),
                  icon: const Icon(
                    Icons.copy,
                  ),
                  tooltip: "copy : $subtitle",
                ),
              ],
            ));
      }

      return Column(
        children: [
          buildContactCard(Icons.phone_outlined, "Phone", "+91-9669395879"),
          buildContactCard(
              Icons.email_outlined, "Email", "akashlilhare14@gmail.com"),
          buildContactCard(
              Icons.location_on_outlined, "Location", "Rajnandgao, India"),
        ],
      );
    }
    return Container(
      child: contactCard(),
    );
  }
}
