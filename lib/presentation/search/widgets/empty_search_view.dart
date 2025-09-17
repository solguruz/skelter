import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class EmptySearchView extends StatelessWidget {
  const EmptySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.icons.userNotFound,
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 24),
          Text(
            context.localization.no_result_for('Home'),
            style: AppTextStyles.p1SemiBold
                .withColor(AppColors.currentTheme.textNeutralPrimary),
          ),
          const SizedBox(height: 8),
          Text(
            context.localization.no_search_result_message,
            style: AppTextStyles.p2Regular
                .withColor(AppColors.currentTheme.textNeutralSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
