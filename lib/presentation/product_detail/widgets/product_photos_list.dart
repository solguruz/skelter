import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ProductPhotosList extends StatefulWidget {
  final List<String> photos;
  final int selectedImageIndex;
  final ValueChanged<int> onImageChanged;

  const ProductPhotosList({
    super.key,
    required this.photos,
    required this.selectedImageIndex,
    required this.onImageChanged,
  });

  @override
  State<ProductPhotosList> createState() => _ProductPhotosListState();
}

class _ProductPhotosListState extends State<ProductPhotosList> {
  late final ScrollController _scrollController;
  Timer? _autoScrollTimer;
  final double _itemWidth = 100;
  final double _itemSpacing = 10;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!mounted) return;
      final totalItems = widget.photos.length;
      final nextIndex = (widget.selectedImageIndex + 1) % totalItems;
      widget.onImageChanged(nextIndex);
      _scrollController.animateTo(
        nextIndex * (_itemWidth + _itemSpacing),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFromTestEnvironment = AppEnvironment.isTestEnvironment;

    return SizedBox(
      height: 100,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.photos.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isImageSelected = index == widget.selectedImageIndex;
          final productPhotosUrl = widget.photos[index];

          return GestureDetector(
            onTap: () => widget.onImageChanged(index),
            child: Container(
              width: _itemWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isImageSelected
                      ? AppColors.bgBrandDefault
                      : AppColors.transparent,
                  width: isImageSelected ? 2 : 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: isFromTestEnvironment
                    ? Image.asset(
                        Assets.test.images.testImage.path,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl: productPhotosUrl,
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
          );
        },
      ),
    );
  }
}
