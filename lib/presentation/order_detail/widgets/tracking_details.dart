import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/order_detail/model/tracking_model.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class TrackingDetails extends StatelessWidget {
  const TrackingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    const steps = TrackingData.mockSteps;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          context.localization.tracking_detail,
          style: AppTextStyles.h6Bold.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: context.currentTheme.strokeNeutralLight200,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: List.generate(steps.length, (index) {
              final step = steps[index];
              return _TrackingItem(
                title: step.title,
                date: step.date,
                description: step.description,
                isFirst: index == 0,
                isLast: index == steps.length - 1,
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _TrackingItem extends StatelessWidget {
  const _TrackingItem({
    required this.title,
    required this.date,
    required this.description,
    this.isFirst = false,
    this.isLast = false,
  });

  final String title;
  final String date;
  final String description;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: .circle,
                  color: context.currentTheme.bgBrandDefault,
                ),
                child: const Icon(
                  TablerIcons.check,
                  size: 14,
                  color: AppColors.white,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: CustomPaint(
                    size: const Size(2, double.infinity),
                    painter: _DashedLinePainter(
                      color: context.currentTheme.bgBrandDefault,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.p2Medium.copyWith(
                        color: context.currentTheme.textNeutralPrimary,
                      ),
                    ),
                    Text(
                      date,
                      style: AppTextStyles.p4Regular.copyWith(
                        color: context.currentTheme.textNeutralPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: AppTextStyles.p4Regular.copyWith(
                    color: context.currentTheme.textNeutralSecondary,
                  ),
                ),
                if (!isLast) const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  _DashedLinePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = .stroke;

    const dashHeight = 4.0;
    const dashSpace = 4.0;
    double startY = 2;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
