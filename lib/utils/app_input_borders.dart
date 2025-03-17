import 'package:flutter/material.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class AppInputBorders {
  static final OutlineInputBorder enabled = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.strokeNeutralLight200),
    borderRadius: BorderRadius.circular(8),
  );

  static final OutlineInputBorder focused = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.strokeBrandHover),
    borderRadius: BorderRadius.circular(8),
  );

  static final OutlineInputBorder error = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.strokeErrorDefault),
    borderRadius: BorderRadius.circular(8),
  );
}
