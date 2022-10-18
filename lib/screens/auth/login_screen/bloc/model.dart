import 'dart:convert';

LoginModel LoginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

class LoginModel {
  LoginModel({
    this.data,
    this.message,
  });

  Data? data;
  String? message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );
}

class Data {
  Data({
    required this.id,
    required this.phone,
    required this.code,
  });

  int id;
  String phone;
  int code;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        phone: json["phone"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "code": code,
      };
}
