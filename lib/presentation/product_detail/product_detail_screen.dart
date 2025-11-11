import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_event.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_state.dart';
import 'package:skelter/presentation/product_detail/domain/entities/product_detail.dart';
import 'package:skelter/presentation/product_detail/widgets/add_to_cart_button.dart';
import 'package:skelter/presentation/product_detail/widgets/description.dart';
import 'package:skelter/presentation/product_detail/widgets/info_headline_bar.dart';
import 'package:skelter/presentation/product_detail/widgets/mark_favorite_button.dart';
import 'package:skelter/presentation/product_detail/widgets/no_product_detail_found.dart';
import 'package:skelter/presentation/product_detail/widgets/photos_section.dart';
import 'package:skelter/presentation/product_detail/widgets/price.dart';
import 'package:skelter/presentation/product_detail/widgets/product_detail_app_bar.dart';
import 'package:skelter/presentation/product_detail/widgets/product_detail_shimmer.dart';
import 'package:skelter/presentation/product_detail/widgets/reviews_button.dart';
import 'package:skelter/presentation/product_detail/widgets/selected_product_image.dart';
import 'package:skelter/presentation/product_detail/widgets/title_and_rating.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

@RoutePage()
class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailBloc>(
      create: (_) => ProductDetailBloc(getProductDetail: sl())
        ..add(
          GetProductDetailDataEvent(productId: productId),
        ),
      child: BlocListener<ProductDetailBloc, ProductDetailState>(
        listener: _listenStateChanged,
        child: const ProductDetailBody(),
      ),
    );
  }

  void _listenStateChanged(BuildContext context, ProductDetailState state) {
    if (state is ProductDetailErrorState) {
      context.showSnackBar(
        state.errorMessage ?? context.localization.opps_something_went_wrong,
      );
    }
  }
}

class ProductDetailBody extends StatelessWidget {
  const ProductDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isProductDetailLoading = context.select<ProductDetailBloc, bool>(
      (bloc) => bloc.state is ProductDetailLoading,
    );

    final productDetail = context.select<ProductDetailBloc, ProductDetail?>(
      (bloc) => bloc.state.productDetail,
    );

    if (isProductDetailLoading) {
      return const Scaffold(
        body: SafeArea(child: Center(child: ProductDetailShimmer())),
      );
    }

    if (productDetail == null) {
      return const NoProductDetailFound();
    }

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
