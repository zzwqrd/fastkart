import 'package:fastkart_app/screens/home_screen/widget/customSlider.dart';
import 'package:fastkart_app/screens/home_screen/widget/custom_app.dart';
import 'package:fastkart_app/screens/home_screen/widget/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../helper/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appCustom(),
        leading: IconButton(
          onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
