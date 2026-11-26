import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class PhotosTitle extends StatelessWidget {
  const PhotosTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          context.localization.product_photos,
          style: AppTextStyles.p2SemiBold.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
      ],
    );
  }
}
