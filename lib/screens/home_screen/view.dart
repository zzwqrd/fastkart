import 'package:fastkart_app/screens/home_screen/widget/customSlider.dart';
import 'package:fastkart_app/screens/home_screen/widget/custom_app.dart';
import 'package:fastkart_app/screens/home_screen/widget/custom_recently.dart';
import 'package:fastkart_app/screens/home_screen/widget/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';

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
            SizedBox(
              height: 20.h,
            ),
            custom_recently(),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
