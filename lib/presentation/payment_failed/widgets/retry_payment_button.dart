import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_bloc.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_event.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

class RetryPaymentButton extends StatelessWidget {
  const RetryPaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.localization.retry_payment,
      shouldSetFullWidth: true,
      backgroundColor: context.currentTheme.bgBrandDefault,
      foregroundColor: context.currentTheme.textNeutralLight,
      size: AppButtonSize.extraLarge,
      onPressed: () => context.read<SubscriptionBloc>().add(
        const FetchSubscriptionPackagesEvent(),
      ),
    );
  }
}
