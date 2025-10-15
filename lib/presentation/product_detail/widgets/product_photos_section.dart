import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_event.dart';
import 'package:skelter/presentation/product_detail/model/product_detail_model.dart';
import 'package:skelter/presentation/product_detail/widgets/product_photos_list.dart';
import 'package:skelter/presentation/product_detail/widgets/product_photos_title.dart';

class ProductPhotosSection extends StatelessWidget {
  final ProductDetailModel productDetail;

  const ProductPhotosSection({
    super.key,
    required this.productDetail,
  });

  @override
  Widget build(BuildContext context) {
    final int selectedImageIndex = context.select<ProductDetailBloc, int>(
      (bloc) => bloc.state.selectedImageIndex,
    );
    final photos = [
      productDetail.mainImage,
      ...productDetail.additionalImages,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProductPhotosTitle(),
          const SizedBox(height: 10),
          ProductPhotosList(
            photos: photos,
            selectedImageIndex: selectedImageIndex,
            onImageChanged: (index) {
              context.read<ProductDetailBloc>().add(
                    ProductImageSelectedEvent(
                      selectedIndex: index,
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }
}
