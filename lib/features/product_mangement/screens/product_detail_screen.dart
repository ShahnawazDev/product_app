import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/features/cart/bloc/cart_bloc.dart';
import 'package:product_app/features/cart/models/cart_model.dart';
import 'package:product_app/features/product_mangement/blocs/product_detail_bloc/product_detail_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    BlocProvider.of<ProductDetailBloc>(context)
        .add(LoadProductDetails(productId: productId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoading) {
            if (kDebugMode) {
              debugPrint("product description loading");
            }
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductDetailLoaded) {
            final product = state.product;
            if (kDebugMode) {
              debugPrint("product description loaded ${product.description}");
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Image.network(
                        product.image,
                       
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      product.name,
                      style: theme.textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${product.price}',
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      product.description??'',
                      style: theme.textTheme.bodyMedium,
                    ),
                    // const Spacer(),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        bool isInCart = false;
                        if (state is CartLoaded) {
                          isInCart = state.cartItems
                              .any((item) => item.product.id == product.id);
                        }
                        return isInCart
                            ? ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/cart');
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                                child: const Text('Go to Cart'),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                                onPressed: () {
                                  BlocProvider.of<CartBloc>(context).add(
                                    AddItemToCart(
                                      cartItem: CartItem(
                                          product: product, quantity: 1),
                                    ),
                                  );
                                },
                                child: const Text('Add to Cart'),
                              );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ProductDetailError) {
            if (kDebugMode) {
              debugPrint("product description not loaded ${state.message}");
            }
            return Center(
              child: Text(
                state.message,
                style: theme.textTheme.bodyLarge,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
