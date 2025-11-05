import 'package:flutter/cupertino.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

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
        color: context.currentTheme.bgShadesWhite,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(radius),
          right: Radius.circular(radius),
        ),
      ),
    );
  }
}
