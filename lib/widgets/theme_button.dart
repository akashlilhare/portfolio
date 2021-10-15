import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfoli/constants/app_theme.dart';
import 'package:provider/provider.dart';
class ThemeButton extends StatelessWidget {
  const ThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return
      Container(
        child: FlutterSwitch(
          inactiveSwitchBorder:  Border.all(color:theme.colorScheme.primaryVariant,width: 2),
         activeSwitchBorder: Border.all(color:width>725? Colors.transparent: theme.colorScheme.primaryVariant,width: 2),
         activeToggleColor: theme.colorScheme.primaryVariant,
        //  inactiveToggleColor: theme.colorScheme.primaryVariant,
          inactiveIcon: Icon(FontAwesomeIcons.sun,color: theme.colorScheme.primaryVariant,),
          activeIcon: Icon(FontAwesomeIcons.moon,color: Colors.white,),
          activeColor: Colors.white,
          duration: Duration(microseconds: 100),
          inactiveColor: Colors.white,
          width: 75.0,
          height: 38.0,
          toggleSize: 50.0,
          value:  themeProvider.isDarkMode,
          borderRadius: 20.0,
          padding: 3.0,
          onToggle: (value) {
      final provider = Provider.of<ThemeProvider>(context, listen:  false);
      provider.toggleTheme(value);

    },
        ),
      );


  }
}
