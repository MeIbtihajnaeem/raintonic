import 'package:api_repository/src/services/api_city_services_base.dart';
import 'package:dio/dio.dart';

class ApiCityServices extends ApiServicesBase {
  final Dio _cityClient;

  ApiCityServices(this._cityClient);

  @override
  Future<Response<dynamic>> getCitiesByCountry(String country) async {
    var response = await _cityClient.get(
      "countries/cities/q?country=$country",
    );
    return response;
  }
}
