import 'package:delala/config/routes/route_name.dart';
import 'package:delala/features/products/data/services/product_service.dart'; // Import your product service
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the instance of ProductService from GetIt
    final productService = GetIt.instance<ProductService>();

    return Scaffold(
      body: Center(child: Text('Welcome page')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () async {
          // Fetch the product from the service
          final product = await productService.fetchProducts();

          // Navigate to the products page and pass the actual product data
          context.goNamed(
            RouteName.products,
            extra: product, // Pass the actual product object here
          );
        },
      ),
    );
  }
}
