part of 'product_list_bloc.dart';

abstract class ProductListEvent extends Equatable {
  
  @override
  List<Object> get props => [];
}

class LoadProductList extends ProductListEvent {}

class SearchProductList extends ProductListEvent {
  final String query;

  SearchProductList({required this.query});

  @override
  List<Object> get props => [query];
}
