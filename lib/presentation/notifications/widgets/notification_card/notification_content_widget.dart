import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/notifications/model/notification_model.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:timeago/timeago.dart' as time_ago;

class NotificationContentWidget extends StatelessWidget {
  const NotificationContentWidget({super.key, required this.notificationModel});

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notificationModel.title,
            style: AppTextStyles.p2Medium.withColor(AppColors.neutral700),
          ),
          const SizedBox(height: 4.0),
          Text(
            notificationModel.message,
            style: AppTextStyles.p3Regular.withColor(
              AppColors.textNeutralSecondary,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            time_ago.format(
              notificationModel.insertedOn,
              locale: context.localization.localeName,
            ),
            style: AppTextStyles.p4Regular.withColor(
              AppColors.textNeutralSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
