import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class UnderMaintenanceScreen extends StatelessWidget {
  const UnderMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icons.appUnderMaintenance,
              height: 194,
              width: 209,
            ),
            const SizedBox(height: 24),
            Text(
              context.localization.under_maintenance,
              style: AppTextStyles.p1SemiBold,
            ),
            const SizedBox(height: 8),
            Text(
              context.localization.under_maintenance_message,
              style: AppTextStyles.p3Regular,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
