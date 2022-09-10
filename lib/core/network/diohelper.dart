import 'package:dio/dio.dart';
import 'package:weather_app/core/network/api_constants.dart';

class DioHelper {
  static late Dio dio;

  static final DioHelper _instance = DioHelper._internal();
  factory DioHelper() => _instance;
  DioHelper._internal() {
    dio = Dio(BaseOptions(
        baseUrl: ApiConstants.baseUrl, receiveDataWhenStatusError: true));
  }
  static Future<Response> getData(
      {required String path, required Map<String, dynamic> query}) async {
    return await dio.get(path, queryParameters: query);
  }
}

