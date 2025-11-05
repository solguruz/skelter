import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_style_enum.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class CouponItem extends StatelessWidget {
  const CouponItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.currentTheme.bgSurfaceBase2,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: context.currentTheme.strokeNeutralLight200,
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
                      style: AppTextStyles.p3Bold
                          .copyWith(color: AppColors.shadesWhite),
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
                foregroundColor: context.currentTheme.textBrandSecondary,
                onPressed: () {
                  context.maybePop();
                },
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Get 10% off on orders above 200%',
            style: AppTextStyles.p3SemiBold
                .copyWith(color: context.currentTheme.textNeutralPrimary),
          ),
          const SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam '
            'nonumy eirmod tempor invidunt ut labore et dolore',
            style: AppTextStyles.p4Regular.copyWith(
              color: context.currentTheme.textNeutralSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
