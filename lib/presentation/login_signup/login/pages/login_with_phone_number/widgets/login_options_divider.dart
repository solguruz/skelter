import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/login_page.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter/material.dart';

class LoginOptionsDivider extends StatelessWidget {
  const LoginOptionsDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LoginPage.kHorizontalPadding,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 1,
              color: AppColors.strokeNeutralLight100,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            context.l10n.login_signup_or,
            style: AppTextStyles.p2Regular.withColor(
              AppColors.textNeutralDisable,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 1,
              color: AppColors.strokeNeutralLight100,
            ),
          ),
        ],
      ),
    );
  }
}
