import 'package:dio/dio.dart';

class LocationClient {
  static Dio getClient() {
    var headers = {"X-Api-Key": "OH0riE22nff+z5EIDx3yyg==apm9hZagQ1yypyn0"};
    final options = BaseOptions(
        baseUrl: 'https://api.api-ninjas.com/v1/',
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 3),
        headers: headers);
    return Dio(options);
  }
}
