import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';

Widget dividerLine() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      children: [
        Expanded(
          child: Divider(
            color: const Color(0xFFe8e8e8),
            height: 60.h,
          ),
        ),
        const Text(
          "Shop By Category",
          style: TextStyle(
            color: Color(0xFF222222),
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        Expanded(
          child: Divider(
            color: const Color(0xFFe8e8e8),
            height: 60.h,
          ),
        ),
      ],
    ),
  );
}
