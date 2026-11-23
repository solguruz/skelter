import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/feedback/bloc/feedback_bloc.dart';
import 'package:skelter/presentation/feedback/bloc/feedback_event.dart';
import 'package:skelter/presentation/feedback/enum/feedback_category.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class FeedbackCategorySection extends StatelessWidget {
  const FeedbackCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = context.select<FeedbackBloc, FeedbackCategory?>(
      (bloc) => bloc.state.category,
    );
    final categoryError = context.select<FeedbackBloc, String?>(
      (bloc) => bloc.state.categoryError,
    );

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          context.localization.feedback_category_label,
          style: AppTextStyles.p2SemiBold.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 8),
        ...FeedbackCategory.values.map(
          (category) => _CategoryTile(
            category: category,
            isSelected: selected == category,
            onTap: () => context.read<FeedbackBloc>().add(
              FeedbackCategoryChangedEvent(category: category),
            ),
          ),
        ),
        if (categoryError != null && categoryError.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            categoryError,
            style: AppTextStyles.p4Regular.copyWith(
              color: context.currentTheme.strokeErrorDefault,
            ),
          ),
        ],
      ],
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  final FeedbackCategory category;
  final bool isSelected;
  final VoidCallback onTap;

  IconData get _icon {
    switch (category) {
      case FeedbackCategory.bug:
        return TablerIcons.bug;
      case FeedbackCategory.suggestion:
        return TablerIcons.bulb;
      case FeedbackCategory.content:
        return TablerIcons.file_text;
      case FeedbackCategory.compliment:
        return TablerIcons.thumb_up;
      case FeedbackCategory.other:
        return TablerIcons.help_circle;
    }
  }

  String _label(BuildContext context) {
    final loc = context.localization;
    switch (category) {
      case FeedbackCategory.bug:
        return loc.feedback_category_bug;
      case FeedbackCategory.suggestion:
        return loc.feedback_category_suggestion;
      case FeedbackCategory.content:
        return loc.feedback_category_content;
      case FeedbackCategory.compliment:
        return loc.feedback_category_compliment;
      case FeedbackCategory.other:
        return loc.feedback_category_other;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.currentTheme;
    final color = isSelected
        ? theme.strokeBrandHover
        : theme.strokeNeutralLight200;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.strokeBrandHover.withValues(alpha: 0.08)
              : theme.bgSurfaceBase2,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color),
        ),
        child: Row(
          children: [
            Icon(
              _icon,
              size: 18,
              color: isSelected
                  ? theme.strokeBrandHover
                  : theme.iconNeutralDefault,
            ),
            const SizedBox(width: 10),
            Text(
              _label(context),
              style: AppTextStyles.p3Medium.copyWith(
                color: isSelected
                    ? theme.strokeBrandHover
                    : theme.textNeutralPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
