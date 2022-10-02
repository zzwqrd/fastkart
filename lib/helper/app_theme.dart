import 'package:flutter/material.dart';
// الفيل دا هيكون فيه الالوان وكل حاجه خاصه بلتطبيق
class AppTheme {
  AppTheme._();

  static Color mainColor = const Color(0xFF0baf9a);
  static Color mainColorText = const Color.fromARGB(255, 112, 112, 112);
  static Color mainButtonColor = const Color.fromARGB(255, 76, 134, 19);
  static Color mainColorNaveText = Color.fromARGB(255, 174, 212, 100);
  static Color maingrayColor = const Color(0xFF9C9C9C);

  static const String boldFont = 'Bold';

  static const double sizedBox = 18;

  static const double padding = 15;

  static TextStyle appStayle = const TextStyle(
    fontSize: 14,
    color: Color(0xFF7B8E7A),
    // fontFamily: fontName,
  );
  static TextStyle butnStyle2 = TextStyle(
    fontSize: 14, color: mainColor, fontWeight: FontWeight.w500,
    // fontFamily: fontName,
  );
  static TextStyle textStyleGray = TextStyle(
    fontSize: 14,
    color: mainColorText,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textApp = TextStyle(
    fontSize: 14,
    color: mainColor,
    fontWeight: FontWeight.w900,
  );
}

class Family {
  Family._();
  static String bold = "Bold";
  static String regular = "Regular";
  static String fontFamilyMedium = "Medium";
  static String light = "Light";
  static String fontFamilyExtraBold = "ExtraBold";
  static String semiBold = "SemiBold";
}
