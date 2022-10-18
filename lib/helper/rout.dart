import 'package:flutter/material.dart';

Future<dynamic> push(Widget child) {
  return Navigator.of(navigator.currentContext!).push(SlideRight(page: child));
}

Future<dynamic> replacement(Widget child) {
  return Navigator.of(navigator.currentContext!).pushReplacement(
    SlideRight(page: child),
  );
}

Future<dynamic> pushAndRemoveUntil(Widget child) {
  return Navigator.of(navigator.currentContext!).pushAndRemoveUntil(SlideRight(page: child), (route) => false);
}

class SlideRight extends PageRouteBuilder {
  // ignore: prefer_typing_uninitialized_variables
  final page;

  SlideRight({this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
