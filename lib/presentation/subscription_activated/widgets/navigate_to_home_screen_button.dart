import 'package:auto_route/auto_route.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

class NavigateToHomeScreenButton extends StatelessWidget {
  const NavigateToHomeScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.localization.go_to_home,
      foregroundColor: context.currentTheme.textNeutralLight,
      shouldSetFullWidth: true,
      size: AppButtonSize.extraLarge,
      onPressed: () => context.router.pushAndPopUntil(
        const HomeRoute(),
        predicate: (_) => false,
      ),
    );
  }
}
