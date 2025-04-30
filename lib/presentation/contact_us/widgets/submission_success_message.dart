import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/core/app_sizes.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class SubmissionSuccessMessage extends StatelessWidget {
  const SubmissionSuccessMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.l10n.alright,
          style: AppTextStyles.h4SemiBold,
        ),
        const SizedBox(height: AppSize.S),
        Text(
          context.l10n.response_received,
          style:
              AppTextStyles.p2Regular.withColor(AppColors.textNeutralSecondary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
