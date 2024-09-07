
part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadProductDetails extends ProductDetailEvent {
  final int productId;

  LoadProductDetails({required this.productId});

  @override
  List<Object> get props => [productId];
}
