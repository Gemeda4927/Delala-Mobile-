import 'package:delala/features/products/data/model/Products.dart';
abstract class IProductRepository {
  Future<List<Product>> fetchProducts();
  Future<Product> fetchProductById(int id);
  Future<void> addProduct(Product product);
  Future<void> updateProduct(int id, Product product);
  Future<void> deleteProduct(int id);
}
