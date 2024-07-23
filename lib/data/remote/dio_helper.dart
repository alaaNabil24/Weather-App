import 'package:dio/dio.dart';

import 'endpoints.dart';



class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: ApiEndPoints.baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout:  const Duration(seconds: 4),
          receiveTimeout: const Duration(seconds: 4),
          headers: {'Content-Type': 'application/json'}
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',

    };

    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',

    };
    return await dio!.post(
      url,
      data: body,
      queryParameters: query,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': 'en',
      'Authorization': '$token',
      'Content-Type': 'application/json',
    };
    return await dio!.put(
      url,
      data: data,
      queryParameters: query,
    );
  }
}