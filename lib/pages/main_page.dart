

import 'package:flutter/material.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:portfoli/pages/footer_page.dart';
import 'package:portfoli/pages/project_page.dart';

import 'contact_page.dart';
import 'home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             HomePage(),
             ProjectPage(),
            ContactPage(),
            FooterPage(),
          ],
        ),
      ),
    );
  }
}
