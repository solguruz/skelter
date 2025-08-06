import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_skeleton/presentation/home/domain/entities/product.dart';
import 'package:flutter_skeleton/presentation/home/widgets/empty_search_view.dart';
import 'package:flutter_skeleton/presentation/home/widgets/product_card.dart';

class TopProductGrid extends StatelessWidget {
  const TopProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productsList = context.select<HomeBloc, List<Product>>(
      (bloc) => bloc.state.topProducts,
    );

    final filteredProductsList = context.select<HomeBloc, List<Product>>(
      (bloc) => bloc.state.filteredProducts,
    );

    final searchQuery = context.select<HomeBloc, String>(
      (bloc) => bloc.state.searchQuery,
    );

    final products = searchQuery.isEmpty ? productsList : filteredProductsList;

    return searchQuery.isNotEmpty && products.isEmpty
        ? const EmptySearchView()
        : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 6, bottom: 16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 191,
              mainAxisExtent: 271,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: products.take(6).length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(product: product);
            },
          );
  }
}
