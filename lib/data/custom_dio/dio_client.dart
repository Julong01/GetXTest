import 'package:auction/data/custom_dio/token_interceptor.dart';
import 'package:dio/dio.dart';

class CustomDio {
  factory CustomDio() => _instance;
  static final CustomDio _instance = CustomDio._init();
  late final Dio dio;

  CustomDio._init() {
    final custom = Dio();
    custom.interceptors.addAll([TokenInterceptor()]);
    dio = custom;
  }
}
