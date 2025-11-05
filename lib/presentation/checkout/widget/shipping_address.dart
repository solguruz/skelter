import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = context.select<CheckoutBloc, String>(
      (bloc) => bloc.state.userName,
    );

    final address = context.select<CheckoutBloc, String>(
      (bloc) => bloc.state.address,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: context.currentTheme.strokeNeutralLight200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: AppTextStyles.p2Medium.copyWith(
                    color: context.currentTheme.textNeutralPrimary,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
                Text(
                  address,
                  style: AppTextStyles.p3Regular.copyWith(
                    color: context.currentTheme.textNeutralSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.currentTheme.bgSurfaceBase2,
              border: Border.all(
                color: context.currentTheme.strokeNeutralLight200,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor2.withAlpha(15),
                  spreadRadius: 1,
                  blurRadius: 6,
                ),
              ],
            ),
            child: AppButton.icon(
              iconData: TablerIcons.pencil,
              iconOrTextColorOverride: context.currentTheme.iconNeutralHover,
              onPressed: () {
                context.router.push(const EditAddressRoute());
              },
            ),
          ),
        ],
      ),
    );
  }
}
