import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/notifications/model/notification_model.dart';
import 'package:flutter_skeleton/presentation/notifications/widgets/notification_card/notification_content_widget.dart';
import 'package:flutter_skeleton/presentation/notifications/widgets/notification_card/notification_dismissible_widget.dart';
import 'package:flutter_skeleton/presentation/notifications/widgets/notification_card/notification_leading_icon_widget.dart';
import 'package:flutter_skeleton/presentation/notifications/widgets/notification_card/notification_leading_image_widget.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notificationModel});

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return NotificationDismissibleWidget(
      notificationModel: notificationModel,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (notificationModel.notificationType == NotificationType.image)
              NotificationLeadingImageWidget(
                notificationModel: notificationModel,
              )
            else
              NotificationLeadingIconWidget(
                notificationModel: notificationModel,
              ),
            const SizedBox(width: 12.0),
            NotificationContentWidget(notificationModel: notificationModel),
          ],
        ),
      ),
    );
  }
}
