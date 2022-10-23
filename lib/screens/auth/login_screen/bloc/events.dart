import 'package:flutter/material.dart';

class LoginEvents {}

class LoginEventStart extends LoginEvents {
  late TextEditingController phone, password;

  late GlobalKey<FormState> formKey;
  Map<String, dynamic> toJson() => {
        "phone": phone.text,
        "password": password.text,
      };

  LoginEventStart() {
    formKey = GlobalKey();
    phone = TextEditingController();
    password = TextEditingController();
  }
}
