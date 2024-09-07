import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/core/models/product_model.dart';
import 'package:product_app/features/product_mangement/repositories/product_repository.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository productRepository;

  ProductDetailBloc({required this.productRepository})
      : super(ProductDetailLoading()) {
    on<LoadProductDetails>((event, emit) async {
      emit(ProductDetailLoading());
      try {
        final product =
            await productRepository.fetchProductDetails(event.productId);
        emit(ProductDetailLoaded(product: product));
      } catch (e) {
        emit(ProductDetailError(message: e.toString()));
      }
    });
  }
}
