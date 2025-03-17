import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({String baseUrl = 'https://jsonplaceholder.typicode.com'})
    : dio = Dio(BaseOptions(baseUrl: baseUrl));

  // Example method to fetch data from the API
  Future<Response> fetchData(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      return response;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}

// Usage
void main() async {
  final apiService = ApiService(baseUrl: 'https://fakestoreapi.com');
  final response = await apiService.fetchData('/products');
  print(response.data);
}
