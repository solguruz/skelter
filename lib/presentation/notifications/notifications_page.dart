import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/notifications/widgets/empty_notifications_view.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: EmptyNotificationsView(),
    );
  }
}
