import 'package:dio/dio.dart';

abstract class ApiServicesBase {
  Future<Response<dynamic>> getCitiesByCountry(String country);
}
