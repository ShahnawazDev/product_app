part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoaded extends ProductDetailState {
  final Product product;

  ProductDetailLoaded( {required this.product});

  @override
  List<Object?> get props => [product];
}

class ProductDetailError extends ProductDetailState {
  final String message;

  ProductDetailError({required this.message});

  @override
  List<Object?> get props => [message];
}
