import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/notifications/bloc/notification_bloc.dart';
import 'package:flutter_skeleton/presentation/notifications/bloc/notification_event.dart';
import 'package:flutter_skeleton/presentation/notifications/bloc/notification_state.dart';
import 'package:flutter_skeleton/presentation/notifications/model/notification_model.dart';
import 'package:flutter_skeleton/presentation/notifications/widgets/empty_notifications_view.dart';
import 'package:flutter_skeleton/presentation/notifications/widgets/notification_app_bar.dart';
import 'package:flutter_skeleton/presentation/notifications/widgets/notification_list.dart';
import 'package:flutter_skeleton/presentation/notifications/widgets/notification_loading_shimmer_list.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc()..add(GetNotificationDataEvent()),
      child: const Scaffold(
        appBar: NotificationAppBar(),
        body: NotificationScreenBody(),
      ),
    );
  }
}

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select<NotificationBloc, bool>((bloc) => bloc.state.isLoading);

    final notificationList =
        context.select<NotificationBloc, List<NotificationModel>>(
      (NotificationBloc bloc) => bloc.state.notificationList,
    );

    return Builder(
      builder: (context) {
        return BlocListener<NotificationBloc, NotificationState>(
          listener: (context, state) {
            if (state is NotificationDeletedState) {
              context.showSnackBar(
                context.localization.notifications_delete_successfully,
              );
            } else if (state is NotificationErrorState) {
              context.showSnackBar(state.message);
            }
          },
          child: isLoading
              ? const NotificationLoadigShimmerList()
              : notificationList.isNotEmpty
                  ? const NotificationList()
                  : const EmptyNotificationsView(),
        );
      },
    );
  }
}
