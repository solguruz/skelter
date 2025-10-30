import 'package:flutter/material.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ShimmerButton extends StatelessWidget {
  const ShimmerButton({
    super.key,
    this.width,
    this.height,
    this.radius = 0,
    this.margin,
    this.padding,
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

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
      ),
    );
  }
}
