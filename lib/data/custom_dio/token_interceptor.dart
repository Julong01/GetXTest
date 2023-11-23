import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final key = dotenv.env["apiKey"];
    if (key != null) {
      options.headers["authorization"] = "bearer $key";
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      if (err.response!.statusCode == 401 || err.response!.statusCode == 503) {
        Get.defaultDialog(
            title: "알림",
            content: Text(err.response?.data["Message"]),
            textConfirm: "확인",
            confirmTextColor: Colors.white,
            onConfirm: () => Get.offAllNamed('/'));
      }
    }

    super.onError(err, handler);
  }
}
