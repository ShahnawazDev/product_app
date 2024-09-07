// import '../models/product_model.dart';

// class ProductRepository {
//   // Simulating network request with a delay
//   Future<List<Product>> fetchProducts() async {
//     await Future.delayed(const Duration(milliseconds: 100));
//     return [
//       Product(
//           id: 1,
//           name: 'Product 1',
//           price: 100,
//           image: 'https://dummyjson.com/image/600x300/282828'),
//       Product(
//           id: 2,
//           name: 'Product 2',
//           price: 200,
//           image: 'https://dummyjson.com/image/400x200/282828'),
//     ];
//   }

//   Future<Product> fetchProductDetails(int productId) async {
//     await Future.delayed(const Duration(milliseconds: 100));
//     return Product(
//         id: productId,
//         name: 'Product $productId',
//         price: 100 + productId * 100,
//         description: 'This is a detailed description of product $productId.',
//         image: 'https://dummyjson.com/image/400x200/282828');
//   }

//    Future<Product> getProductById(int id) async {
//     // Fetch product details from your data source using the product ID.
//     // This is a placeholder implementation.
//     return Product(
//       id: id,
//       name: 'Product $id',
//       price: 10.0,
//       image: 'image_url',
//       description: 'Description for product $id',
//     );
//   }
// }

import 'package:product_app/core/utils/product_service.dart';

import '../../../core/models/product_model.dart';

class ProductRepository {
  final ProductService productService;

  ProductRepository({required this.productService});

  Future<List<Product>> fetchProducts() async {
    return productService.fetchProducts();
  }

  Future<Product> fetchProductDetails(int productId) async {
    final List<Product> products = await fetchProducts();
    return products.firstWhere((product) => product.id == productId);
  }

  Future<Product> getProductById(int id) async {
    final List<Product> products = await fetchProducts();
    return products.firstWhere((product) => product.id == id);
  }
}