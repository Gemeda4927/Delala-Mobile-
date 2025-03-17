import 'package:delala/config/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class AuthService {
  static bool isLoggedIn = false;

  static void logIn() {
    isLoggedIn = false;
  }

  static void logOut() {
    isLoggedIn = false;
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "Delala",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: "What are you looking for...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Category",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Category Buttons
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3,
                children: [
                  CategoryButton(
                    label: "Real Estate",
                    icon: FontAwesomeIcons.building,
                    color: Colors.orange,
                  ),
                  CategoryButton(
                    label: "Electronics",
                    icon: FontAwesomeIcons.microchip,
                    color: Colors.blue[900]!,
                  ),
                  CategoryButton(
                    label: "Vehicles",
                    icon: FontAwesomeIcons.car,
                    color: Colors.orange,
                  ),
                  CategoryButton(
                    label: "Clothes",
                    icon: FontAwesomeIcons.tshirt,
                    color: Colors.blue[900]!,
                  ),
                ],
              ),
              SizedBox(height: 20),

              Text(
                "Top Ranking",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TopRankingItem(
                      icon: FontAwesomeIcons.shoppingBag,
                      price: "ETB 200.00",
                      description: "MOQ: 1 piece",
                    ),
                    TopRankingItem(
                      icon: FontAwesomeIcons.perbyte,
                      price: "LKR 2000.00",
                      description: "MOQ: 1 piece",
                    ),
                    TopRankingItem(
                      icon: FontAwesomeIcons.mobile,
                      price: "LKR 5000.00",
                      description: "MOQ: 1 piece",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const CategoryButton({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        if (!AuthService.isLoggedIn) {
        context.goNamed(RouteName.login);
        } else {
          print("User is not logged in: Redirecting to login...");
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Please log in to continue")));
        }
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class TopRankingItem extends StatelessWidget {
  final IconData icon;
  final String price;
  final String description;

  const TopRankingItem({
    required this.icon,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (AuthService.isLoggedIn) {
          print("User is logged in: Navigating...");
          // Navigate to the product details page
        } else {
          print("User is not logged in: Redirecting to login...");
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Please log in to continue")));
        }
      },
      child: Container(
        width: 120,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.blue),
            SizedBox(height: 5),
            Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              description,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
