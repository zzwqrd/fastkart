import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';

Widget appCustom() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset(
        'assets/icons/logo.png',
        width: 80,
        fit: BoxFit.fill,
      ),
      const Spacer(),
      Row(
        children: [
          //avatar

          Row(
            children: [
              Icon(
                Icons.location_on_sharp,
                color: Colors.black,
                size: 16.px,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "Los Angeles",
                style: TextStyle(color: Colors.black, fontSize: 12.px),
              ),
            ],
          ),
          SizedBox(
            width: 15.w,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/icons/avatar.jpg',
              width: 40,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    ],
  );
}
