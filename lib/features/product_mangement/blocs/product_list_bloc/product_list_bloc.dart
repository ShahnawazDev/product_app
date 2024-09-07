import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/core/models/product_model.dart';
import 'package:product_app/features/product_mangement/repositories/product_repository.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository productRepository;
  List<Product> allProducts = [];

  ProductListBloc({required this.productRepository})
      : super(ProductListLoading()) {
    on<LoadProductList>((event, emit) async {
      emit(ProductListLoading());
      try {
        final products = await productRepository.fetchProducts();
        allProducts = products;
        emit(ProductListLoaded(products: products));
      } catch (e) {
        emit(ProductListError(message: e.toString()));
      }
    });
    add(LoadProductList());


    on<SearchProductList>((event, emit) async {
      emit(ProductListLoading());
      try {
        final filteredProducts = allProducts
            .where((product) =>
                product.name.toLowerCase().contains(event.query.toLowerCase()))
            .toList();
        emit(ProductListLoaded(products: filteredProducts));
      } catch (e) {
        emit(ProductListError(message: e.toString()));
      }
    });
  }
}
