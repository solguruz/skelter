import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/notifications/bloc/notification_bloc.dart';
import 'package:flutter_skeleton/presentation/notifications/bloc/notification_event.dart';
import 'package:flutter_skeleton/presentation/notifications/model/notification_model.dart';
import 'package:flutter_skeleton/presentation/notifications/widgets/notification_card.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationList =
        context.select<NotificationBloc, List<NotificationModel>>((value) {
      return value.state.notificationList;
    });

    return RefreshIndicator(
      onRefresh: () async {
        context.read<NotificationBloc>().add(GetNotificationDataEvent());
      },
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          color: AppColors.strokeNeutralLight200,
        ),
        itemCount: notificationList.length,
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        itemBuilder: (context, index) {
          final notificationModel = notificationList[index];
          return NotificationCard(notificationModel: notificationModel);
        },
      ),
    );
  }
}
