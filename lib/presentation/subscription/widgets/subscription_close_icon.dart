import 'package:auto_route/auto_route.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_style_enum.dart';

class SubscriptionCloseIcon extends StatelessWidget {
  const SubscriptionCloseIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: AppButton(
        style: AppButtonStyle.textOrIcon,
        isIconButton: true,
        foregroundColor: context.currentTheme.iconNeutralPressed,
        iconData: TablerIcons.x,
        size: AppButtonSize.extraLarge,
        onPressed: () => context.pop(),
      ),
    );
  }
}
