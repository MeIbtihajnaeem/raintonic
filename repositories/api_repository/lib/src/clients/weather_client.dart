import 'package:dio/dio.dart';

class WeatherClient {
  static Dio getClient() {
    final options = BaseOptions(
      baseUrl: 'https://api.open-meteo.com/v1/',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    );
    return Dio(options);
  }
}
