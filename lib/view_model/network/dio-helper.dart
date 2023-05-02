import 'package:dio/dio.dart';

import 'endpoints.dart';

class DioHelper {
  static late Dio dio;
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: url,
        queryParameters: {
          'apikey': apiKey,
        'country':country,
          //'category':general
        },
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> get({required String path, required Map<String, dynamic>? queryParameters}) async {
    try{
      Response response=await
      dio.get(
        path,
        queryParameters: queryParameters,
      );
      return response;
    }
    catch (e){rethrow;}
  }
}