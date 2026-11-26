import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class SubscriptionPlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String duration;
  final String renewal;
  final bool isSelected;
  final VoidCallback onTap;

  const SubscriptionPlanCard({
    required this.title,
    required this.price,
    required this.duration,
    required this.renewal,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: context.currentTheme.bgSurfaceBase2,
          border: Border.all(
            color: isSelected
                ? context.currentTheme.bgBrandDefault
                : context.currentTheme.textNeutralSecondary,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          style: AppTextStyles.h5Bold,
                          overflow: .ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: .end,
                    children: [
                      Flexible(
                        child: Text(
                          '$price/ ',
                          style: AppTextStyles.h3.copyWith(
                            color: context.currentTheme.bgBrandDefault,
                          ),
                          overflow: .ellipsis,
                        ),
                      ),
                      Text(duration, style: AppTextStyles.p4Regular),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(renewal, style: AppTextStyles.p3Medium),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: isSelected && context.isDark
                    ? AppColors.white
                    : Colors.transparent,
                shape: .circle,
                border: Border.all(
                  width: isSelected ? 6 : 1,
                  color: isSelected
                      ? context.currentTheme.bgBrandDefault
                      : context.currentTheme.strokeNeutralLight200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
