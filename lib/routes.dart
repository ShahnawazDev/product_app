import 'package:flutter/material.dart';
import 'package:product_app/features/product_mangement/screens/product_detail_screen.dart';
import 'package:product_app/features/product_mangement/screens/product_list_screen.dart';
import 'package:product_app/features/cart/screens/cart_screen.dart';

class AppRoutes {
  static const String productList = '/';
  static const String productDetail = '/productDetail';
  static const String cart = '/cart';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case productList:
        return MaterialPageRoute(builder: (_) => const ProductListScreen());
      case productDetail:
        final productId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(productId: productId),
        );
      case cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
