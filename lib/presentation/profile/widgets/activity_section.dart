import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/profile/widgets/community.dart';
import 'package:skelter/presentation/profile/widgets/divider.dart';
import 'package:skelter/presentation/profile/widgets/history_button.dart';
import 'package:skelter/presentation/profile/widgets/notifications.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class ActivitySection extends StatelessWidget {
  const ActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.activity,
          style: AppTextStyles.h6SemiBold.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 12.0),
        Container(
          decoration: BoxDecoration(
            border:
                Border.all(color: context.currentTheme.strokeNeutralLight200),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Column(
            children: [
              Notifications(),
              ProfileItemsDivider(),
              History(),
              ProfileItemsDivider(),
              Community(),
            ],
          ),
        ),
      ],
    );
  }
}
