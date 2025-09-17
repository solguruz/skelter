import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:skelter/presentation/checkout/bloc/checkout_events.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class CheckoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CheckoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentStepperIndex = context.select<CheckoutBloc, int>(
      (bloc) => bloc.state.stepperIndex,
    );
    final bool canGoBack = currentStepperIndex > 0;
    return AppBar(
      backgroundColor: AppColors.currentTheme.bgSurfaceBase,
      leading: canGoBack
          ? AppButton.icon(
              iconData: TablerIcons.arrow_left,
              size: AppButtonSize.extraLarge,
              onPressed: () {
                if (canGoBack) {
                  context.read<CheckoutBloc>().add(
                        StepperIndexUpdateEvent(index: currentStepperIndex - 1),
                      );
                }
              },
            )
          : null,
      title: const AppBarTitleText(),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarTitleText extends StatelessWidget {
  const AppBarTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    final currentStepperIndex = context.select<CheckoutBloc, int>(
      (bloc) => bloc.state.stepperIndex,
    );
    switch (currentStepperIndex) {
      case 0:
        return Text(
          context.localization.cart_and_checkout,
          style: AppTextStyles.p2SemiBold.withColor(
            AppColors.currentTheme.textNeutralPrimary,
          ),
        );
      case 1:
        return Text(
          context.localization.shipping_details,
          style: AppTextStyles.p2SemiBold.withColor(
            AppColors.currentTheme.textNeutralPrimary,
          ),
        );
      case 2:
        return Text(
          context.localization.payment,
          style: AppTextStyles.p2SemiBold.withColor(
            AppColors.currentTheme.textNeutralPrimary,
          ),
        );
      case 3:
        return Text(
          context.localization.order_review,
          style: AppTextStyles.p2SemiBold.withColor(
            AppColors.currentTheme.textNeutralPrimary,
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
