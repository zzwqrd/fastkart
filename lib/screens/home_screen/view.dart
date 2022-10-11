import 'package:fastkart_app/helper/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/icons/logo.png',
              width: 80,
              fit: BoxFit.fill,
            ),
            const Spacer(),
            Row(
              children: const [
                Text(
                  "data",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "data",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
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
