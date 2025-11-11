import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class NoProductDetailFound extends StatelessWidget {
  const NoProductDetailFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppButton.icon(
          iconData: TablerIcons.arrow_left,
          size: AppButtonSize.extraLarge,
          onPressed: () => context.router.maybePop(),
        ),
        title: Text(
          context.localization.product_details,
          style: AppTextStyles.h6SemiBold
              .copyWith(color: AppColors.textNeutralPrimary),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icons.noProductDetailFound,
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 24),
            Text(
              context.localization.no_product_detail_found,
              style: AppTextStyles.p1SemiBold.copyWith(
                color: AppColors.textNeutralPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
