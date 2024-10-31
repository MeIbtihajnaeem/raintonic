import 'dart:convert';

class TemperatureModel {
  double? latitude;
  double? longitude;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;

  TemperatureModel({
    this.latitude,
    this.longitude,
    this.hourlyUnits,
    this.hourly,
  });

  factory TemperatureModel.fromRawJson(String str) =>
      TemperatureModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TemperatureModel.fromJson(Map<String, dynamic> json) =>
      TemperatureModel(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        hourlyUnits: json["hourly_units"] == null
            ? null
            : HourlyUnits.fromJson(json["hourly_units"]),
        hourly: json["hourly"] == null ? null : Hourly.fromJson(json["hourly"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "hourly_units": hourlyUnits?.toJson(),
        "hourly": hourly?.toJson(),
      };
}

class Hourly {
  List<String>? time;
  List<double>? temperature2M;

  Hourly({this.time, this.temperature2M});

  factory Hourly.fromRawJson(String str) => Hourly.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: json["time"] == null
            ? []
            : List<String>.from(json["time"]!.map((x) => x)),
        temperature2M: json["temperature_2m"] == null
            ? []
            : List<double>.from(
                json["temperature_2m"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "time": time == null ? [] : List<dynamic>.from(time!.map((x) => x)),
        "temperature_2m": temperature2M == null
            ? []
            : List<dynamic>.from(temperature2M!.map((x) => x)),
      };

  List<DataPoints> createDataPoints() {
    List<DataPoints> tempDataPoints = [];
    DateTime now = DateTime.now();

    for (var i = 0; i < (temperature2M?.length ?? 0); i++) {
      var obj = DataPoints.createDataPoint(
          strDate: time?[i] ?? "", temperature: temperature2M?[i] ?? 0);
      var dateTime = obj.dateTime;
      if (dateTime.isAfter(now.subtract(Duration(hours: 24))) &&
          dateTime.isBefore(now)) {
        tempDataPoints.add(obj);
      }
    }
    return tempDataPoints;
  }
}

class HourlyUnits {
  String? time;
  String? temperature2M;

  HourlyUnits({
    this.time,
    this.temperature2M,
  });

  factory HourlyUnits.fromRawJson(String str) =>
      HourlyUnits.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
        time: json["time"],
        temperature2M: json["temperature_2m"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "temperature_2m": temperature2M,
      };
}

class DataPoints {
  final DateTime dateTime;
  final double temperature;

  DataPoints({required this.dateTime, required this.temperature});

  static DataPoints createDataPoint(
          {required String strDate, required double temperature}) =>
      DataPoints(dateTime: DateTime.parse(strDate), temperature: temperature);
}
