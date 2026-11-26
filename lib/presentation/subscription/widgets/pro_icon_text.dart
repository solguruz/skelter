import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class ProIconText extends StatelessWidget {
  const ProIconText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.icons.proIcon.path,
          height: 80,
          width: 80,
          fit: .fill,
        ),
        const SizedBox(height: 24),
        Text(
          context.localization.unlock_access,
          style: AppTextStyles.h1,
          textAlign: .center,
        ),
        Text(
          context.localization.app_name,
          style: AppTextStyles.h1.copyWith(
            color: context.currentTheme.bgBrandDefault,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          context.localization.plan_description,
          style: AppTextStyles.p2Medium,
          textAlign: .center,
        ),
      ],
    );
  }
}
