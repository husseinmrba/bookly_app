import 'package:dio/dio.dart';

abstract class Failure {
  final String errMsg;

  Failure(this.errMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMsg);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Internal Server Error');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');
      case DioExceptionType.unknown:
        // if (dioException.message.contains('SocketException')) {
        //   return ServerFailure('No internet connection');
        // }
        return ServerFailure('Unexpected error, Please try later!');

      default:
        return ServerFailure('Opps There was an error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 403) {
      return ServerFailure('Access to the application is forbidden');
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later!');
    } else {
      return ServerFailure('Opps There was an error, Please try again');
    }
  }
}
