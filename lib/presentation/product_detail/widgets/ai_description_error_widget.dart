import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_state.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class AIDescriptionErrorWidget extends StatelessWidget {
  const AIDescriptionErrorWidget({
    super.key,
    required this.state,
    required this.onTap,
  });

  final ProductDetailState state;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.currentTheme.bgErrorLight50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.currentTheme.strokeErrorDefault),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Icon(
                Icons.error_outline,
                color: context.currentTheme.textErrorPrimary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  context.localization.failed_to_load_subscriptions,
                  style: AppTextStyles.p3Bold.copyWith(
                    color: context.currentTheme.textErrorPrimary,
                  ),
                ),
              ),
            ],
          ),
          if (state.errorMessage != null) ...[
            const SizedBox(height: 8),
            Text(
              state.errorMessage!,
              style: AppTextStyles.p4Regular.copyWith(
                color: context.currentTheme.textErrorSecondary,
              ),
            ),
          ],
          const SizedBox(height: 12),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: context.currentTheme.bgErrorDefault,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: .min,
                children: [
                  Icon(
                    Icons.refresh,
                    size: 16,
                    color: context.currentTheme.textNeutralWhite,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    context.localization.try_again,
                    style: AppTextStyles.p4Medium.copyWith(
                      color: context.currentTheme.textNeutralWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
