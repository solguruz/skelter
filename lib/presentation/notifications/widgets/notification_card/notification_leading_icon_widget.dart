import 'package:flutter/material.dart';
import 'package:flutter_skeleton/core/app_sizes.dart';
import 'package:flutter_skeleton/presentation/notifications/model/notification_model.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class NotificationLeadingIconWidget extends StatelessWidget {
  const NotificationLeadingIconWidget({
    super.key,
    required this.notificationModel,
  });
  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: AppSize.L,
          backgroundColor: notificationModel.notificationType.getBgColor,
          foregroundColor: AppColors.white,
          child: notificationModel.notificationType.getIcon,
        ),
        if (!notificationModel.isSeen) ...[
          const SizedBox(
            height: AppSize.S,
          ),
          Container(
            height: AppSize.S,
            width: AppSize.S,
            decoration: const BoxDecoration(
              color: AppColors.brand500,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ],
    );
  }
}
