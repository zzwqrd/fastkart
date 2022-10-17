import 'package:flutter/material.dart';

class RegisterEvents {}

class RegisterEventStart extends RegisterEvents {
  late TextEditingController phone, city, firstName, lastName, password, confirmPassword;

  late GlobalKey<FormState> formKey;
  Map<String, dynamic> toJson() => {
        "phone": phone.text,
        "city": city.text,
        "first_name": firstName.text,
        "last_name": lastName.text,
        "password": password.text,
      };

  RegisterEventStart() {
    formKey = GlobalKey();
    phone = TextEditingController();
    city = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }
}
