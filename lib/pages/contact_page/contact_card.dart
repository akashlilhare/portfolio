import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:portfoli/constants/app_theme.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/constants/personal_info.dart';
import 'package:provider/provider.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersonalInfo info = PersonalInfo();
    double height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;



    contactCard() {
      copyText(String contact) async {
        FlutterClipboard.copy(contact).then((value) {
          return Constants().showToast('copied to clipboard');
        });
      }

      getTitle(String title) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: .02 * height,
              ),
          child: Text(
            title,
            style:
            theme.textTheme.headline1!.copyWith(fontSize: 28, fontWeight: FontWeight.w600),
          ),
        );
      }

      buildContactCard(IconData icon, String title, String subtitle) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Material(color: isDark?theme.primaryColor:theme.colorScheme.secondary,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            elevation:isDark? 1:1,
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 24, horizontal:8),
                child: Row(
                  children: [
                    const SizedBox(
                      width:8,
                    ),
                    CircleAvatar(
                      backgroundColor: isDark?Colors.transparent:theme.primaryColor.withOpacity(.5),
                      child: Icon(icon,color: Colors.white,),
                    ),
                    const SizedBox(
                      width:16,
                    ),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: theme.textTheme.headline1!.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              subtitle,
                              style: theme.textTheme.headline2!.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          ]),
                    ),
                    IconButton(
                      onPressed: () => copyText(subtitle),
                      icon:  Icon(
                        Icons.copy,
                        color:  theme.textTheme.headline2!.color,
                      ),
                      tooltip: "copy : $subtitle",
                    ),
                  ],
                )),
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getTitle("Contacts Info"),
          buildContactCard(Icons.phone_outlined, "Phone", "+91-${info.phone}"),
          buildContactCard(
              Icons.email_outlined, "Email", info.email),
          buildContactCard(
              Icons.location_on_outlined, "Location", "${info.location}, India"),
        ],
      );
    }
    return Container(
      child: contactCard(),
    );
  }
}
