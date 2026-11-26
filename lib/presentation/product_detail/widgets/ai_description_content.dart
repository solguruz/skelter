import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_state.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class AIDescriptionContent extends StatelessWidget {
  const AIDescriptionContent({
    super.key,
    required this.state,
    required this.onTap,
  });

  final ProductDetailState state;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.currentTheme.bgSurfaceBase,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: context.currentTheme.strokeBrandDefault),
          ),
          child: Text(
            state.aiDescription!.generatedDescription,
            style: AppTextStyles.p3Medium.copyWith(
              color: context.currentTheme.textNeutralPrimary,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              context.localization.generated_by_ai,
              style: AppTextStyles.p4Regular.copyWith(
                color: context.currentTheme.textNeutralSecondary,
              ),
            ),
            TextButton.icon(
              onPressed: onTap,
              icon: Icon(
                Icons.refresh,
                size: 16,
                color: context.currentTheme.textBrandPrimary,
              ),
              label: Text(
                context.localization.regenerate,
                style: AppTextStyles.p4Medium.copyWith(
                  color: context.currentTheme.textBrandPrimary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
