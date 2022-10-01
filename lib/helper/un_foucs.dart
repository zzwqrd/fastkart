import 'package:flutter/material.dart';

class UnFocus extends StatelessWidget {
  
  const UnFocus({Key? key, required this.child}) : super(key: key);

  final Widget child;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
