import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class PhotosList extends StatelessWidget {
  final List<String> photos;
  final int selectedImageIndex;
  final ValueChanged<int> onImageChanged;

  const PhotosList({
    super.key,
    required this.photos,
    required this.selectedImageIndex,
    required this.onImageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isFromTestEnvironment = AppEnvironment.isTestEnvironment;

    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: .horizontal,
        itemCount: photos.length,
        physics: const ClampingScrollPhysics(),
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isImageSelected = index == selectedImageIndex;
          final productPhotosUrl = photos[index];

          return GestureDetector(
            onTap: () => onImageChanged(index),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isImageSelected
                      ? context.currentTheme.bgBrandDefault
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
                        fit: .cover,
                      )
                    : CachedNetworkImage(
                        imageUrl: productPhotosUrl,
                        fit: .cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: context.currentTheme.bgNeutralLight100,
                          highlightColor: context.currentTheme.bgNeutralLight100
                              .withOpacity(0.6),
                          child: ColoredBox(
                            color: context.currentTheme.bgNeutralLight100,
                          ),
                        ),
                        errorWidget: (context, url, error) => ColoredBox(
                          color: context.currentTheme.bgNeutralLight100,
                          child: const Icon(
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
