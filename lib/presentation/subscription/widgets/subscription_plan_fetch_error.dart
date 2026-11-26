import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_bloc.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_state.dart';

class SubscriptionPlanFetchError extends StatelessWidget {
  const SubscriptionPlanFetchError({super.key});

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select<SubscriptionBloc, String?>(
      (bloc) => (bloc.state as FetchSubscriptionPlanFailureState).errorMessage,
    );

    return Center(
      child: Text(errorMessage ?? '', style: AppTextStyles.p1SemiBold),
    );
  }
}
