import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class AIDescriptionGenerateButton extends StatelessWidget {
  const AIDescriptionGenerateButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: context.currentTheme.strokeBrandDefault),
          borderRadius: BorderRadius.circular(12),
          color: context.currentTheme.bgBrandLight50,
        ),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Icon(
              Icons.psychology_outlined,
              color: context.currentTheme.textBrandPrimary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              context.localization.generate_ai_description,
              style: AppTextStyles.p3Medium.copyWith(
                color: context.currentTheme.textBrandPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
