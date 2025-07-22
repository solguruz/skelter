import 'package:flutter/cupertino.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class ShimmerText extends StatelessWidget {
  const ShimmerText({super.key, required this.width, this.radius = 4});

  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(radius),
          right: Radius.circular(radius),
        ),
      ),
    );
  }
}
