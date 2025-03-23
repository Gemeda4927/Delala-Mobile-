import 'package:delala/features/home/data/models/home_data_model.dart';
import 'package:flutter/material.dart';

abstract class HomeLocalDataSource {
  Future<HomeDataModel> getHomeData();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<HomeDataModel> getHomeData() async {
    final promotionalItems = [
      {
        'imageUrl':
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
        'title': 'Luxury Villa',
        'price': 'ETB 10,000,000',
        'description': 'Spacious 5-bedroom villa with a pool.',
        'category': 'Real Estate',
        'rating': 4.8,
        'ratingCount': '5.23k',
        'model': '2023 Villa Model',
      },
      {
        'imageUrl':
            'https://images.unsplash.com/photo-1572635196237-14b3f281503f',
        'title': 'Smartphone Pro',
        'price': 'LKR 50,000',
        'description': 'Latest model with 128GB storage.',
        'category': 'Electronics',
        'rating': 4.5,
        'ratingCount': '10k',
        'model': '2023 Smartphone Pro',
      },
      {
        'imageUrl':
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
        'title': 'Ford SUV',
        'price': 'ETB 5,000,000',
        'description': '2023 model, low mileage.',
        'category': 'Vehicles',
        'rating': 4.7,
        'ratingCount': '5k',
        'model': '2023 Ford Expedition',
      },
      {
        'imageUrl':
            'https://images.unsplash.com/photo-1572635196237-14b3f281503f',
        'title': 'Designer Jacket',
        'price': 'LKR 5,000',
        'description': 'Stylish and warm for winter.',
        'category': 'Clothes',
        'rating': 4.3,
        'ratingCount': '3k',
        'model': 'Winter 2023 Collection',
      },
    ];

    final categories = [
      {'title': 'House', 'color': const Color(0xFFFF6200), 'icon': Icons.home},
      {
        'title': 'Electronics',
        'color': const Color(0xFF0052CC),
        'icon': Icons.electrical_services,
      },
      {
        'title': 'Vehicles',
        'color': const Color(0xFFFF6200),
        'icon': Icons.directions_car,
      },
      {
        'title': 'Clothes',
        'color': const Color(0xFF0052CC),
        'icon': Icons.local_shipping,
      },
      {
        'title': 'Furniture',
        'color': const Color(0xFFFF6200),
        'icon': Icons.chair,
      },
      {
        'title': 'Appliances',
        'color': const Color(0xFF0052CC),
        'icon': Icons.kitchen,
      },
    ];

    final carouselItems = [
      {
        'imageUrl':
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
        'title': 'Top Deal 1',
      },
      {
        'imageUrl':
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
        'title': 'Top Deal 2',
      },
      {
        'imageUrl':
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
        'title': 'Top Deal 3',
      },
    ];

    return HomeDataModel(
      promotionalItems: promotionalItems,
      categories: categories,
      carouselItems: carouselItems,
    );
  }
}
