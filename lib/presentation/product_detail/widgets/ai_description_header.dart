import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class AIDescriptionHeader extends StatelessWidget {
  const AIDescriptionHeader({
    super.key,
    this.hasAIDescription = false,
    this.isGenerating = false,
    this.userOrderHistory,
  });

  final bool hasAIDescription;
  final bool isGenerating;
  final List<String>? userOrderHistory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.auto_awesome,
          size: 20,
          color: context.currentTheme.textBrandPrimary,
        ),
        const SizedBox(width: 8),
        Text(
          hasAIDescription
              ? context.localization.ai_powered_description
              : context.localization.get_ai_description,
          style: AppTextStyles.p2Bold.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        if (userOrderHistory != null && userOrderHistory!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: context.currentTheme.bgBrandLight50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                context.localization.personalized,
                style: AppTextStyles.p4Medium.copyWith(
                  color: context.currentTheme.textBrandPrimary,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
