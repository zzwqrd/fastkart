// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

class CityModel {
  CityModel({
    this.data,
  });

  Data? data;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    required this.states,
    required this.cities,
  });

  List<State> states;
  List<City> cities;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        states: List<State>.from(json["states"].map((x) => State.fromJson(x))),
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
      );
}

class City {
  City({
    required this.id,
    required this.title,
    required this.stateId,
  });

  int id;
  String title;
  int stateId;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        title: json["title"],
        stateId: json["state_id"],
      );
}

class State {
  State({
    required this.id,
    required this.title,
  });

  int id;
  String title;

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        title: json["title"],
      );
}
