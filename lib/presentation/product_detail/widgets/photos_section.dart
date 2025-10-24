import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_event.dart';
import 'package:skelter/presentation/product_detail/model/product_detail_model.dart';
import 'package:skelter/presentation/product_detail/widgets/photos_list.dart';
import 'package:skelter/presentation/product_detail/widgets/photos_title.dart';

class PhotosSection extends StatelessWidget {
  final ProductDetailModel productDetail;

  const PhotosSection({
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
          const PhotosTitle(),
          const SizedBox(height: 10),
          PhotosList(
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
