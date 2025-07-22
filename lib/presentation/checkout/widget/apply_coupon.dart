import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/utils/app_environment.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

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
          style: AppTextStyles.p2SemiBold,
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
              color: AppColors.bgBrandLight50,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(
              context.localization.coupon_message(couponCount),
              style: AppTextStyles.p3SemiBold
                  .withColor(AppColors.textBrandPrimary),
            ),
          ),
        ),
      ],
    );
  }
}
