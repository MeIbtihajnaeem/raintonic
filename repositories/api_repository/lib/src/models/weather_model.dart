import 'dart:convert';

class WeatherModel {
  double? latitude;
  double? longitude;
  CurrentUnits? currentUnits;
  Current? current;

  WeatherModel({
    this.latitude,
    this.longitude,
    this.currentUnits,
    this.current,
  });

  factory WeatherModel.fromRawJson(String str) =>
      WeatherModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        currentUnits: json["current_units"] == null
            ? null
            : CurrentUnits.fromJson(json["current_units"]),
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "current_units": currentUnits?.toJson(),
        "current": current?.toJson(),
      };
}

class Current {
  double? temperature2M;
  double? relativeHumidity2M;
  double? apparentTemperature;

  double? rain;
  double? showers;
  double? snowfall;
  double? weatherCode;
  double? cloudCover;
  double? pressureMsl;
  double? windSpeed10M;

  Current({
    this.temperature2M,
    this.relativeHumidity2M,
    this.apparentTemperature,
    this.windSpeed10M,
    this.pressureMsl,
    this.weatherCode,
    this.cloudCover,
    this.rain,
    this.showers,
    this.snowfall,
  });

  factory Current.fromRawJson(String str) => Current.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temperature2M: json["temperature_2m"]?.toDouble(),
        relativeHumidity2M: json["relative_humidity_2m"]?.toDouble(),
        apparentTemperature: json["apparent_temperature"]?.toDouble(),
        rain: json["rain"]?.toDouble(),
        showers: json["showers"]?.toDouble(),
        snowfall: json["snowfall"]?.toDouble(),
        weatherCode: json["weather_code"]?.toDouble(),
        cloudCover: json["cloud_cover"]?.toDouble(),
        pressureMsl: json["pressure_msl"]?.toDouble(),
        windSpeed10M: json["wind_speed_10m"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temperature_2m": temperature2M,
        "relative_humidity_2m": relativeHumidity2M,
        "apparent_temperature": apparentTemperature,
        "rain": rain,
        "showers": showers,
        "snowfall": snowfall,
        "weather_code": weatherCode,
        "cloud_cover": cloudCover,
        "pressure_msl": pressureMsl,
        "wind_speed_10m": windSpeed10M,
      };
}

class CurrentUnits {
  String? temperature2M;
  String? relativeHumidity2M;
  String? apparentTemperature;
  String? isDay;
  String? precipitation;
  String? rain;
  String? showers;
  String? snowfall;
  String? weatherCode;
  String? cloudCover;
  String? pressureMsl;
  String? surfacePressure;
  String? windSpeed10M;
  String? windDirection10M;
  String? windGusts10M;

  CurrentUnits({
    this.temperature2M,
    this.relativeHumidity2M,
    this.apparentTemperature,
    this.isDay,
    this.precipitation,
    this.rain,
    this.showers,
    this.snowfall,
    this.weatherCode,
    this.cloudCover,
    this.pressureMsl,
    this.surfacePressure,
    this.windSpeed10M,
    this.windDirection10M,
    this.windGusts10M,
  });

  factory CurrentUnits.fromRawJson(String str) =>
      CurrentUnits.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
        temperature2M: json["temperature_2m"],
        relativeHumidity2M: json["relative_humidity_2m"],
        apparentTemperature: json["apparent_temperature"],
        isDay: json["is_day"],
        precipitation: json["precipitation"],
        rain: json["rain"],
        showers: json["showers"],
        snowfall: json["snowfall"],
        weatherCode: json["weather_code"],
        cloudCover: json["cloud_cover"],
        pressureMsl: json["pressure_msl"],
        surfacePressure: json["surface_pressure"],
        windSpeed10M: json["wind_speed_10m"],
        windDirection10M: json["wind_direction_10m"],
        windGusts10M: json["wind_gusts_10m"],
      );

  Map<String, dynamic> toJson() => {
        "temperature_2m": temperature2M,
        "relative_humidity_2m": relativeHumidity2M,
        "apparent_temperature": apparentTemperature,
        "is_day": isDay,
        "precipitation": precipitation,
        "rain": rain,
        "showers": showers,
        "snowfall": snowfall,
        "weather_code": weatherCode,
        "cloud_cover": cloudCover,
        "pressure_msl": pressureMsl,
        "surface_pressure": surfacePressure,
        "wind_speed_10m": windSpeed10M,
        "wind_direction_10m": windDirection10M,
        "wind_gusts_10m": windGusts10M,
      };
}
