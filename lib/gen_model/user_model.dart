class UserModel {
  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.cityId,
      required this.image,
      required this.fcmToken,
      required this.status,
      required this.isVerified,
      required this.createdAt,
      required this.token});

  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  int? cityId;
  Null? image;
  Null? fcmToken;
  String? status;
  String? isVerified;
  String? createdAt;
  String? token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? 0,
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        phone: json["phone"] ?? "",
        cityId: json["city_id"] ?? 0,
        image: json["image"] ?? "",
        fcmToken: json["fcm_token"] ?? "ar",
        status: json["status"] ?? 0,
        isVerified: json["is_verified"] ?? 0,
        createdAt: json["created_at"] ?? 0,
        token: json["token"] ?? 0,
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
        "created_at": createdAt,
        "token": token,
      };
}
