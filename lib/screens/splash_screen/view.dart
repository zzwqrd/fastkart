import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:fastkart_app/helper/extintions.dart';
import 'package:fastkart_app/main.dart';
import 'package:fastkart_app/screens/auth/login_screen/view.dart';
import 'package:fastkart_app/screens/auth/onboarding_screen/onboarding.dart';
import 'package:fastkart_app/screens/navigation_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void goToPage() async {
    if (Prefs.getString('token') != null) {
      print("__________________________________________________ token");
      print("__________________________________________________ token ${Prefs.getString('token').toString()}");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const NavigationBarView(),
        ),
        (Route<dynamic> route) => false,
      );
      //is_verified
    } else if (Prefs.getInt('isVerified') == 1 && Prefs.getString('token') == null) {
      print("__________________________________________________ NO isVerified");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } else {
      print("__________________________________________________ NO token");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        goToPage();
      },
    );

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
