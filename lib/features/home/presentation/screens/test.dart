// import 'package:delala/features/auth/sign_in/data/Service/auth_service.dart';
// import 'package:delala/features/home/presentation/bloc/home_bloc.dart';
// import 'package:delala/features/home/presentation/bloc/home_event.dart';
// import 'package:delala/features/home/presentation/bloc/home_state.dart';
// import 'package:delala/features/home/presentation/widget/appbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:carousel_slider/carousel_slider.dart' as carousel;
// import 'package:delala/config/routes/route_name.dart';
// import '../widget/category_button.dart';
// import '../widget/product_card.dart';
// import '../widget/promotional_card.dart';
// import '../widget/top_ranking_card.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   void _handleNavigation(
//     BuildContext context,
//     String routeName, {
//     Object? extra,
//   }) {
//     if (AuthService.checkAuth()) {
//       context.pushNamed(routeName, extra: extra);
//     } else {
//       context.pushNamed(RouteName.login);
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('Please log in to proceed')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeBloc()..add(const LoadHomeData()),
//       child: Scaffold(
//         appBar: const CustomAppBar(),
//         body: BlocBuilder<HomeBloc, HomeState>(
//           builder: (context, state) {
//             if (state is HomeInitial) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is HomeLoaded) {
//               return _buildHomeContent(context, state);
//             }
//             return const SizedBox.shrink();
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildHomeContent(BuildContext context, HomeLoaded state) {
//     TextStyle headingStyle = const TextStyle(
//       fontFamily: 'Poppins',
//       fontSize: 20,
//       fontWeight: FontWeight.bold,
//       color: Colors.black,
//       shadows: [
//         Shadow(color: Colors.black26, offset: Offset(1, 1), blurRadius: 2),
//       ],
//     );

//     TextStyle subheadingStyle = const TextStyle(
//       fontFamily: 'Poppins',
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//       color: Colors.black87,
//     );

//     TextStyle captionStyle = const TextStyle(
//       fontFamily: 'Poppins',
//       fontSize: 12,
//       fontWeight: FontWeight.w400,
//       color: Colors.grey,
//     );

//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               margin: const EdgeInsets.only(top: 10),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'What are you looking for...',
//                   hintStyle: captionStyle.copyWith(color: Colors.grey),
//                   prefixIcon: Container(
//                     margin: const EdgeInsets.only(left: 10, right: 5),
//                     child: const Icon(
//                       Icons.search,
//                       color: Colors.grey,
//                       size: 20,
//                     ),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text('Category', style: subheadingStyle),
//             const SizedBox(height: 10),

//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children:
//                       state.categories.sublist(0, 1).map((category) {
//                         return buildCategoryButton(
//                           category['title'],
//                           category['color'],
//                           category['icon'],
//                           () => _handleNavigation(
//                             context,
//                             RouteName.categoryDetails,
//                             extra: category['title'],
//                           ),
//                         );
//                       }).toList(),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children:
//                       state.categories.sublist(0, 1).map((category) {
//                         return buildCategoryButton(
//                           category['title'],
//                           category['color'],
//                           category['icon'],
//                           () => _handleNavigation(
//                             context,
//                             RouteName.categoryDetails,
//                             extra: category['title'],
//                           ),
//                         );
//                       }).toList(),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             Text('Top Ranking', style: headingStyle),
//             const SizedBox(height: 10),
//             Column(
//               children: [
//                 carousel.CarouselSlider(
//                   options: carousel.CarouselOptions(
//                     height: 150,
//                     autoPlay: false,
//                     enlargeCenterPage: true,
//                     viewportFraction: 0.4,
//                     aspectRatio: 2.0,
//                     enableInfiniteScroll: true,
//                     pageSnapping: true,
//                     onPageChanged: (index, reason) {
//                       context.read<HomeBloc>().add(ChangeCarouselIndex(index));
//                     },
//                   ),
//                   items: [
//                     buildTopRankingCard(
//                       'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
//                       'Top Deal',
//                     ),
//                     buildTopRankingCard(
//                       'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
//                       'Top Deal',
//                     ),
//                     buildTopRankingCard(
//                       'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
//                       'Top Deal',
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(
//                     3,
//                     (index) => Container(
//                       width: 8,
//                       height: 8,
//                       margin: const EdgeInsets.symmetric(horizontal: 4),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color:
//                             state.currentCarouselIndex == index
//                                 ? Colors.blue[700]
//                                 : Colors.grey[300],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             Text('Promotional Deals', style: headingStyle),
//             const SizedBox(height: 10),
//             GridView.count(
//               crossAxisCount: 2,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//               childAspectRatio: 0.75,
             
             
//               children:
//                   state.promotionalItems.map((item) {
//                     return GestureDetector(
//                       // onTap:
//                       //     () => _handleNavigation(
//                       //       context,
//                       //       RouteName.promotionalDetails,
//                       //       extra: item,
//                       //     ),
//                       child: PromotionalCard(
//                         imageUrl: item['imageUrl'],
//                         title: item['title'],
//                         price: item['price'],
//                         description: item['description'],
//                         category: item['category'],
//                         rating: item['rating'],
//                         ratingCount: item['ratingCount'],
//                         itemData: item,
//                       ),
//                     );
//                   }).toList(),
//             ),
//             const SizedBox(height: 20),
//             Text('Top Ranking', style: headingStyle),
//             const SizedBox(height: 10),
//             GridView.count(
//               crossAxisCount: 2,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//               childAspectRatio: 0.75,
//               children: [
//                 buildProductCard(
//                   'https://images.unsplash.com/photo-1572635196237-14b3f281503f',
//                   'Cloth Bags',
//                   'LKR 200.00',
//                   'MOQ: 1 piece',
//                   'Eco-friendly cloth bags for daily use.',
//                 ),
//                 buildProductCard(
//                   'https://images.unsplash.com/photo-1572635196237-14b3f281503f',
//                   '',
//                   'LKR 200.00',
//                   'MOQ: 1 piece',
//                   'Perfume set with floral fragrance.',
//                 ),
//                 buildProductCard(
//                   'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
//                   'Ford Expedition Max',
//                   'ETB 4,876.72',
//                   'Limited Stock',
//                   'Powerful SUV for family adventures.',
//                 ),
//                 buildProductCard(
//                   'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
//                   '',
//                   'Price TBD',
//                   'New Arrival',
//                   'Latest smartphone with advanced features.',
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
