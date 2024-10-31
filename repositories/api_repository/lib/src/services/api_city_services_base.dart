import 'package:dio/dio.dart';

// ApiServicesBase designed to handle city-related API calls using the Dio HTTP client.
abstract class ApiServicesBase {
  // This method fetch cities based on the given country.
  Future<Response<dynamic>> getCitiesByCountry(String country);
}
