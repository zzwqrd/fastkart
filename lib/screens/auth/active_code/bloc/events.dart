import 'dart:io';

import 'package:flutter/material.dart';

class ActiveCodeEvent {}

class StartActiveCodeEvent extends ActiveCodeEvent {
  late TextEditingController mobile, activeCode;
  TYPE type; // reset_password or register
  Future<Map<String, dynamic>> toJson() async => {
        "phone": mobile.text,
        "code": activeCode.text,
      };

  StartActiveCodeEvent({required this.type, required this.mobile}) {
    activeCode = TextEditingController();
  }
}

enum TYPE { resetPassword, register }
