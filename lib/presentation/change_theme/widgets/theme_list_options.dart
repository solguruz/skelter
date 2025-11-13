import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ThemeListOptions extends StatelessWidget {
  final String themeMode;
  final bool isSelected;
  final VoidCallback onSelected;

  const ThemeListOptions({
    super.key,
    required this.themeMode,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onSelected,
        behavior: HitTestBehavior.translucent,
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? context.currentTheme.bgBrandDefault
                    : context.currentTheme.bgSurfaceBase2,
                border: isSelected
                    ? null
                    : Border.all(
                        color: context.currentTheme.strokeNeutralLight200,
                        width: 1.5,
                      ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.shadesWhite,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                themeMode,
                style: AppTextStyles.p2Medium
                    .copyWith(color: context.currentTheme.textNeutralPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
