import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class AddressAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddressAppBar({super.key, this.isAddingAddress = true});

  final bool isAddingAddress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppButton.icon(
        iconData: TablerIcons.arrow_left,
        size: AppButtonSize.xl,
        onPressed: () {
          context.router.maybePop();
        },
      ),
      title: Text(
        isAddingAddress
            ? context.l10n.add_new_address
            : context.l10n.select_address,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
