import 'package:flutter/material.dart';
import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppButtonIcon extends StatelessWidget {
  final String? iconPath;
  final IconData? iconData;
  final Color color;
  final double size;

  const AppButtonIcon({
    super.key,
    this.iconPath,
    this.iconData,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (iconPath != null) {
      if (iconPath!.endsWith(kSVGExtension)) {
        return SvgPicture.asset(
          iconPath!,
          height: size,
          width: size,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      }
      if (iconPath!.endsWith(kPNGExtension)) {
        return Image.asset(
          iconPath!,
          height: size,
          width: size,
        );
      }
    }

    if (iconData != null) {
      return Icon(
        iconData,
        size: size * 0.9,
        color: color,
      );
    }

    return const SizedBox.shrink();
  }
}
