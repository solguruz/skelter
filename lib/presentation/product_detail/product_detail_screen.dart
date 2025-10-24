import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_bloc.dart';
import 'package:skelter/presentation/product_detail/data/product_detail_sample_data.dart';
import 'package:skelter/presentation/product_detail/widgets/add_to_cart_button.dart';
import 'package:skelter/presentation/product_detail/widgets/description.dart';
import 'package:skelter/presentation/product_detail/widgets/info_headline_bar.dart';
import 'package:skelter/presentation/product_detail/widgets/mark_favorite_button.dart';
import 'package:skelter/presentation/product_detail/widgets/photos_section.dart';
import 'package:skelter/presentation/product_detail/widgets/price.dart';
import 'package:skelter/presentation/product_detail/widgets/product_detail_app_bar.dart';
import 'package:skelter/presentation/product_detail/widgets/reviews_button.dart';
import 'package:skelter/presentation/product_detail/widgets/selected_product_image.dart';
import 'package:skelter/presentation/product_detail/widgets/title_and_rating.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

@RoutePage()
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailBloc>(
      create: (_) => ProductDetailBloc(),
      child: const ProductDetailBody(),
    );
  }
}

class ProductDetailBody extends StatelessWidget {
  const ProductDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    final productDetail = generateSampleProductDetail();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ProductDetailAppBar(category: productDetail.category),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 59,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.white.withOpacity(0.0),
                    AppColors.white.withOpacity(0.78),
                    AppColors.white,
                  ],
                  stops: const [0.0, 0.4, 1.0],
                ),
              ),
            ),
            const ReviewsButton(),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const InfoHeadlineBar(),
                    SelectedProductImage(
                      productDetail: productDetail,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleAndRating(
                            title: productDetail.title,
                            rating: productDetail.rating,
                          ),
                          const SizedBox(height: 8),
                          Price(price: productDetail.price),
                          const SizedBox(height: 25),
                          const Row(
                            children: [
                              AddToCartButton(),
                              SizedBox(width: 16),
                              MarkFavoriteButton(),
                            ],
                          ),
                          PhotosSection(
                            productDetail: productDetail,
                          ),
                          Description(
                            description: productDetail.description,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
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
