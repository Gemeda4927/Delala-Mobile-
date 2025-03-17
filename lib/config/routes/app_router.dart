import 'package:delala/base_page.dart';
import 'package:delala/config/routes/route_name.dart';
import 'package:delala/features/auth/sign_in/presentation/sign_in.dart';
import 'package:delala/features/auth/sign_up/presentation/sign_up.dart';
import 'package:delala/features/cart/presentation/cart_page.dart';
import 'package:delala/features/chat/presentation/chat_page.dart';
import 'package:delala/features/home/presentation/screens/home_screen.dart';
import 'package:delala/features/products/data/model/Products.dart';
import 'package:delala/features/products/presentation/product_page.dart';
import 'package:delala/features/profile/presentation/profile_page.dart';
import 'package:delala/features/splash/presentation/screen/splash_page.dart';
import 'package:delala/features/todo/presentation/pages/todo_list_page.dart';
import 'package:delala/features/welcome_page.dart';
import 'package:delala/features/wishlist/presentation/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouteName.splash,
  routes: [
    GoRoute(
      path: RouteName.products,
      name: RouteName.products,
      builder: (context, state) {
        return SplashScreen();
      },
    ),
    GoRoute(
      path: RouteName.todo,
      name: RouteName.todo,
      builder: (context, state) {
        return TodoListPage();
      },
    ),
    GoRoute(
      path: RouteName.welcome,
      name: RouteName.welcome,
      builder: (context, state) {
        return WelcomePage();
      },
    ),
    GoRoute(
      path: RouteName.signup,
      name: RouteName.signup,
      builder: (context, state) {
        return SignUpScreen();
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return BasePage(child: child);
      },
      routes: [
        GoRoute(
          path: RouteName.home,
          name: RouteName.home,
          builder: (context, state) {
            return HomeScreen();
          },
        ),
        GoRoute(
          path: RouteName.wishlist,
          name: RouteName.wishlist,
          builder: (context, state) {
            return WishlistPage();
          },
        ),
        GoRoute(
          path: RouteName.chat,
          name: RouteName.chat,
          builder: (context, state) {
            return ChatPage();
          },
        ),
        GoRoute(
          path: RouteName.cart,
          name: RouteName.cart,
          builder: (context, state) {
            return CartPage();
          },
        ),
        GoRoute(
          path: RouteName.profile,
          name: RouteName.profile,
          builder: (context, state) {
            return ProfilePage();
          },
        ),
        // Adding Product screen route
        GoRoute(
          path: '/products',
          name: RouteName.products,
          builder: (context, state) {
            final product = state.extra as Product?;
            if (product == null) {
              // Handle the case where the product is null (e.g., show an error or a default screen).
              return Scaffold(
                body: Center(child: Text('No product available')),
              );
            }
            return ProductScreen(product: product);
          },
        ),
      ],
    ),
  ],
);
