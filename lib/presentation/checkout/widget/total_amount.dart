import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({super.key});

  @override
  Widget build(BuildContext context) {
    final finalAmount = context.select<CheckoutBloc, double>(
      (bloc) => bloc.state.finalAmount,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.total_amount,
          style: AppTextStyles.p4Regular
              .copyWith(color: context.currentTheme.textNeutralSecondary),
        ),
        const SizedBox(height: 6),
        Text(
          '\$$finalAmount',
          style: AppTextStyles.h6Bold
              .copyWith(color: context.currentTheme.textNeutralPrimary),
        ),
      ],
    );
  }
}
