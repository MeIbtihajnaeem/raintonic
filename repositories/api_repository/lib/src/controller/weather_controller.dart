import 'package:api_repository/src/models/city_location_model.dart';
import 'package:api_repository/src/services/api_weather_services_base.dart';
import 'package:dio/dio.dart';

import '../models/temperature_model.dart';
import '../models/weather_model.dart';

class WeatherController {
  final ApiWeatherServicesBase _services;

  WeatherController(this._services);

  Future<CityLocationModel> getCityDetails(String city) async {
    CityLocationModel cityLocationModel = await _getCityLatLng(city);
    WeatherModel weatherModel =
        await _getWeatherDetailsByCity(cityLocationModel);
    return cityLocationModel.copyWith(weather: weatherModel);
    // return cityLocationModel;
  }

  Future<CityLocationModel> _getCityLatLng(String city) async {
    try {
      Response<dynamic> response = await _services.getCityLocation(city);
      if (response.statusCode != 200) {
        throw "Process failed";
      }
      return CityLocationModel.fromJson(response.data[0]);
    } catch (e) {
      throw "Weather information is not available for $city on open-meteo api please try Florence, Milan etc";
    }
  }

  Future<TemperatureModel> getCity24HourTemperatureData(
      CityLocationModel cityData) async {
    try {
      Response<dynamic> response =
          await _services.getCity24HourTemperatureData(cityData);
      if (response.statusCode != 200) {
        throw "Process failed";
      }
      return TemperatureModel.fromJson(response.data);
    } catch (e) {
      throw "Weather information is not available for ${cityData.name} on open-meteo api please try Florence, Milan etc";
    }
  }

  Future<WeatherModel> _getWeatherDetailsByCity(
      CityLocationModel cityData) async {
    try {
      Response<dynamic> response = await _services.getCityWeather(cityData);
      if (response.statusCode != 200) {
        throw "Process failed";
      }
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      throw "Weather information is not available for ${cityData.name} on open-meteo api please try Florence, Milan etc";
    }
  }
}
