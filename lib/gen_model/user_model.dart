// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.data,
    required this.message,
    required this.status,
  });

  Data data;
  String message;
  String status;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.cityId,
    required this.image,
    required this.fcmToken,
    required this.status,
    required this.isVerified,
    // required this.createdAt,
    required this.token,
  });

  int id;
  String firstName;
  String lastName;
  String phone;
  int cityId;
  dynamic image;
  String fcmToken;
  String status;
  dynamic isVerified;
  // DateTime createdAt;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] ?? 0,
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        phone: json["phone"] ?? '',
        cityId: json["city_id"] ?? 0,
        image: json["image"] ?? "",
        fcmToken: json["fcm_token"] ?? '',
        status: json["status"] ?? '',
        isVerified: json["is_verified"] ?? '',
        // createdAt: DateTime.parse(json["created_at"] ?? {}),
        token: json["token"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "city_id": cityId,
        "image": image,
        "fcm_token": fcmToken,
        "status": status,
        "is_verified": isVerified,
        // "created_at": createdAt.toIso8601String(),
        "token": token,
      };
}
