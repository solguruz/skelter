import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

/// Full-screen, swipeable and zoomable image gallery.
///
/// Each entry in [imagePathLists] is either a network URL (`http`/`https`)
/// or an asset path.
class ImageFullScreenView extends StatelessWidget {
  const ImageFullScreenView({super.key, required this.imagePathLists});

  final List<String> imagePathLists;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: imagePathLists.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InteractiveViewer(
                maxScale: 4,
                child: Center(
                  child: Image(
                    image: _imageProvider(imagePathLists[index]),
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 50, right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: context.currentTheme.bgSurfaceBase2,
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
            ),
          ),
        ],
      ),
    );
  }

  ImageProvider _imageProvider(String path) {
    return path.startsWith('http')
        ? NetworkImage(path)
        : AssetImage(path) as ImageProvider;
  }
}
