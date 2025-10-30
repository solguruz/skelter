import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/signup/screens/signup_with_email/widgets/password_requirement_indicators.dart';
import 'package:skelter/presentation/signup/screens/signup_with_email/widgets/password_strength_indicator.dart';
import 'package:skelter/presentation/signup/screens/signup_with_email/widgets/password_strength_status.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class PasswordRequirementStats extends StatelessWidget {
  const PasswordRequirementStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.bgNeutralLight50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localization.password_requirements,
            style: AppTextStyles.p4Bold.copyWith(
              color: AppColors.textNeutralPrimary,
            ),
          ),
          const SizedBox(height: 5),
          const PasswordRequirementIndicators(),
          const SizedBox(height: 10),
          const PasswordStrengthProgressIndicator(),
          const SizedBox(height: 5),
          const PasswordStrengthStatus(),
        ],
      ),
    );
  }
}
