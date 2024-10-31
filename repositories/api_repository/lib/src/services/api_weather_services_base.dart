import 'package:dio/dio.dart';

import '../models/city_location_model.dart';

abstract class ApiWeatherServicesBase {
  Future<Response<dynamic>> getCityWeather(CityLocationModel cityLocation);
  Future<Response<dynamic>> getCity24HourTemperatureData(
      CityLocationModel cityLocation);
  Future<Response<dynamic>> getCityLocation(String city);
}
