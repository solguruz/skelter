import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class TitleAndRating extends StatelessWidget {
  final String title;
  final double rating;

  const TitleAndRating({
    super.key,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.p3SemiBold
                .copyWith(color: AppColors.textNeutralPrimary),
          ),
        ),
        const SizedBox(width: 8),
        Row(
          children: [
            const Icon(
              TablerIcons.star_filled,
              color: AppColors.bgWarningHover,
              size: 14.65,
            ),
            const SizedBox(width: 4),
            Text(
              rating.toString(),
              style: AppTextStyles.p4Medium
                  .copyWith(color: AppColors.textNeutralSecondary),
            ),
          ],
        ),
      ],
    );
  }
}
