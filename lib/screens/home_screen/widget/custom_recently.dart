import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';

Widget custom_recently() {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Stack(
      children: [
        Container(
          width: double.infinity,
          height: 172,
          decoration: const BoxDecoration(
            color: Color(0xFFedf8f8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(45),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Buy from Recently Bought",
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  color: Colors.white,
                  height: 100,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            print('🐹🐹🐹🐹🐹🐹🐹🐹 ....... $index');
                          },
                          child: Image.network(
                            "https://themes.pixelstrap.com/fastkart-app/assets/images/product/7.png",
                            width: 60,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/icons/corner.png',
              width: 30.w,
            ),
          ),
        ),
      ],
    ),
  );
}
