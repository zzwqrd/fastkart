import 'package:fastkart_app/helper/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';


class Btn extends StatelessWidget {
  final String txt;
  final VoidCallback onTap;

  const Btn({ required this.txt, required this.onTap});

  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.white,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            // color: _pressed ? AppTheme.primaryColor : Colors.indigo,
            color: AppTheme.mainColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 0.5,
              color: Colors.grey,
            ),
          ),
          child: Text(
            txt,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ).tr(),
        ),
      ),
    );
  }
}

class BtnAddCart extends StatelessWidget {
  final String txt;
  final VoidCallback onTap;

  const BtnAddCart({required this.txt, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.white,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 33,
          decoration: BoxDecoration(
            // color: _pressed ? AppTheme.primaryColor : Colors.indigo,
            color: AppTheme.mainButtonColor,
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              width: 0.5,
              color: Colors.grey,
            ),
          ),
          child: Text(
            txt,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ).tr(),
        ),
      ),
    );
  }
}

class Btn2 extends StatelessWidget {
  final String txt;
  final VoidCallback onTap;
  const Btn2({Key? key, required this.txt, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.white,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            // color: _pressed ? AppTheme.primaryColor : Colors.indigo,
            color: AppTheme.mainButtonColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 0.5,
              color: Colors.grey,
            ),
          ),
          child: Text(
            txt,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ).tr(),
        ),
      ),
    );
  }
}

class BtnBorder extends StatelessWidget {
  final String txt;
  final VoidCallback onTap;
  const BtnBorder({Key? key, required this.txt, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.white,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            // color: _pressed ? AppTheme.primaryColor : Colors.indigo,
            // color: AppTheme.mainButtonColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 0.5,
              color: AppTheme.mainButtonColor,
            ),
          ),
          child: Text(
            txt,
            style: TextStyle(
              color: AppTheme.mainButtonColor,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ).tr(),
        ),
      ),
    );
  }
}
