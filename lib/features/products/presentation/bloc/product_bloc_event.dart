import 'package:delala/features/products/data/model/Products.dart'; // Updated import

abstract class ProductEvent {}

class LoadProducts extends ProductEvent {}
class LoadProduct extends ProductEvent {
  final int id;
  LoadProduct(this.id);
}
class AddProduct extends ProductEvent {
  final Product product;
  AddProduct(this.product);
}
class UpdateProduct extends ProductEvent {
  final int id;
  final Product product;
  UpdateProduct(this.id, this.product);
}
class DeleteProduct extends ProductEvent {
  final int id;
  DeleteProduct(this.id);
}