import 'package:flutter/material.dart';
import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_svg/svg.dart';

/// Requires [AppIcons]
class AppIcon extends StatelessWidget {
  const AppIcon({
    this.iconPath,
    this.iconData,
    super.key,
    this.size,
    this.alignment = Alignment.center,
    this.color,
    this.shouldIgnoreColorFilter = false,
  }) : assert(
          (iconPath != null || iconData != null),
          'iconPath or iconData should not be null',
        );

  final String? iconPath;

  /// use the values from [TablerIcons]
  final IconData? iconData;
  final double? size;
  final Alignment alignment;
  final Color? color;
  final bool shouldIgnoreColorFilter;

  @override
  Widget build(BuildContext context) {
    Color iconColor;
    if (color == null) {
      iconColor = Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black;
    } else {
      iconColor = color!;
    }
    if (iconPath != null && (iconPath ?? '').endsWith(kSVGExtension)) {
      return SvgPicture.asset(
        iconPath ?? '',
        height: size,
        width: size,
        colorFilter: shouldIgnoreColorFilter
            ? null
            : ColorFilter.mode(iconColor, BlendMode.srcIn),
        alignment: alignment,
      );
    } else if ((iconPath ?? '').endsWith(kPNGExtension)) {
      return Image.asset(
        iconPath ?? '',
        height: size,
        width: size,
        alignment: alignment,
      );
    } else if (iconData != null) {
      return Icon(
        iconData,
        size: size,
        color: iconColor,
      );
    } else {
      debugPrint('Unknown format of image: $iconPath');
      return const SizedBox.shrink();
    }
  }
}
