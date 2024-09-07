import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/features/cart/bloc/cart_bloc.dart';
import 'package:product_app/features/cart/models/cart_model.dart';

class CartListTile extends StatelessWidget {
  const CartListTile({
    super.key,
    required this.cartItem,
    required this.cartItems,
  });

  final CartItem cartItem;
  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            cartItem.product.image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          cartItem.product.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          'Quantity: ${cartItem.quantity} x \$${cartItem.product.price.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () {
                if (cartItem.quantity > 1) {
                  context
                      .read<CartBloc>()
                      .add(UpdateItemQuantity(
                        cartItem: cartItem,
                        quantity: cartItem.quantity - 1,
                      ));
                } else {
                  context.read<CartBloc>().add(
                      RemoveItemFromCart(cartItem: cartItem));
                  if (cartItems.length == 1) {
                    context
                        .read<CartBloc>()
                        .add(const ClearCart());
                  }
                }
              },
            ),
            Text(
              '${cartItem.quantity}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: () {
                context
                    .read<CartBloc>()
                    .add(UpdateItemQuantity(
                      cartItem: cartItem,
                      quantity: cartItem.quantity + 1,
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
