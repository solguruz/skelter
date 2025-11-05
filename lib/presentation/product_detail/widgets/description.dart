import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class Description extends StatelessWidget {
  final String description;

  const Description({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description.trim(),
      style: AppTextStyles.p3Medium.copyWith(
        color: context.currentTheme.textNeutralPrimary,
      ),
    );
  }
}
