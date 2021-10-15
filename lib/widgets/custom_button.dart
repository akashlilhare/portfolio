import 'package:flutter/material.dart';
import 'package:portfoli/constants/app_theme.dart';
import 'package:portfoli/constants/constants.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String title;

  const CustomButton({Key? key,required this.onTap,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    var theme = Theme.of(context);
    return    ElevatedButton(
      style: ElevatedButton.styleFrom(
primary: isDark ? AppTheme.darkButtonColor : AppTheme.lightButtonColor,
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)),
        minimumSize: const Size(150, 55),
        maximumSize: const Size(200, 55),
      ),
      onPressed: () {onTap();},
      child:
          Text(title,style: TextStyle(color: Colors.white),),


    );
  }
}
