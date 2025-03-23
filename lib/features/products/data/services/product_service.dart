import 'package:delala/core/handlers/dio_client.dart';
import 'package:delala/features/products/data/model/Products.dart';
import 'package:delala/injector.dart';
import 'package:dio/dio.dart';

class ProductService {
  final DioClient _dioClient = sl<DioClient>();

  /// Function to get a list of products from the backend
  Future<Response> fetchProducts() async {
    try {
      final response = await _dioClient.dio.get('/products');
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load products');
      }
    } on DioError catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  /// Function to get a specific product by ID from the backend
  Future<Response> fetchProductById(int id) async {
    try {
      final response = await _dioClient.dio.get('/products/$id');
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load product with id $id');
      }
    } on DioError catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  /// Function to add a new product to the backend
  Future<Response> addProduct(Product product) async {
    try {
      final response = await _dioClient.dio.post(
        '/products',
        data: product.toJson(),
      );
      if (response.statusCode == 201) {
        return response;
      } else {
        throw Exception('Failed to add product');
      }
    } on DioError catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  /// Function to update an existing product on the backend
  Future<Response> updateProduct(int id, Product product) async {
    try {
      final response = await _dioClient.dio.put(
        '/products/$id',
        data: product.toJson(),
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to update product with id $id');
      }
    } on DioError catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  /// Function to delete a product from the backend
  Future<Response> deleteProduct(int id) async {
    try {
      final response = await _dioClient.dio.delete('/products/$id');
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to delete product with id $id');
      }
    } on DioError catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }
}
