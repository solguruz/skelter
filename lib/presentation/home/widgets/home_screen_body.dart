import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/home/widgets/home_app_bar.dart';
import 'package:flutter_skeleton/presentation/home/widgets/product_search_bar.dart';
import 'package:flutter_skeleton/presentation/home/widgets/products_headline_bar.dart';
import 'package:flutter_skeleton/presentation/home/widgets/top_product_grid.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
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
    );
  }
}
