import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();
  static void init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData({
    required String urlPath,
    required Map<String, dynamic> query,
    required Map<String, dynamic> data,
  }) async {
    return await dio.get(urlPath, queryParameters: query, data: data);
  }

  static Future<Response> postData(
    Map<String, dynamic> query, {
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      url,
      options: Options(),
      data: data,
    );
  }
}
