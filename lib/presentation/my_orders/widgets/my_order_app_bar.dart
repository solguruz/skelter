import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class MyOrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyOrderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        context.localization.my_orders,
        style: AppTextStyles.h6SemiBold.copyWith(
          color: context.currentTheme.textNeutralPrimary,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
