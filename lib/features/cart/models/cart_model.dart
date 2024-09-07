import 'package:product_app/core/models/product_model.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, this.quantity = 1});
}
