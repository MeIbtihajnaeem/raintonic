import 'dart:convert';

import 'package:api_repository/src/models/weather_model.dart';

class CityLocationModel {
  String? name;
  double? latitude;
  double? longitude;
  WeatherModel? weather;

  CityLocationModel({this.name, this.latitude, this.longitude, this.weather});

  CityLocationModel copyWith(
          {String? name,
          double? latitude,
          double? longitude,
          WeatherModel? weather}) =>
      CityLocationModel(
          name: name ?? this.name,
          latitude: latitude ?? this.latitude,
          longitude: longitude ?? this.longitude,
          weather: weather ?? this.weather);

  factory CityLocationModel.fromRawJson(String str) =>
      CityLocationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CityLocationModel.fromJson(Map<String, dynamic> json) =>
      CityLocationModel(
          name: json["name"],
          latitude: json["latitude"]?.toDouble(),
          longitude: json["longitude"]?.toDouble(),
          weather: json["weather"] == null
              ? null
              : WeatherModel.fromJson(json["weather"]));

  Map<String, dynamic> toJson() => {
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "weather": weather?.toJson(),
      };
}
