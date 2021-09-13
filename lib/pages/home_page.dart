import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> headerTitle = [
      "Home",
      "About",
      "Skills",
      "Services",
      "Portfolio",
      "Contacts"
    ];
    double height = MediaQuery.of(context).size.height;

    buildSocialButton() {
      socialButton(
          {required IconData icon,
          required String title,
          required Function onTap}) {
        return IconButton(
          onPressed: () => onTap(),
          icon: Icon(icon),
         // tooltip: title,
        );
      }

      return Column(
        children: [
          socialButton(
              onTap: () {}, icon: FeatherIcons.github, title: "Github"),
          socialButton(
              onTap: () {}, icon: FeatherIcons.linkedin, title: "Linkedin"),
          socialButton(
              onTap: () {}, icon: FeatherIcons.twitter, title: "Twitter"),
          socialButton(
              onTap: () {}, icon: Icons.email_outlined, title: "Email"),
        ],
      );
    }

    buildNavigationBar() {
      buildHeader(String title) {
        return TextButton(
          child: Text(title),
          onPressed: () {},
        );
      }

      return Container(
        height: 50,
        color: Colors.transparent,
        child: Row(
            children:[
             const Text("Akash"),
           const Spacer(),
            ...headerTitle.map((item) => buildHeader(item)).toList()
      ]
      ));
    }

    return
      Container(
        padding: AppPadding().horizontalPadding(20, 10, 8),
        height: height,
        width: double.infinity,
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         image: NetworkImage(
        //             "https://images.unsplash.com/photo-1503252947848-7338d3f92f31?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y29kaW5nfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60"),
        //         fit: BoxFit.cover)),
        child: Column(
          children: [
            buildNavigationBar(),
            SizedBox(height: 15.h,),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 100,
                              child:buildSocialButton()
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:const [
                                Text(
                                  "Hi, I am Akash Lilhare",
                                  style: TextStyle(fontSize: 40),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "I'm Durg base Flutter developer. I like to code things from scratch,\n and enjoy bringing ideas to life in the browser",
                                  style: TextStyle( fontSize: 22),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 15.h,),
                      Row(
                        children: [
                          CustomButton(onTap: (){}, title:"Download Resume",icon:Icons.download_done_outlined),
                          SizedBox(width: 10.w,),
                          CustomButton(onTap: (){}, title:"Contact Me",icon:Icons.phone_outlined),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 15.h,
                  width: 35.w ,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      );
  }
}
