import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(
      BaseOptions(
          headers: {
            'Content-Type': 'application/json',
          },
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {'lang': lang, 'Authorization': token};
    return await dio.get(url, queryParameters: query, data: data);
  }

// post data to api
  static Future<Response> postData({
    Map<String, dynamic>? query,
    required String url,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {'lang': lang, 'Authorization': token};
    return await dio.post(url,
        data: data,
        queryParameters: query,
        options: Options(
            headers: {'Content-type': 'application/json; charset=UTF-8'}));
  }
}
