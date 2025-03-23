import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient({required String baseUrl})
    : dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<Response> fetchData(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      return response;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
