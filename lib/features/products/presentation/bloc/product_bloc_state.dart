import 'package:delala/features/products/data/model/Products.dart'; // Updated import

abstract class ProductState {}

class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductsLoaded extends ProductState {
  final List<Product> products;
  ProductsLoaded(this.products);
}
class ProductLoaded extends ProductState {
  final Product product;
  ProductLoaded(this.product);
}
class ProductOperationSuccess extends ProductState {
  final String message;
  ProductOperationSuccess(this.message);
}
class ProductError extends ProductState {
  final String error;
  ProductError(this.error);
}