import 'package:fastkart_app/helper/app_theme.dart';
import 'package:flutter/material.dart';

Widget widgetSearch() {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 0.5,
            color: AppTheme.mainColor,
          )),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 20,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mic,
              size: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
