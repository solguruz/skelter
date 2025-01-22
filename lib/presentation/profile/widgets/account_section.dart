import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/core/app_sizes.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/personal_details.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.account, style: AppTextStyles.h6SemiBold),
        const SizedBox(height: AppSize.M),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.strokeNeutralLight200),
            borderRadius: BorderRadius.circular(AppRadius.M),
          ),
          child: const Column(
            children: [
              PersonalDetails(),
            ],
          ),
        ),
      ],
    );
  }
}
