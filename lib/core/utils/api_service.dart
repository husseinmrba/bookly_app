import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'www.googleapis.com/books/v1/';
  final Dio dio;

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({required String endPoind}) async {
    var response = await dio.get('$_baseUrl$endPoind');
    return response.data;
  }
}
