class AppException implements Exception {
  final String message;
  final String? code;

  AppException({required this.message, this.code});

  @override
  String toString() => message;
}

class ApiException extends AppException {
  ApiException({required super.message, super.code});
}

class CacheException extends AppException {
  CacheException({required super.message});
}
