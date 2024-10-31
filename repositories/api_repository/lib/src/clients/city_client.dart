import 'package:dio/dio.dart';

class CityClient {
  static Dio getClient() {
    final options = BaseOptions(
      baseUrl: 'https://countriesnow.space/api/v0.1/',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    );
    return Dio(options);
  }
}
