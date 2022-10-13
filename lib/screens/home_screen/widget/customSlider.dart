import 'package:fastkart_app/helper/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

Widget customSlider() {
  return SizedBox(
    height: 200.h,
    child: Swiper(
      itemBuilder: (BuildContext context, index) {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://themes.pixelstrap.com/fastkart-app/assets/images/banner/home1.jpg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width.w,
                height: MediaQuery.of(context).size.height.h,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(18.px, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Farm Fresh Veggies",
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text(
                    "Get instant delivery",
                    style: TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppTheme.mainColor,
                      ),
                      child: const Text(
                        "Shop Now",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      autoplay: true,
      layout: SwiperLayout.TINDER,
      itemCount: 5,
      viewportFraction: 1.0,
      scrollDirection: Axis.horizontal,
      indicatorLayout: PageIndicatorLayout.SCALE,
      autoplayDelay: 1000,
      // control: const SwiperControl(size: 20),
      // fade: 2.0,
      // viewportFraction: 0.85,

      pagination: SwiperPagination(
        alignment: Alignment.bottomCenter,
        builder: DotSwiperPaginationBuilder(
          color: Colors.white.withOpacity(0.5),
          activeColor: Colors.white,
        ),
        // margin: const EdgeInsets.only(
        //   top: 90,
        // ),
      ),
    ),
  );
}
