import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfoli/constants/app_theme.dart';
import 'package:portfoli/pages/about_page/about_page.dart';
import 'package:portfoli/pages/contact_page/contact_page.dart';
import 'package:portfoli/pages/main_page.dart';
import 'package:portfoli/pages/project_page/project_page.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor:Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

          return ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
            builder: (context,_) {
              final themeProvider = Provider.of<ThemeProvider>(context);
              return FutureBuilder(
                future: ThemeProvider().getSavedTheme(),
                builder: (context, snapShort){
                  if(snapShort.connectionState == ConnectionState.waiting){
                   return const MaterialApp(
                      home: Center(child: CircularProgressIndicator(),),
                    );
                  }else{
                    themeProvider.isDarkMode = snapShort.data as ThemeMode;
                    ThemeProvider().themeMode =snapShort.data as ThemeMode;
                    print(snapShort.data.toString() + "data");
                    return
                      MaterialApp(
                          themeMode: snapShort.data as ThemeMode,
                          debugShowCheckedModeBanner: false,
                          title: 'Akash',
                          theme: AppTheme().lightThemeData,
                          darkTheme: AppTheme().darkThemeData,
                          home: const MainPage(),
                          routes: {
                            ProjectPage.routeName: (ctx) =>const ProjectPage(),
                            AboutPage.routeName: (ctx) =>const AboutPage(),
                            ContactPage.routeName: (ctx) =>const ContactPage(),
                          });
                  }

                }
              );
            }
          );
  }}
