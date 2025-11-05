import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

class EmptySavedCardView extends StatelessWidget {
  const EmptySavedCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icons.emptySavedCards,
              height: 195,
              width: 195,
            ),
            const SizedBox(height: 24),
            Text(
              context.localization.empty_cards_list_title,
              style: AppTextStyles.p1SemiBold.copyWith(
                color: context.currentTheme.textNeutralPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.localization.empty_cards_list_message,
              style: AppTextStyles.p3Regular
                  .copyWith(color: context.currentTheme.textNeutralSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            AppButton(
              label: context.localization.explore_products,
              foregroundColor: context.currentTheme.textNeutralLight,
              onPressed: () {},
              size: AppButtonSize.extraLarge,
            ),
          ],
        ),
      ),
    );
  }
}
