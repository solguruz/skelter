import 'package:auto_route/annotations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/empty_saved_cards/widgets/empty_saved_cards_app_bar.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

@RoutePage()
class EmptySavedCardScreen extends StatelessWidget {
  const EmptySavedCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptySavedCardAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: .center,
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
                style: AppTextStyles.p3Regular.copyWith(
                  color: context.currentTheme.textNeutralSecondary,
                ),
                textAlign: .center,
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
      ),
    );
  }
}
