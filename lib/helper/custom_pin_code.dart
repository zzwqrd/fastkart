import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '/../helper/extintions.dart';

class CustomPinCode extends StatelessWidget {
  final TextEditingController? controller;
  const CustomPinCode({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        pastedTextStyle: TextStyle(
          color: Colors.green.shade600,
          fontWeight: FontWeight.bold,
        ),
        length: 5,
        // scrollPadding: EdgeInsets.zero,
        controller: controller,
        obscureText: false,
        obscuringCharacter: '*',
        animationType: AnimationType.fade,
        // validator: (v) {
        //   if (v!.length < 3) {
        //     return "I'm from validator";
        //   } else {
        //     return null;
        //   }
        // },

        pinTheme: PinTheme(
          activeColor: context.color.surface,
          selectedColor: context.color.surface,
          activeFillColor: context.color.surface,
          selectedFillColor: context.color.surface,
          inactiveColor: context.color.surface,
          inactiveFillColor: context.color.surface,

          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 42.h,
          fieldWidth: 42.h,
          // activeFillColor:
          //     hasError ? Colors.orange : Colors.white,
        ),
        // cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        // textStyle: const TextStyle(fontSize: 20, height: 1.6),
        // backgroundColor: context.color.surface,
        enableActiveFill: true,
        // errorAnimationController: errorController,
        // controller: textEditingController,
        keyboardType: TextInputType.number,

        onChanged: (value) {},
        beforeTextPaste: (text) {
          return true;
        },
      ),
    );
  }
}
