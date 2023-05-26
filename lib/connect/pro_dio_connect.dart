import 'package:dio/dio.dart';

class ProDioConnect {
  ProDioConnect() {
    dio = Dio();
  }

  Dio dio = Dio();

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
      rethrow;
    }
  }

  Future<dynamic> post({
    required String url,
    required String ep,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.post(
        "$url$ep",
        queryParameters: queryParameters,
        data: data,
        options: Options(
          headers: headers,
        ),
      );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
