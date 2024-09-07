part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class LoadCart extends CartEvent {}

class AddItemToCart extends CartEvent {
  final CartItem cartItem;

  const AddItemToCart({required this.cartItem});

  @override
  List<Object?> get props => [cartItem];
}

class RemoveItemFromCart extends CartEvent {
  final CartItem cartItem;

  const RemoveItemFromCart({required this.cartItem});

  @override
  List<Object?> get props => [cartItem];
}

class UpdateItemQuantity extends CartEvent {
  final CartItem cartItem;
  final int quantity;
  const UpdateItemQuantity({required this.cartItem, required this.quantity});

  @override
  List<Object?> get props => [cartItem, quantity];
}

class ClearCart extends CartEvent {
  const ClearCart();
}
