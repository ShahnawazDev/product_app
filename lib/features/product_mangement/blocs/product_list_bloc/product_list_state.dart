part of 'product_list_bloc.dart';

abstract class ProductListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductListLoading extends ProductListState {}

class ProductListLoaded extends ProductListState {
  final List<Product> products;

  ProductListLoaded({required this.products});

  @override
  List<Object?> get props => [products];
}

class ProductListError extends ProductListState {
  final String message;

  ProductListError({required this.message});

  @override
  List<Object?> get props => [message];
}
