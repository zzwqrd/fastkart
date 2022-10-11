import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:fastkart_app/screens/auth/onboarding_screen/onboarding.dart';
import 'package:fastkart_app/screens/navigation_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void goToPage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => NavigationBarView(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        goToPage();
      },
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElasticInUp(
        duration: const Duration(seconds: 2),
        child: Center(
          child: Image.asset(
            'assets/icons/logo.png',
            width: 100.w,
          ),
        ),
      ),
    );
  }
}
