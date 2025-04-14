import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_events.dart';
import 'package:flutter_skeleton/presentation/checkout/initial_checkout_page.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CheckoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CheckoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentStepperIndex = context.select<CheckoutBloc, int>(
      (bloc) => bloc.state.stepperIndex,
    );
    final bool canGoBack = currentStepperIndex > 0;
    return AppBar(
      leading: canGoBack
          ? AppButton.icon(
              iconData: TablerIcons.arrow_left,
              size: AppButtonSize.xl,
              onPressed: () {
                if (canGoBack) {
                  context.checkoutBloc.add(
                    StepperIndexUpdateEvent(index: currentStepperIndex - 1),
                  );
                  CheckoutPageBody.scrollController.jumpTo(0);
                }
              },
            )
          : null,
      title: Text(context.l10n.cart_and_checkout),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
