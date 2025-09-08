import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class SubmissionSuccessMessage extends StatelessWidget {
  const SubmissionSuccessMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.localization.alright,
          style: AppTextStyles.h4SemiBold,
        ),
        const SizedBox(height: 8.0),
        Text(
          context.localization.response_received,
          style: AppTextStyles.p2Regular
              .copyWith(color: AppColors.textNeutralSecondary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
