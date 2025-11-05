import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

class ProductDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String category;

  const ProductDetailAppBar({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppButton.icon(
        iconData: TablerIcons.arrow_left,
        iconOrTextColorOverride: context.currentTheme.iconNeutralDefault,
        size: AppButtonSize.extraLarge,
        onPressed: () => context.router.maybePop(),
      ),
      title: Text(
        category,
        style: AppTextStyles.h6SemiBold
            .copyWith(color: context.currentTheme.textNeutralPrimary),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
