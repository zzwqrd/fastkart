import 'package:fastkart_app/screens/home_screen/widget/custom_app.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
