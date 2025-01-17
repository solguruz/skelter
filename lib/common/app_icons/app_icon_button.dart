import 'package:flutter_skeleton/common/app_icons/app_icon.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
    this.icon, {
    super.key,
    this.onPressed,
    this.size,
    this.radius,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.color,
  });
  final String icon;
  final double? radius;
  final VoidCallback? onPressed;
  final double? size;
  final BoxFit fit;
  final Alignment alignment;
  final Color? color;

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
    return InkWell(
      onTap: onPressed,
      child: AppIcon(
        icon,
        size: size,
        color: iconColor,
        alignment: alignment,
      ),
    );
  }
}
