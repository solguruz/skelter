import 'package:flutter/cupertino.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:sizer/sizer.dart';

class ShimmerCircularImage extends StatelessWidget {
  const ShimmerCircularImage({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular((size / 2).w),
      child: Container(
        height: size.w,
        width: size.w,
        color: AppColors.white,
      ),
    );
  }
}
