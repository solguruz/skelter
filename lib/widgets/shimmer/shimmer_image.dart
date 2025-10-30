import 'package:flutter/material.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ShimmerImage extends StatelessWidget {
  const ShimmerImage({
    super.key,
    this.width,
    this.height,
    this.radius = 0.0,
    this.margin,
    this.fit = BoxFit.cover,
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? margin;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
