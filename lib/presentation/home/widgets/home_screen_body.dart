import 'package:flutter/material.dart';
import 'package:skelter/presentation/home/widgets/home_app_bar.dart';
import 'package:skelter/presentation/home/widgets/product_search_bar.dart';
import 'package:skelter/presentation/home/widgets/products_headline_bar.dart';
import 'package:skelter/presentation/home/widgets/top_product_grid.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            HomeAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  ProductSearchBar(),
                  ProductsHeadlineBar(),
                  TopProductGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
