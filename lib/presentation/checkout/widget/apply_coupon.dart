import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class ApplyCoupon extends StatelessWidget {
  const ApplyCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    final couponCount = context.select<CheckoutBloc, int>(
      (bloc) => bloc.state.couponCount,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: AppEnvironment.isTestEnvironment
          ? MainAxisSize.min
          : MainAxisSize.max,
      children: [
        Text(
          context.localization.apply_coupon,
          style: AppTextStyles.p2SemiBold.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            context.pushRoute(
              const AvailableCouponsRoute(),
            );
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.currentTheme.bgBrandLight50,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(
              context.localization.coupon_message(couponCount),
              style: AppTextStyles.p3SemiBold
                  .copyWith(color: context.currentTheme.textBrandPrimary),
            ),
          ),
        ),
      ],
    );
  }
}
