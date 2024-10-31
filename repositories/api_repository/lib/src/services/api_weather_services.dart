import 'package:api_repository/src/models/city_location_model.dart';
import 'package:api_repository/src/services/api_weather_services_base.dart';
import 'package:dio/dio.dart';

class ApiWeatherServices extends ApiWeatherServicesBase {
  final Dio _locationClient;
  final Dio _weatherClient;

  ApiWeatherServices(this._locationClient, this._weatherClient);
  @override
  Future<Response> getCityLocation(String city) async {
    var response = await _locationClient.get("city?name=$city");
    return response;
  }

  @override
  Future<Response> getCity24HourTemperatureData(
      CityLocationModel cityLocation) async {
    final queryParameters = {
      'latitude': cityLocation.latitude,
      'longitude': cityLocation.longitude,
      'hourly':
          'temperature_2m,temperature_80m,temperature_120m,temperature_180m',
    };
    var response =
        await _weatherClient.get("forecast", queryParameters: queryParameters);

    return response;
  }

  @override
  Future<Response> getCityWeather(CityLocationModel cityLocation) async {
    final queryParameters = {
      'latitude': cityLocation.latitude,
      'longitude': cityLocation.longitude,
      'current': [
        "temperature_2m",
        "relative_humidity_2m",
        "apparent_temperature",
        "is_day",
        "precipitation",
        "rain",
        "showers",
        "snowfall",
        "weather_code",
        "cloud_cover",
        "pressure_msl",
        "surface_pressure",
        "wind_speed_10m",
        "wind_direction_10m",
        "wind_gusts_10m"
      ],
    };
    var response =
        await _weatherClient.get("forecast", queryParameters: queryParameters);

    return response;
  }
}
