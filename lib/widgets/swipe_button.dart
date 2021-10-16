import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class SwipeButton extends StatelessWidget {
  final Function onPress ;
  const SwipeButton({Key? key, required this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Animator<double>(
      duration: const Duration(milliseconds: 900),
      cycles: 0,
      curve: Curves.easeInOut,
      tween: Tween<double>(begin: 0.0, end: 30.0),
      builder: (context, animatorState, child) => Container(
        margin: EdgeInsets.only(bottom:animatorState.value),
        child: Center(
            child: InkWell(
    onTap: onPress(),
    child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: theme.colorScheme.primaryVariant.withOpacity(.5),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        blurRadius: 30,
                        offset: const Offset(5, 5))
                  ]),
              child:
              const Icon(Icons.keyboard_arrow_down),
            )
          ),
        ),
      ),
    );
  }
}
