import 'dart:math';

import 'package:fastkart_app/helper/divider_line.dart';
import 'package:fastkart_app/main.dart';
import 'package:fastkart_app/screens/home_screen/bloc/bloc.dart';
import 'package:fastkart_app/screens/home_screen/bloc/events.dart';
import 'package:fastkart_app/screens/home_screen/bloc/states.dart';
import 'package:fastkart_app/screens/home_screen/widget/customSlider.dart';
import 'package:fastkart_app/screens/home_screen/widget/custom_app.dart';
import 'package:fastkart_app/screens/home_screen/widget/custom_category.dart';
import 'package:fastkart_app/screens/home_screen/widget/custom_recently.dart';
import 'package:fastkart_app/screens/home_screen/widget/custom_search.dart';
import 'package:fastkart_app/screens/splash_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:kiwi/kiwi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _bloc = KiwiContainer().resolve()..add(HomeEventStart());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appCustom(),
        leading: IconButton(
          onPressed: () {
            setState(() {
              Prefs.remove('token');
              print("object");
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => SplashScreen(),
                ),
                (Route<dynamic> route) => false,
              );
            });
          },
          icon: Image.asset(
            'assets/icons/menu.png',
            width: 20,
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            widgetSearch(),
            SizedBox(
              height: 20.h,
            ),
            customSlider(),
            SizedBox(
              height: 20.h,
            ),
            customRecently(),
            SizedBox(
              height: 10.h,
            ),
            dividerLine(),
            SizedBox(
              height: 5.h,
            ),
            customCategory(),
          ],
        ),
      ),
    );
  }
}
