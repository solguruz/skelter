import 'package:flutter/material.dart';
import 'package:skelter/presentation/product_detail/model/product_detail_model.dart';
import 'package:skelter/presentation/product_detail/widgets/product_photos_list.dart';
import 'package:skelter/presentation/product_detail/widgets/product_photos_title.dart';

class ProductPhotosSection extends StatelessWidget {
  final ProductDetailModel productDetail;
  final int selectedImageIndex;
  final ValueChanged<int> onImageChanged;

  const ProductPhotosSection({
    super.key,
    required this.productDetail,
    required this.selectedImageIndex,
    required this.onImageChanged,
  });

  @override
  Widget build(BuildContext context) {
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
            onImageChanged: onImageChanged,
          ),
        ],
      ),
    );
  }
}
