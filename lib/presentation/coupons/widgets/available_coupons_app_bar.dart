import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ApplyCouponsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ApplyCouponsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppButton.icon(
        iconData: TablerIcons.arrow_left,
        size: AppButtonSize.extraLarge,
        onPressed: () {
          context.maybePop();
        },
      ),
      title: Text(context.localization.available_coupons),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
