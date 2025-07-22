import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/checkout/model/product_model.dart';
import 'package:flutter_skeleton/presentation/home/widgets/product_category_chip.dart';
import 'package:flutter_skeleton/presentation/home/widgets/product_image.dart';
import 'package:flutter_skeleton/presentation/home/widgets/product_price_rating.dart';
import 'package:flutter_skeleton/presentation/home/widgets/product_title.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.showSnackBar('Show product details'),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            const BoxShadow(
              color: AppColors.shadowColor3,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(imageUrl: product.image),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductCategoryChip(category: product.category),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductTitle(title: product.title),
                          const SizedBox(height: 18),
                          ProductPriceRating(product: product),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
