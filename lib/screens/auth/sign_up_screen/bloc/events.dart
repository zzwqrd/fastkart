import 'package:flutter/material.dart';

class RegisterEvents {}

class RegisterEventStart extends RegisterEvents {
  late TextEditingController phone, firstName, lastName, password, confirmPassword;
  dynamic city;

  late GlobalKey<FormState> formKey;
  Map<String, dynamic> toJson() => {
        "phone": phone.text,
        "city": city.text,
        "first_name": firstName.text,
        "last_name": lastName.text,
        "password": password.text,
        "password_confirmation": confirmPassword.text,
      };

  RegisterEventStart() {
    formKey = GlobalKey();
    phone = TextEditingController();
    city = dynamic;
    firstName = TextEditingController();
    lastName = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }
}
