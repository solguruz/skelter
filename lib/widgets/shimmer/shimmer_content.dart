import 'package:flutter/material.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ShimmerContent extends StatelessWidget {
  const ShimmerContent({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.radius = 0.0,
    this.border,
    this.child,
  });

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double radius;
  final BoxBorder? border;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(radius),
        border: border,
      ),
      child: child,
    );
  }
}
