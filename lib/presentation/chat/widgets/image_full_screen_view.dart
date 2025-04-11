import 'package:flutter/material.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:image_viewer_pro/image_viewer_pro.dart';

class ImageFullScreenView extends StatelessWidget {
  const ImageFullScreenView({
    super.key,
    required this.imagePathLists,
  });

  final List<String> imagePathLists;

  @override
  Widget build(BuildContext context) {
    return ImageViewerPro(
      images: imagePathLists,
      showIndicator: false,
      customCloseButton: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              const BoxShadow(
                color: AppColors.neutral400,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: const Icon(TablerIcons.x),
        ),
      ),
    );
  }
}
