class AppException implements Exception {
  final String message;
  final int? statusCode;
  final String? error;
  final dynamic data;

  AppException({
    required this.message,
    this.statusCode,
    this.error,
    this.data,
  });

  @override
  String toString() {
    return 'AppException: $message';
  }
}

class NetworkException extends AppException {
  NetworkException({
    String message = 'Network error occurred',
    int? statusCode,
    String? error,
    dynamic data,
  }) : super(
    message: message,
    statusCode: statusCode,
    error: error,
    data: data,
  );
}

class ApiException extends AppException {
  ApiException({
    required String message,
    int? statusCode,
    String? error,
    dynamic data,
  }) : super(
    message: message,
    statusCode: statusCode,
    error: error,
    data: data,
  );
}




