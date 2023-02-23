import 'dart:convert';

import 'package:dio/dio.dart';

class ProDioConnect {
  ProDioConnect() {
    dio = Dio();
  }

  Dio dio = Dio();

  Future<dynamic> getWithBasicAuth({
    required String url,
    required String ep,
  }) async {
    try {
      String basicAuth = base64Encode(utf8.encode('abimael:abirosu75321'));

      final response = await dio.get(
        "$url$ep",
        options: Options(
          headers: <String, dynamic>{
            'Authorization': 'Basic $basicAuth',
          },
        ),
      );

      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> get({
    required String url,
    required String ep,
  }) async {
    try {
      final response = await dio.get(
        "$url$ep",
      );

      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> postWithBasicAuth({
    required String url,
    required String ep,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      String basicAuth = base64Encode(utf8.encode('abimael:abirosu75321'));

      final response = await dio.post(
        "$url$ep",
        options: Options(
          headers: <String, dynamic>{
            'Authorization': 'Basic $basicAuth',
          },
        ),
        queryParameters: queryParameters,
      );

      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
