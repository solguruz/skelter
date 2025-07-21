import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_style_enum.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CouponItem extends StatelessWidget {
  const CouponItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.bgNeutralLight100,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.icons.coupon,
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    child: Text(
                      'FREEDELIVERY',
                      style: AppTextStyles.p3Bold.withColor(AppColors.white),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              AppButton(
                label: context.localization.apply,
                style: AppButtonStyle.textOrIcon,
                size: AppButtonSize.large,
                onPressed: () {
                  context.maybePop();
                },
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Get 10% off on orders above 200%',
            style: AppTextStyles.p3SemiBold,
          ),
          const SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam '
            'nonumy eirmod tempor invidunt ut labore et dolore',
            style: AppTextStyles.p4Regular.withColor(
              AppColors.textNeutralSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
