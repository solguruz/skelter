import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class NotificationErrorWidget extends StatelessWidget {
  const NotificationErrorWidget({super.key, required this.msg});

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(TablerIcons.info_circle, size: 50),
          const SizedBox(
            height: 20,
          ),
          Text(
            msg.isEmpty ? context.localization.opps_something_went_wrong : msg,
            style: AppTextStyles.p2Medium.withColor(AppColors.errorColor),
          ),
        ],
      ),
    );
  }
}
