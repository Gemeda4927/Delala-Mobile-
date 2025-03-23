// router file
import 'package:delala/base_page.dart';
import 'package:delala/config/routes/route_name.dart';
import 'package:delala/features/auth/sign_in/presentation/sign_in.dart';
import 'package:delala/features/auth/sign_up/presentation/sign_up.dart';
import 'package:delala/features/cart/presentation/cart_page.dart';
import 'package:delala/features/chat/presentation/chat_screen.dart';
import 'package:delala/features/home/presentation/screens/home_screen.dart';
import 'package:delala/features/products/presentation/screen/house_detail_screen.dart';
import 'package:delala/features/products/presentation/screen/product_detail_screen.dart';
import 'package:delala/features/profile/presentation/profile_page.dart';
import 'package:delala/features/splash/presentation/screen/splash_page.dart';
import 'package:delala/features/todo/presentation/pages/todo_list_page.dart';
import 'package:delala/features/welcome_page.dart';
import 'package:delala/features/wishlist/presentation/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouteName.splash,
  routes: [
    GoRoute(
      path: RouteName.splash,
      name: RouteName.splash,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: RouteName.welcome,
      name: RouteName.welcome,
      builder: (context, state) => WelcomePage(),
    ),
    GoRoute(
      path: RouteName.login,
      name: RouteName.login,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: RouteName.signup,
      name: RouteName.signup,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: RouteName.todo,
      name: RouteName.todo,
      builder: (context, state) => TodoListPage(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => BasePage(child: child),
      routes: [
        GoRoute(
          path: RouteName.home,
          name: RouteName.home,
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: RouteName.wishlist,
          name: RouteName.wishlist,
          builder: (context, state) => WishlistPage(),
        ),
        GoRoute(
          path: RouteName.chat,
          name: RouteName.chat,
          builder: (context, state) => ChatScreen(),
        ),
        GoRoute(
          path: RouteName.cart,
          name: RouteName.cart,
          builder: (context, state) => CartPage(),
        ),
        GoRoute(
          path: RouteName.itemDetails,
          name: RouteName.itemDetails,
          builder: (context, state) => ItemDetailsScreen(),
        ),
        GoRoute(
          path: RouteName.profile,
          name: RouteName.profile,
          builder: (context, state) => ProfilePage(),
        ),
        GoRoute(
          path: RouteName.categoryDetails,
          name: RouteName.categoryDetails,
          builder: (context, state) {
            final category = state.extra as String?;
            return category != null
                ? CategoryDetailsScreen(category: category)
                : Scaffold(body: Center(child: Text('No category selected')));
          },
        ),
      ],
    ),
  ],
);
