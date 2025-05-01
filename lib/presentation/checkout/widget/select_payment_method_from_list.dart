import 'package:flutter/material.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class SelectPaymentMethodFromList extends StatelessWidget {
  const SelectPaymentMethodFromList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 12),
        const PaymentMethodOnline(),
        const SizedBox(height: 14),
        const PaymentMethodCOD(),
      ],
    );
  }
}

class PaymentMethodOnline extends StatelessWidget {
  const PaymentMethodOnline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.strokeBrandDisabled,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: Assets.images.mastercard.image(),
        title: const Text('Debit/Credit Card/Bank Transfer'),
        onTap: () {
          //   set payment method to online
        },
      ),
    );
  }
}

class PaymentMethodCOD extends StatelessWidget {
  const PaymentMethodCOD({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.strokeNeutralLight200,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        title: Text(context.l10n.cash_on_delivery),
        onTap: () {
          //   set payment method to COD
        },
      ),
    );
  }
}
