import 'package:flutter/material.dart';
import 'package:skelter/presentation/notifications/widgets/notification_shimmer_card.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class NotificationLoadigShimmerList extends StatelessWidget {
  const NotificationLoadigShimmerList({super.key, this.showAnimation = true});

  final bool showAnimation;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 7,
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      separatorBuilder: (context, index) => Divider(
        color: context.currentTheme.strokeNeutralLight200,
      ),
      itemBuilder: (context, index) {
        return NotificationShimmerCard(
          showAnimation: showAnimation,
        );
      },
    );
  }
}
