import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';

class CheckoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CheckoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(context.l10n.cart_and_checkout),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
