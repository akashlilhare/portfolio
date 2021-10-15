import 'package:flutter/material.dart';
import 'package:portfoli/constants/constants.dart';

class SendButton extends StatelessWidget {
  final Widget widget;
  final Function onTap;

  const SendButton({Key? key, required this.widget, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: theme.colorScheme.primaryVariant,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          minimumSize: const Size(150, 55),
        ),
        onPressed: () {
          onTap();
        },
        child: widget);
  }
}
