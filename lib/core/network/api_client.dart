import 'package:dio/dio.dart';
import 'network_constants.dart';

class ApiClient {
  final Dio _dio;

  ApiClient._(this._dio);

  static ApiClient? _instance;

  factory ApiClient() {
    _instance ??= ApiClient._(_createDio());
    return _instance!;
  }

  static Dio _createDio() {
    final options = BaseOptions(
      baseUrl: NetworkConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Authorization': 'Bearer ${NetworkConstants.readAccessToken}',
        'Content-Type': 'application/json',
      },
    );

    final dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
    ));
    return dio;
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } on DioException {
      rethrow;
    }
  }

  Future<Response> post(String path, {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.post(path, data: data, queryParameters: queryParameters);
    } on DioException {
      rethrow;
    }
  }
}
