import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    // String baseUrl = "https://api.alquran.cloud/v1/";
    Response response = await _dio.get(endPoint);
    return response.data;
  }
}
