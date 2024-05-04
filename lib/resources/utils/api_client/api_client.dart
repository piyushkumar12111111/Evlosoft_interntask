import 'dart:convert';

import 'package:dio/dio.dart';

import '../error/exception_handler.dart';
import '../logger/dio_logger_mannual.dart';
import 'api_end_points.dart';

class ApiClient {
  final Dio dio;

  ApiClient() : dio = Dio() {
    dio.options.baseUrl = ApiEndPoints.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 10);

    dio.options.validateStatus = (status) {
      return true;
    };
    //dio.options.contentType = "multipart/form-data";
    dio.options.receiveDataWhenStatusError = true;
    dio.options.contentType = "application/json";
    dio.options.responseType = ResponseType.plain;
    // update ur Bearer token here from local storage
    dio.options.headers['Authorization'] =
        'Bearer 66|Ug1RAZqGHwKq1jqv3YXQNcCxR9vJ0xjaBdXbIWsg';
    dio.interceptors.add(PrettyDioLogger(
        maxWidth: 100,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        responseBobyInJson: true));
  }

  //
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  Future<Response> post(String path, Map<String, dynamic> data) async {
    var formData = FormData.fromMap(data);
    try {
      final response = await dio.post(path, data: formData);
      return response;
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  Future<Response> postWithImage(String path, FormData formData) async {
    try {
      dio.options.contentType = "multipart/form-data";
      final response = await dio.post(path, data: formData);
      return response;
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }
}

dynamic _processResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return response;
    case 201:
      return response;
    case 400: //Bad request
      throw BadRequestException(jsonDecode(response.data)['message']);
    case 401: //Unauthorized
      throw UnAuthorizedException(
          jsonDecode(response.data)['message'], "", response.statusCode);
    case 403: //Forbidden
      throw UnAuthorizedException(jsonDecode(response.data)['message']);
    case 404: //Resource Not Found
      throw NotFoundException(jsonDecode(response.data)['message']);
    case 500: //Internal Server Error
    default:
      throw FetchDataException('Something went wrong! ${response.statusCode}');
  }
}
