import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/community.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/divider.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/history_button.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/notifications.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class ActivitySection extends StatelessWidget {
  const ActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.localization.activity, style: AppTextStyles.h6SemiBold),
        const SizedBox(height: 12.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.strokeNeutralLight200),
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
