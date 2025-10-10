import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_event.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_state.dart';
import 'package:skelter/presentation/product_detail/data/product_detail_sample_data.dart';
import 'package:skelter/presentation/product_detail/widgets/product_add_to_cart_button.dart';
import 'package:skelter/presentation/product_detail/widgets/product_description.dart';
import 'package:skelter/presentation/product_detail/widgets/product_detail_app_bar.dart';
import 'package:skelter/presentation/product_detail/widgets/product_info_headline_bar.dart';
import 'package:skelter/presentation/product_detail/widgets/product_mark_favorite_button.dart';
import 'package:skelter/presentation/product_detail/widgets/product_photos_section.dart';
import 'package:skelter/presentation/product_detail/widgets/product_price.dart';
import 'package:skelter/presentation/product_detail/widgets/product_primary_image_section.dart';
import 'package:skelter/presentation/product_detail/widgets/product_reviews_button.dart';
import 'package:skelter/presentation/product_detail/widgets/product_title_rating.dart';
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

    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: ProductDetailAppBar(category: productDetail.category),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
                const ProductReviewsButton(),
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
                        const ProductInfoHeadlineBar(),
                        ProductPrimaryImageSection(
                          mainImage: productDetail.mainImage,
                          additionalImages: productDetail.additionalImages,
                          selectedImageIndex: state.selectedImageIndex,
                          onImageChanged: (index) {
                            context
                                .read<ProductDetailBloc>()
                                .add(ProductImageSelectedEvent(index));
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProductTitleRating(
                                title: productDetail.title,
                                rating: productDetail.rating,
                              ),
                              const SizedBox(height: 8),
                              ProductPrice(price: productDetail.price),
                              const SizedBox(height: 25),
                              const Row(
                                children: [
                                  ProductAddToCartButton(),
                                  SizedBox(width: 16),
                                  ProductMarkFavoriteButton(),
                                ],
                              ),
                              ProductPhotosSection(
                                productDetail: productDetail,
                                selectedImageIndex: state.selectedImageIndex,
                                onImageChanged: (index) {
                                  context
                                      .read<ProductDetailBloc>()
                                      .add(ProductImageSelectedEvent(index));
                                },
                              ),
                              ProductDescription(
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
      },
    );
  }
}
