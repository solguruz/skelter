import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/contact_us.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/divider.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/feedback_and_rating.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/help_and_support.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

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
