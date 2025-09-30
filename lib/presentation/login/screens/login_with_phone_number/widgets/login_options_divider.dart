import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/screens/login_with_phone_number/login_with_phone_number_screen.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class LoginOptionsDivider extends StatelessWidget {
  const LoginOptionsDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LoginWithPhoneNumberScreen.kHorizontalPadding,
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
            context.localization.or,
            style: AppTextStyles.p2Regular.copyWith(
              color: AppColors.textNeutralDisable,
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
