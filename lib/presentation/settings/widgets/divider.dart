import 'package:flutter/material.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class SettingsSectionDivider extends StatelessWidget {
  const SettingsSectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: AppColors.currentTheme.strokeNeutralLight100,
      indent: 8.0,
      endIndent: 8.0,
    );
  }
}
