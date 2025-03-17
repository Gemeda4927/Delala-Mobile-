import 'package:delala/features/products/data/Repository/Repository_imple.dart';
import 'package:delala/features/products/presentation/bloc/product_bloc_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delala/features/products/presentation/bloc/product_bloc_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ProductInitial()) {
    // Event: Load all products
    on<LoadProducts>(_onLoadProducts);

    // Event: Load a single product by ID
    on<LoadProduct>(_onLoadProduct);

    // Event: Add a new product
    on<AddProduct>(_onAddProduct);

    // Event: Update an existing product
    on<UpdateProduct>(_onUpdateProduct);

    // Event: Delete a product
    on<DeleteProduct>(_onDeleteProduct);
  }

  // Handler for LoadProducts event
  Future<void> _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products = await productRepository.fetchProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  // Handler for LoadProduct event
  Future<void> _onLoadProduct(LoadProduct event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final product = await productRepository.fetchProductById(event.id);
      emit(ProductLoaded(product));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  // Handler for AddProduct event
  Future<void> _onAddProduct(AddProduct event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      await productRepository.addProduct(event.product);
      emit(ProductOperationSuccess('Product added successfully'));
      final products = await productRepository.fetchProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  // Handler for UpdateProduct event
  Future<void> _onUpdateProduct(UpdateProduct event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      await productRepository.updateProduct(event.id, event.product);
      emit(ProductOperationSuccess('Product updated successfully'));
      final products = await productRepository.fetchProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  // Handler for DeleteProduct event
  Future<void> _onDeleteProduct(DeleteProduct event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      await productRepository.deleteProduct(event.id);
      emit(ProductOperationSuccess('Product deleted successfully'));
      final products = await productRepository.fetchProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}