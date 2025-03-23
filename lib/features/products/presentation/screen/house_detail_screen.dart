import 'package:delala/config/routes/route_name.dart';
import 'package:delala/features/home/presentation/widget/promotional_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String category;

  const CategoryDetailsScreen({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = _getItemsForCategory(category);
    const int itemCount = 52082;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delala',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {
              // Implement filter logic
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar with Sort Button
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'What are you looking for...',
                      hintStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.sort, color: Colors.grey, size: 20),
                      SizedBox(width: 4),
                      Text(
                        'Sort',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Item Count Header
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$itemCount+ items',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          // Grid of Items
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
                children:
                    items.map((item) {
                      return GestureDetector(
                        onTap: () {
                          GoRouter.of(
                            context,
                          ).pushNamed(RouteName.itemDetails, extra: item);
                        },
                        child: PromotionalCard(
                          imageUrl: item['imageUrl'],
                          title: item['title'],
                          price: item['price'],
                          description: item['description'],
                          category: category,
                          rating: item['rating'],
                          ratingCount: item['ratingCount'],
                          itemData: item,
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getItemsForCategory(String category) {
    switch (category) {
      case 'House':
        return [
          {
            'imageUrl':
                'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
            'title': 'Villa House',
            'price': 'ETB 52,002',
            'description': 'A beautiful villa house.',
            'rating': 4.5,
            'ratingCount': '2.3k',
            'category': 'House',
            'model': '2023 Villa Model',
          },
          {
            'imageUrl':
                'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2',
            'title': 'Apartment',
            'price': 'ETB 52,002',
            'description': 'A modern apartment.',
            'rating': 4.7,
            'ratingCount': '1.8k',
            'category': 'House',
            'model': '2023 Apartment Unit',
          },
          {
            'imageUrl':
                'https://images.unsplash.com/photo-1598928506311-c55ded91a20c',
            'title': 'Farmhouse',
            'price': 'ETB 52,002',
            'description': 'Unfinished farmhouse.',
            'rating': 4.2,
            'ratingCount': '1.5k',
            'category': 'House',
            'model': '2023 Farmhouse',
          },
          {
            'imageUrl':
                'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
            'title': 'House for Rent',
            'price': 'ETB 52,002',
            'description': 'Free to rent, the foundation, walls.',
            'rating': 4.0,
            'ratingCount': '1.2k',
            'category': 'House',
            'model': '2023 Rental House',
          },
          {
            'imageUrl':
                'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2',
            'title': 'Shop',
            'price': 'ETB 52,002',
            'description': 'House for shop or office.',
            'rating': 4.3,
            'ratingCount': '900',
            'category': 'House',
            'model': '2023 Shop Space',
          },
        ];
      case 'coming soon':
        return [
          {
            'imageUrl':
                'https://images.unsplash.com/photo-1572635196237-14b3f281503f',
            'title': 'Coming Soon',
            'price': 'TBD',
            'description': 'This feature is coming soon.',
            'rating': 0.0,
            'ratingCount': '0',
            'category': 'coming soon',
            'model': 'N/A',
          },
        ];
      default:
        return [];
    }
  }
}
