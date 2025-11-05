import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/presentation/notifications/bloc/notification_bloc.dart';
import 'package:skelter/presentation/notifications/bloc/notification_event.dart';
import 'package:skelter/presentation/notifications/model/notification_model.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

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
      background: ColoredBox(
        color: context.currentTheme.bgErrorDefault,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: context.currentTheme.strokeShadesWhite,
            ),
            const SizedBox(
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
