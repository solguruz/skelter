import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class DeleteAccountOptionsItems extends StatelessWidget {
  final String reason;
  final bool isSelected;
  final VoidCallback onSelected;

  const DeleteAccountOptionsItems({
    super.key,
    required this.reason,
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
                    ? AppColors.bgBrandDefault
                    : AppColors.transparent,
                border: isSelected
                    ? null
                    : Border.all(
                        color: AppColors.strokeNeutralLight200,
                        width: 1.5,
                      ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 24,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                reason,
                style: AppTextStyles.p2Medium
                    .withColor(AppColors.textNeutralPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
