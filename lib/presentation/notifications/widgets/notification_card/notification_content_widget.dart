import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/notifications/model/notification_model.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
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
            style: AppTextStyles.p2Medium
                .copyWith(color: context.currentTheme.textNeutralPrimary),
          ),
          const SizedBox(height: 4.0),
          Text(
            notificationModel.message,
            style: AppTextStyles.p3Regular.copyWith(
              color: context.currentTheme.textNeutralSecondary,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            time_ago.format(
              notificationModel.insertedOn,
              locale: context.localization.localeName,
            ),
            style: AppTextStyles.p4Regular.copyWith(
              color: context.currentTheme.textNeutralSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
