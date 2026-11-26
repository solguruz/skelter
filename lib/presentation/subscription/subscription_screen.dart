import 'package:auto_route/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/payment_failed/payment_failed_screen.dart';
import 'package:skelter/presentation/payment_processing/payment_processing_screen.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_bloc.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_event.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_state.dart';
import 'package:skelter/presentation/subscription/widgets/pro_icon_text.dart';
import 'package:skelter/presentation/subscription/widgets/subscription_bottom_nav_bar.dart';
import 'package:skelter/presentation/subscription/widgets/subscription_close_icon.dart';
import 'package:skelter/presentation/subscription/widgets/subscription_plan_fetch_error.dart';
import 'package:skelter/presentation/subscription/widgets/subscription_plans.dart';
import 'package:skelter/presentation/subscription/widgets/subscription_renew_text.dart';
import 'package:skelter/presentation/subscription_activated/subscription_activated_screen.dart';
import 'package:skelter/services/subscription_service.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';

@RoutePage()
class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        return SubscriptionBloc(
          localization: context.localization,
          subscriptionService: SubscriptionService(),
        )..add(const FetchSubscriptionPackagesEvent());
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<SubscriptionBloc, SubscriptionState>(
            listenWhen: (previous, current) {
              return current is FetchSubscriptionPlanLoadedState &&
                  current.restoreStatusMessage != null;
            },
            listener: (context, state) {
              if (state is FetchSubscriptionPlanLoadedState &&
                  state.restoreStatusMessage != null) {
                context.showSnackBar(state.restoreStatusMessage!);
                context.read<SubscriptionBloc>().add(
                  const ClearSnackBarMessageEvent(),
                );
              }
            },
            child: BlocBuilder<SubscriptionBloc, SubscriptionState>(
              builder: (context, state) {
                if (state is FetchSubscriptionPlanLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FetchSubscriptionPlanFailureState) {
                  return const SubscriptionPlanFetchError();
                } else if (state is FetchSubscriptionPlanLoadedState) {
                  return const SubscriptionScreenBody();
                } else if (state is SubscriptionPaymentProcessingState) {
                  return const PaymentProcessingScreen();
                } else if (state is SubscriptionPaymentSuccessState) {
                  return const SubscriptionActivatedScreen();
                } else if (state is SubscriptionPaymentFailureState) {
                  return const PaymentFailedScreen();
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<SubscriptionBloc, SubscriptionState>(
          builder: (context, state) {
            if (state is FetchSubscriptionPlanLoadedState) {
              return const SubscriptionBottomNavBar();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class SubscriptionScreenBody extends StatelessWidget {
  const SubscriptionScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SubscriptionCloseIcon(),
            SizedBox(height: 14),
            ProIconText(),
            SizedBox(height: 14),
            SubscriptionPlans(),
            SizedBox(height: 14),
            SubscriptionRenewText(),
          ],
        ),
      ),
    );
  }
}
