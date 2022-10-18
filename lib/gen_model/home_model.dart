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
  });

  List<Ad> ads;
  List<Category> categories;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ads: List<Ad>.from(json["ads"].map((x) => Ad.fromJson(x))),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
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

class Category {
  Category({
    required this.id,
    required this.title,
    required this.image,
  });

  int id;
  String title;
  String image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );
}
