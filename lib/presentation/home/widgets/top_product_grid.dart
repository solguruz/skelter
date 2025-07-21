import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/model/product_model.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_skeleton/presentation/home/widgets/product_card.dart';

class TopProductGrid extends StatelessWidget {
  const TopProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productsList = context.select<HomeBloc, List<ProductModel>>(
      (bloc) => bloc.state.topProducts,
    );

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 6, bottom: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.70,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: productsList.take(6).length,
      itemBuilder: (context, index) {
        final product = productsList[index];
        return ProductCard(product: product);
      },
    );
  }
}
