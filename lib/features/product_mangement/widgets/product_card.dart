import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/features/cart/bloc/cart_bloc.dart';
import 'package:product_app/features/cart/models/cart_model.dart';
import 'package:product_app/routes.dart';
import 'package:product_app/core/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.productDetail,
            arguments: product.id,
          );
        },
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  product.image,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '\$${product.price}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    bool isInCart = false;
                    if (state is CartLoaded) {
                      isInCart = state.cartItems
                          .any((item) => item.product.id == product.id);
                    }
                    return MaterialButton(
                      color: Theme.of(context).primaryColor,
                      disabledColor: Theme.of(context).primaryColorLight,
                      onPressed: isInCart
                          ? null
                          : () {
                              BlocProvider.of<CartBloc>(context).add(
                                AddItemToCart(
                                  cartItem: CartItem(
                                    product: product,
                                    quantity: 1,
                                  ),
                                ),
                              );
                            },
                      child: Text(isInCart ? 'Added to Cart' : 'Add to Cart'),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
