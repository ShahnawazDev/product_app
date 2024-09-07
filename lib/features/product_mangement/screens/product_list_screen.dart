import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/features/product_mangement/blocs/product_list_bloc/product_list_bloc.dart';
import 'package:product_app/features/product_mangement/widgets/cart_icon.dart';
import 'package:product_app/features/product_mangement/widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Product List'),
          actions: const [CartIcon()],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      context.read<ProductListBloc>().add(
                            SearchProductList(query: _searchController.text),
                          );
                    },
                  ),
                ),
                onSubmitted: (query) {
                  context.read<ProductListBloc>().add(
                        SearchProductList(query: query),
                      );
                },
              ),
            ),
          )),
      body: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          if (state is ProductListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductListLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              physics: const BouncingScrollPhysics(),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductCard(product: product);
              },
            );
          } else if (state is ProductListError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
