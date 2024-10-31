import 'package:dio/dio.dart';

import '../models/city_location_model.dart';

// ApiWeatherServicesBase responsible for making weather-related API calls using Dio clients for location and weather data.
abstract class ApiWeatherServicesBase {
  // This method fetch current weather data for a city.
  Future<Response<dynamic>> getCityWeather(CityLocationModel cityLocation);

  // This method fetch 24-hour temperature data for a city.
  Future<Response<dynamic>> getCity24HourTemperatureData(
      CityLocationModel cityLocation);

  // This method fetch the location of a given city.
  Future<Response<dynamic>> getCityLocation(String city);
}
