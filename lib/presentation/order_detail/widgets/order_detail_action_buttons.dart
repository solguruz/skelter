import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/my_orders/bloc/my_order_bloc.dart';
import 'package:skelter/presentation/my_orders/bloc/my_order_event.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_style_enum.dart';

class OrderDetailActionButtons extends StatelessWidget {
  const OrderDetailActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final isGenerating = context.select<MyOrderBloc, bool>(
      (bloc) => bloc.state.isGeneratingInvoice,
    );

    return Column(
      children: [
        AppButton(
          onPressed: isGenerating
              ? null
              : () {
                  context.read<MyOrderBloc>().add(const GenerateInvoiceEvent());
                },
          label: context.localization.generate_invoice,
          foregroundColor: context.currentTheme.textNeutralLight,
          size: AppButtonSize.extraLarge,
          shouldSetFullWidth: true,
          isLoading: isGenerating,
        ),
        const SizedBox(height: 24),
        AppButton(
          label: context.localization.cancel_order,
          style: AppButtonStyle.outline,
          shouldSetFullWidth: true,
          borderColor: context.currentTheme.strokeErrorDisabled,
          foregroundColor: context.currentTheme.textErrorSecondary,
          size: AppButtonSize.extraLarge,
          onPressed: () =>
              context.showSnackBar(context.localization.cancel_order),
        ),
      ],
    );
  }
}
