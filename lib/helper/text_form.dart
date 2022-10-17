import 'package:fastkart_app/helper/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


class TxtField extends StatelessWidget {
  final dynamic validator;
  final dynamic onSaved;
  final String hintText;
  final bool enabled;
  final TextInputType textInputType;
  final Widget prefix;
  final bool obscureText;
  final TextEditingController controller;
  const TxtField(
      {Key? key,
        this.validator,
        this.onSaved,
        required this.hintText,
        required this.enabled,
        required this.textInputType,
        required this.prefix,
        required this.obscureText,
        required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15,
        left: 15,
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        onSaved: onSaved,
        enabled: enabled,
        //   textAlign: TextAlign.center,
        keyboardType: textInputType,
        obscureText: obscureText,

        style: const TextStyle(
          // fontFamily: AppTheme.boldFont,
          color: Color(0xFFC1C1C1),
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              width: 0.5,
              style: BorderStyle.solid,
              color: AppTheme.mainColorText,
            ),
          ),
          errorStyle: const TextStyle(
            // fontFamily: AppTheme.boldFont,
            color: Color(0xFFC1C1C1),
            fontSize: 13,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: prefix,
          ),
          contentPadding: const EdgeInsets.only(left: 15, top: 20, bottom: 20, right: 15),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              width: 0.5,
              style: BorderStyle.solid,
              color: AppTheme.mainColorText,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              width: 0.5,
              style: BorderStyle.solid,
              color: AppTheme.mainColorText,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              width: 0.5,
              style: BorderStyle.solid,
              color: AppTheme.mainColorText,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          enabled: true,
          labelText: hintText == null ? "" : hintText.tr(),
          labelStyle: const TextStyle(
            color: Color(0xFFC1C1C1),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
