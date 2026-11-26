import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_bloc.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_event.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_style_enum.dart';

class RestoreSubscription extends StatelessWidget {
  const RestoreSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    final isRestoring = context.select<SubscriptionBloc, bool>(
      (bloc) => bloc.state.isRestoring,
    );

    return AppButton(
      label: context.localization.restore_subscription,
      style: AppButtonStyle.textOrIcon,
      foregroundColor: context.currentTheme.bgBrandDefault,
      isLoading: isRestoring,
      size: AppButtonSize.extraLarge,
      onPressed: isRestoring
          ? null
          : () => context.read<SubscriptionBloc>().add(
              const RestoreSubscriptionEvent(),
            ),
    );
  }
}
