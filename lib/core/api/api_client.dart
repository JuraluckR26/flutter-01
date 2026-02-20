import 'package:dio/dio.dart';
import 'api_error.dart';
import 'endpoints.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({String? token})
      : _dio = Dio(BaseOptions(baseUrl: Endpoints.baseUrl)) {
    if (token != null && token.isNotEmpty) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? query}) async {
    try {
      return await _dio.get<T>(path, queryParameters: query);
    } on DioException catch (e) {
      throw _mapError(e);
    }
  }

  Future<Response<T>> post<T>(String path, {Object? data}) async {
    try {
      return await _dio.post<T>(path, data: data);
    } on DioException catch (e) {
      throw _mapError(e);
    }
  }

  ApiError _mapError(DioException e) {
    final status = e.response?.statusCode;
    final msg = e.response?.data is Map && (e.response?.data['message'] != null)
        ? e.response?.data['message'].toString()
        : (e.message ?? 'Unknown error');
    return ApiError(message: msg, statusCode: status);
  }
}
