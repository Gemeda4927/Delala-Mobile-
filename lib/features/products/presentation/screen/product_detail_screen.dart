import 'package:delala/config/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key});

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  // Map of house variants to their respective image lists
  final Map<String, List<String>> houseVariantImages = {
    '2 BHK': [
      './../../../../assets/images/House1.jpg',
      './../../../../assets/images/House2.jpg',
    ],
    '3 BHK': [
      './../../../../assets/images/House1.jpg',
      './../../../../assets/images/House2.jpg',
    ],
    '4 BHK': [
      './../../../../assets/images/House1.jpg',
      './../../../../assets/images/House2.jpg',
    ],
    '5 BHK': [
      './../../../../assets/images/House1.jpg',
      './../../../../assets/images/House2.jpg',
    ],
    '6 BHK': [
      './../../../../assets/images/House1.jpg',
      './../../../../assets/images/House.jpg',
    ],
  };

  String selectedVariant = '2 BHK';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.redAccent),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Added to favorites!")),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel for House Images
              _buildImageCarousel(),
              const SizedBox(height: 20),

              // House Size Options with onTap
              Wrap(
                spacing: 12,
                runSpacing: 10,
                children:
                    houseVariantImages.keys.map((size) {
                      return _buildSizeOption(size, size == selectedVariant);
                    }).toList(),
              ),
              const SizedBox(height: 20),

              // House Title & Ratings with minimized font and modern color
              const Text(
                'Luxury Ethiopian Family House',
                style: TextStyle(
                  fontSize: 22, // Reduced from 28
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00695C), // Deep Teal
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ...List.generate(
                    5,
                    (index) => const Icon(
                      Icons.star,
                      color: Color(0xFFFFD700),
                      size: 24,
                    ), // Yellow stars
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '(4.8/5)',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Price and Discount
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Price with bold font and color
                  const Text(
                    'ETB 25,000,000', // Ethiopian Birr (ETB)
                    style: TextStyle(
                      fontSize: 26, // Uniform font size
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00695C), // Deep Teal
                    ),
                  ),
                  const SizedBox(width: 20),

                  // Strikethrough price with light grey color
                  const Text(
                    'ETB 27,500,000',
                    style: TextStyle(
                      fontSize: 26, // Uniform font size
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 20),

                  // Discount badge with 100% opacity and rounded corners
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF5252), // Solid Red (100% opacity)
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Text(
                      '10% Off',
                      style: TextStyle(
                        fontSize: 16, // Uniform font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // House Details Section with minimized title font
              _buildDetailSection(
                title: 'House Details',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow(
                      label: 'Location',
                      value: 'Addis Ababa, Bole',
                      color: const Color(0xFF00695C), // Deep Teal
                    ),
                    _buildDetailRow(
                      label: 'Area',
                      value: '350 m²',
                      color: const Color(0xFFFFD700),
                    ),
                    _buildDetailRow(
                      label: 'Bedrooms',
                      value: '5',
                      color: const Color(0xFFFF0000),
                    ),
                    _buildDetailRow(
                      label: 'Bathrooms',
                      value: '4',
                      color: const Color(0xFF00695C),
                    ),
                    _buildDetailRow(
                      label: 'Garage',
                      value: '2 Cars',
                      color: const Color(0xFFFFD700),
                    ),
                    _buildDetailRow(
                      label: 'Year Built',
                      value: '2020',
                      color: const Color(0xFFFF0000),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // House Description with minimized title font
              _buildDetailSection(
                title: 'Description',
                content: const Text(
                  'This luxurious Ethiopian-style family home is located in the heart of Addis Ababa, featuring traditional design elements combined with modern comforts. '
                  'It includes a spacious injera kitchen, a lush garden, and smart home features, perfect for a family seeking elegance and cultural charm.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Contact Owner Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    try {
                      // Show a snackbar indicating that the user is navigating to the chat screen
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Opening Chat with the owner..."),
                        ),
                      );

                      // Navigate to the Chat Screen using GoRouter
                      context.go(RouteName.chat);
                    } catch (e) {
                      // If an error occurs, show an error snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error: ${e.toString()}")),
                      );
                    }
                  },
                  icon: const Icon(Icons.call, color: Colors.white),
                  label: const Text(
                    'Contact Owner',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF00695C,
                    ), // Deep Teal button
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 2,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Similar Houses with minimized title font
              _buildDetailSection(
                title: 'Similar Houses',
                content: SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: similarHouses.length,
                    itemBuilder: (context, index) {
                      final house = similarHouses[index];
                      return _buildSimilarHouse(
                        house['image']!,
                        house['title']!,
                        house['price']!,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Carousel for House Images
  Widget _buildImageCarousel() {
    final List<String> houseImages = houseVariantImages[selectedVariant]!;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
        ),
        items:
            houseImages.map((imagePath) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 300,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.broken_image,
                        size: 60,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              );
            }).toList(),
      ),
    );
  }

  // Detail Section Widget with minimized title font
  Widget _buildDetailSection({required String title, required Widget content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18, // Reduced from 22
            fontWeight: FontWeight.bold,
            color: Color(0xFF00695C), // Deep Teal
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: content,
        ),
      ],
    );
  }

  // Enhanced Detail Row Widget with Modern Colors
  Widget _buildDetailRow({
    required String label,
    required String value,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: color, // Dynamic modern/Ethiopian color
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  // Similar House Widget with Enhanced Text Styling and Icon
  Widget _buildSimilarHouse(String imageUrl, String title, String price) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imageUrl,
              height: 140,
              width: 180,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 140,
                  width: 180,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.broken_image,
                    size: 50,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Icon(
                  Icons.home,
                  color: Color(0xFF00695C), // Deep Teal icon
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                          letterSpacing: 0.2,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFD700), // Yellow price
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Size Option Widget with onTap and Highlight
  Widget _buildSizeOption(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedVariant = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:
                isSelected
                    ? [
                      const Color(0xFFFF0000),
                      const Color(0xFFFFD700),
                    ] // Red to Yellow
                    : [Colors.pink.shade200, Colors.pink.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.pink.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

// Updated Dummy Data for Similar Houses (Ethiopian-inspired)
final List<Map<String, String>> similarHouses = [
  {
    'image': './../../../../assets/images/House1.jpg',
    'title': 'Addis Villa',
    'price': 'ETB 22,500,000',
  },
  {
    'image': './../../../../assets/images/House2.jpg',
    'title': 'Gondar Mansion',
    'price': 'ETB 60,000,000',
  },
  {
    'image': './../../../../assets/images/House3.jpg',
    'title': 'Lalibela Apartment',
    'price': 'ETB 15,000,000',
  },
  {
    'image': './../../../../assets/images/House3.jpg',
    'title': 'Axum Cottage',
    'price': 'ETB 17,500,000',
  },
  {
    'image': './../../../../assets/images/House3.jpg',
    'title': 'Bahir Dar Condo',
    'price': 'ETB 30,000,000',
  },
];
