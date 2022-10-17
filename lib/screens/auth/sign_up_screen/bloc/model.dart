import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

class RegisterModel {
  RegisterModel({
    this.data,
    this.message,
  });

  Data? data;
  String? message;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
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
