import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.l10n.notifications),
    );
  }
}
