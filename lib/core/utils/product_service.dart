import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:product_app/core/models/product_model.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final String response = await rootBundle.loadString('assets/mock_data/products.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Product.fromJson(json)).toList();
  }
}