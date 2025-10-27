import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_event.dart';
import 'package:skelter/presentation/product_detail/domain/entities/product_detail.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class SelectedProductImage extends StatelessWidget {
  final ProductDetail productDetail;

  const SelectedProductImage({
    super.key,
    required this.productDetail,
  });

  @override
  Widget build(BuildContext context) {
    final int selectedImageIndex = context.select<ProductDetailBloc, int>(
      (bloc) => bloc.state.selectedImageIndex,
    );
    final allImages = [
      productDetail.image,
      ...productDetail.productImages,
    ];
    final imageUrl = allImages[selectedImageIndex];
    final isFromTestEnvironment = AppEnvironment.isTestEnvironment;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            context.read<ProductDetailBloc>().add(
                  ProductImageSelectedEvent(
                    selectedIndex: selectedImageIndex,
                  ),
                );
          },
          child: Container(
            height: 300,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: isFromTestEnvironment
                ? Image.asset(
                    Assets.test.images.testImage.path,
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: AppColors.bgNeutralLight100,
                      highlightColor:
                          AppColors.bgNeutralLight100.withOpacity(0.6),
                      child: const ColoredBox(
                        color: AppColors.bgNeutralLight100,
                      ),
                    ),
                    errorWidget: (context, url, error) => const ColoredBox(
                      color: AppColors.bgNeutralLight100,
                      child: Icon(
                        Icons.error_outline,
                        color: AppColors.redError500,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
