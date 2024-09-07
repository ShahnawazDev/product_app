import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/core/utils/shared_preferences_service.dart';
import 'package:product_app/features/product_mangement/repositories/product_repository.dart';
import 'package:product_app/features/cart/models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ProductRepository productRepository;

  CartBloc({required this.productRepository}) : super(CartInitial()) {
    on<AddItemToCart>(_onAddItemToCart);
    on<RemoveItemFromCart>(_onRemoveItemFromCart);
    on<UpdateItemQuantity>(_onUpdateItemQuantity);
    on<ClearCart>(_onClearCart);
    on<LoadCart>(_onLoadCart);
    add(LoadCart());
  }

  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    final cartList = await SharedPreferencesService.loadCart();
    final cartItems = await Future.wait(cartList.map((item) async {
      final product = await productRepository.getProductById(item['productId']);
      return CartItem(
        product: product,
        quantity: item['quantity'],
      );
    }).toList());
    emit(CartLoaded(cartItems: cartItems));
  }

  Future<void> _saveCart(List<CartItem> cartItems) async {
    final cartList = cartItems
        .map((item) => {
              'productId': item.product.id,
              'quantity': item.quantity,
            })
        .toList();
    await SharedPreferencesService.saveCart(cartList);
  }

  void _onAddItemToCart(AddItemToCart event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final cartItems = List<CartItem>.from((state as CartLoaded).cartItems)
        ..add(event.cartItem);
      emit(CartLoaded(cartItems: cartItems));
      _saveCart(cartItems);
    } else {
      final cartItems = [event.cartItem];
      emit(CartLoaded(cartItems: cartItems));
      _saveCart(cartItems);
    }
  }

  void _onRemoveItemFromCart(
      RemoveItemFromCart event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final cartItems = List<CartItem>.from((state as CartLoaded).cartItems)
        ..remove(event.cartItem);
      emit(CartLoaded(cartItems: cartItems));
      _saveCart(cartItems);
    }
  }

  void _onUpdateItemQuantity(
      UpdateItemQuantity event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final cartItems = (state as CartLoaded).cartItems.map((cartItem) {
        return cartItem.product.id == event.cartItem.product.id
            ? CartItem(product: cartItem.product, quantity: event.quantity)
            : cartItem;
      }).toList();
      emit(CartLoaded(cartItems: cartItems));
      _saveCart(cartItems);
    }
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(CartInitial());
    SharedPreferencesService.clearCart();
  }
}
