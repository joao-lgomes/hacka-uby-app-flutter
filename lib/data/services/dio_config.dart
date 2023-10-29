import 'package:dio/dio.dart';

// ignore: non_constant_identifier_names
Dio DioConfig() {
  Dio dio = Dio();

  dio.options.baseUrl = 'https://hackathon-saude-71b9b.web.app';
  return dio;
}
