import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/signup_with_email/widgets/password_requirement_indicators.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/signup_with_email/widgets/password_strength_indicator.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/signup_with_email/widgets/password_strength_status.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

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
            context.localization.login_signup_password_requirements,
            style: AppTextStyles.p4Bold.withColor(
              AppColors.textNeutralPrimary,
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
