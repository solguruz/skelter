import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/notifications/bloc/notification_bloc.dart';
import 'package:flutter_skeleton/presentation/notifications/bloc/notification_event.dart';
import 'package:flutter_skeleton/presentation/notifications/model/notification_model.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class NotificationDismissibleWidget extends StatelessWidget {
  const NotificationDismissibleWidget({
    super.key,
    required this.child,
    required this.notificationModel,
  });

  final Widget child;
  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(notificationModel.id),
      background: const ColoredBox(
        color: AppColors.bgErrorDefault,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: AppColors.white,
            ),
            SizedBox(
              width: 16.0,
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        context.read<NotificationBloc>().add(
              DeleteNotificationEvent(notificationId: notificationModel.id),
            );
      },
      child: child,
    );
  }
}
