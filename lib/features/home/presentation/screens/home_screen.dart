// home_screen.dart
import 'package:delala/config/routes/route_name.dart';
import 'package:delala/features/auth/sign_in/data/Service/auth_service.dart';
import 'package:delala/features/home/data/repositories/home_repository_impl.dart';
import 'package:delala/features/home/data/service/home_local_data_source.dart';
import 'package:delala/features/home/domain/usecases/get_home_data.dart';
import 'package:delala/features/home/presentation/bloc/home_bloc.dart';
import 'package:delala/features/home/presentation/bloc/home_event.dart';
import 'package:delala/features/home/presentation/bloc/home_state.dart';
import 'package:delala/features/home/presentation/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import '../widget/category_button.dart';
import '../widget/product_card.dart';
import '../widget/promotional_card.dart';
import '../widget/top_ranking_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _handleNavigation(
    BuildContext context,
    String routeName, {
    Object? extra,
  }) {
    if (SignInService.isAuthenticated()) {
      context.pushNamed(routeName, extra: extra);
    } else {
      context.pushNamed(RouteName.login);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please log in to proceed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeLocalDataSource = HomeLocalDataSourceImpl();
    final homeRepository = HomeRepositoryImpl(homeLocalDataSource);
    final getHomeData = GetHomeData(homeRepository);

    return BlocProvider(
      create: (context) => HomeBloc(getHomeData)..add(const LoadHomeData()),
      child: Scaffold(
        appBar: const CustomAppBar(),
        drawer: _buildDrawer(context),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return _buildHomeContent(context, state);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0288D1), // Deep Sky Blue
                    Color(0xFF03A9F4), // Light Sky Blue
                  ],
                ),
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!SignInService.isAuthenticated()) {
                            _handleNavigation(context, RouteName.login);
                          } else {
                            // _handleNavigation(context, RouteName.myProfile);
                          }
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white.withOpacity(0.3),
                              child: const Icon(
                                Icons.person,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Text(
                              'Sign in | Register',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    SignInService.isAuthenticated()
                        ? 'Welcome Back!'
                        : 'Join us today!',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.home,
              title: 'Home',
              routeName: RouteName.home,
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.category,
              title: 'Categories',
              routeName: RouteName.categoryDetails,
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.favorite,
              title: 'Wishlist',
              routeName: RouteName.wishlist,
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.shopping_cart,
              title: 'My Orders', routeName: '',
              // routeName: RouteName.myOrders,
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.person,
              title: 'My Profile', routeName: '',
              // routeName: RouteName.myProfile,
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.headset_mic,
              title: 'Contact Us', routeName: '',
              // routeName: RouteName.contactUs,
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.info,
              title: 'About', routeName: '',
              // routeName: RouteName.about,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String routeName,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF0288D1).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF0288D1), size: 28),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontFamily: 'Poppins',
          ),
        ),
        onTap: () {
          Navigator.of(context).pop();
          _handleNavigation(context, routeName);
        },
        hoverColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildHomeContent(BuildContext context, HomeLoaded state) {
    const TextStyle headingStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      shadows: [
        Shadow(color: Colors.black26, offset: Offset(1, 1), blurRadius: 2),
      ],
    );

    const TextStyle subheadingStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    );

    const TextStyle captionStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'What are you looking for...',
                  hintStyle: captionStyle.copyWith(color: Colors.grey),
                  prefixIcon: Container(
                    margin: const EdgeInsets.only(left: 10, right: 5),
                    child: const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 20,
                    ),
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
            const SizedBox(height: 20),
            Text('Category', style: subheadingStyle),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      state.categories.sublist(0, 3).map((category) {
                        return buildCategoryButton(
                          category['title'],
                          category['color'],
                          category['icon'],
                          () => _handleNavigation(
                            context,
                            RouteName.categoryDetails,
                            extra: category['title'],
                          ),
                        );
                      }).toList(),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      state.categories.sublist(3, 6).map((category) {
                        return buildCategoryButton(
                          category['title'],
                          category['color'],
                          category['icon'],
                          () => _handleNavigation(
                            context,
                            RouteName.categoryDetails,
                            extra: category['title'],
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Top Ranking', style: headingStyle),
            const SizedBox(height: 10),
            Column(
              children: [
                carousel.CarouselSlider(
                  options: carousel.CarouselOptions(
                    height: 150,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.4,
                    aspectRatio: 2.0,
                    enableInfiniteScroll: true,
                    pageSnapping: true,
                    onPageChanged: (index, reason) {
                      context.read<HomeBloc>().add(ChangeCarouselIndex(index));
                    },
                  ),
                  items:
                      state.carouselItems.map((item) {
                        return buildTopRankingCard(
                          item['imageUrl'],
                          item['title'],
                        );
                      }).toList(),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    state.carouselItems.length,
                    (index) => Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            state.currentCarouselIndex == index
                                ? Colors.blue[700]
                                : Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Promotional Deals', style: headingStyle),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
              children:
                  state.promotionalItems.map((item) {
                    return GestureDetector(
                      onTap:
                          () => _handleNavigation(
                            context,
                            RouteName.itemDetails,
                            extra: item,
                          ),
                      child: PromotionalCard(
                        imageUrl: item['imageUrl'],
                        title: item['title'],
                        price: item['price'],
                        description: item['description'],
                        category: item['category'],
                        rating: item['rating'],
                        ratingCount: item['ratingCount'],
                        itemData: item,
                      ),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 20),
            Text('Top Ranking', style: headingStyle),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
              children:
                  state.promotionalItems.map((item) {
                    return GestureDetector(
                      onTap:
                          () => _handleNavigation(
                            context,
                            RouteName.itemDetails,
                            extra: item,
                          ),
                      child: buildProductCard(
                        item['imageUrl'],
                        item['title'],
                        item['price'],
                        item['description'],
                        item['rating'].toString(),
                      ),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
