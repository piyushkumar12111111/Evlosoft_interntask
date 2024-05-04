import 'package:dio/dio.dart';

class APIResponse {
  final Response? response;
  final int statusCode;
  final String? message;
  final bool? sucess;

  APIResponse({this.response, required this.statusCode,  this.message,  this.sucess});

}