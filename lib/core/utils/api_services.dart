import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://newsapi.org/v2';
  final Dio dio;
  ApiServices(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get("$_baseUrl$endPoint");
    return response.data;
  }
}
