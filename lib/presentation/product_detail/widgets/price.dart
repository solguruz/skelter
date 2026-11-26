import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/currency_formatter_util.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class Price extends StatelessWidget {
  final double price;

  const Price({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: CurrencyFormatterUtil.format(
          price,
          locale: context.localization.localeName,
        ),
        style: AppTextStyles.p3SemiBold.copyWith(
          color: context.currentTheme.textBrandPrimary,
        ),
        children: <InlineSpan>[
          const WidgetSpan(child: SizedBox(width: 5)),
          TextSpan(
            text: context.localization.inclusive_of_taxes,
            style: AppTextStyles.p3Medium.copyWith(
              color: context.currentTheme.textNeutralSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
