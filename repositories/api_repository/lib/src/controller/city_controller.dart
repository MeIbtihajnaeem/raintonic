import 'package:api_repository/src/models/cities_model.dart';
import 'package:dio/dio.dart';

import '../services/api_city_services_base.dart';

class CityController {
  final ApiServicesBase _services;

  CityController(this._services);

  Future<List<String>> getCities({String country = "italy"}) async {
    Response<dynamic> response = await _services.getCitiesByCountry(country);
    if (response.data["error"] == true) {
      throw response.data["msg"];
    }
    return CitiesModel.fromJson(response.data).data ?? [];
  }
}
