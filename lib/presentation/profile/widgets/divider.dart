import 'package:flutter/material.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ProfileItemsDivider extends StatelessWidget {
  const ProfileItemsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 8.0,
      endIndent: 8.0,
      color: AppColors.currentTheme.strokeNeutralLight100,
      height: 1,
    );
  }
}
