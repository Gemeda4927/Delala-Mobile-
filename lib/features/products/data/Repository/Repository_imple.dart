import 'package:delala/features/products/data/model/Products.dart';
import 'package:delala/features/products/data/services/product_service.dart';
import 'package:delala/features/products/domain/repository/repository.dart';

class ProductRepository implements IProductRepository {
  final ProductService _productService;

  ProductRepository(this._productService);

  @override
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _productService.fetchProducts();

      if (response.statusCode == 200) {
        // Parse the response data into a list of Product objects
        return (response.data as List)
            .map((item) => Product.fromJson(item))
            .toList();
      } else {
        throw Exception(
          'Failed to load products: Status code ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  @override
  Future<Product> fetchProductById(int id) async {
    try {
      final response = await _productService.fetchProductById(id);

      if (response.statusCode == 200) {
        // Parse the response data into a Product object
        return Product.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to load product: Status code ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to load product: $e');
    }
  }

  @override
  Future<void> addProduct(Product product) async {
    try {
      final response = await _productService.addProduct(product);

      if (response.statusCode != 201) {
        throw Exception(
          'Failed to add product: Status code ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to add product: $e');
    }
  }

  @override
  Future<void> updateProduct(int id, Product product) async {
    try {
      final response = await _productService.updateProduct(id, product);

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to update product: Status code ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to update product: $e');
    }
  }

  @override
  Future<void> deleteProduct(int id) async {
    try {
      final response = await _productService.deleteProduct(id);

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to delete product: Status code ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to delete product: $e');
    }
  }
}
