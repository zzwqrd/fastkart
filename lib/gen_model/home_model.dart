import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

class HomeModel {
  HomeModel({
    required this.data,
  });

  Data data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    required this.ads,
    required this.categories,
    required this.brand,
  });

  List<Ad> ads;
  List<Brand> categories;
  List<Brand> brand;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ads: List<Ad>.from(json["ads"].map((x) => Ad.fromJson(x))),
        categories: List<Brand>.from(json["categories"].map((x) => Brand.fromJson(x))),
        brand: List<Brand>.from(json["brand"].map((x) => Brand.fromJson(x))),
      );
}

class Ad {
  Ad({
    required this.id,
    required this.image,
  });

  int id;
  String image;

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        id: json["id"],
        image: json["image"],
      );
}

class Brand {
  Brand({
    required this.id,
    required this.title,
    required this.image,
  });

  int id;
  String title;
  String image;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );
}
