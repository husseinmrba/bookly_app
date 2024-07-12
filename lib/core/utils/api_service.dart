import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoind}) async {
    var response = await _dio.get('$_baseUrl$endPoind');
    return response.data;
  }
}
