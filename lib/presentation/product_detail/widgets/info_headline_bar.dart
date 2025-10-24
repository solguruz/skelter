import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';

class InfoHeadlineBar extends StatelessWidget {
  const InfoHeadlineBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        context.localization.product_information,
        style: AppTextStyles.p2SemiBold,
      ),
    );
  }
}
