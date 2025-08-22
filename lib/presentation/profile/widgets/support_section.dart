import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/profile/widgets/contact_us.dart';
import 'package:skelter/presentation/profile/widgets/divider.dart';
import 'package:skelter/presentation/profile/widgets/feedback_and_rating.dart';
import 'package:skelter/presentation/profile/widgets/help_and_support.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.localization.support, style: AppTextStyles.h6SemiBold),
        const SizedBox(height: 12.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.strokeNeutralLight200),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Column(
            children: [
              FeedbackAndRating(),
              ProfileItemsDivider(),
              HelpAndSupport(),
              ProfileItemsDivider(),
              ContactUs(),
            ],
          ),
        ),
      ],
    );
  }
}
