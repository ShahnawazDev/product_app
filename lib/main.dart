import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/core/theme/app_theme.dart';
import 'package:product_app/core/utils/product_service.dart';
import 'package:product_app/features/product_mangement/blocs/product_detail_bloc/product_detail_bloc.dart';
import 'package:product_app/features/product_mangement/blocs/product_list_bloc/product_list_bloc.dart';
import 'package:product_app/features/product_mangement/repositories/product_repository.dart';
import 'package:product_app/routes.dart';
import 'package:product_app/features/cart/bloc/cart_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = ProductService();
    final productRepository = ProductRepository(productService: productService);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductListBloc(productRepository: productRepository),
        ),
        BlocProvider(
          create: (context) =>
              ProductDetailBloc(productRepository: productRepository),
        ),
        BlocProvider(
          create: (context) => CartBloc(productRepository: productRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        // themeMode: ThemeMode.dark,
        initialRoute: AppRoutes.productList,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
