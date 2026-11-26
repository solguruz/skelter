import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_bloc.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_event.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_state.dart';
import 'package:skelter/presentation/subscription/model/subscription_package_model.dart';
import 'package:skelter/presentation/subscription/widgets/subscription_plan_card.dart';

class SubscriptionPlans extends StatelessWidget {
  const SubscriptionPlans({super.key});

  @override
  Widget build(BuildContext context) {
    final packages = context
        .select<SubscriptionBloc, List<SubscriptionPackageModel>>((bloc) {
          final state = bloc.state;
          if (state is FetchSubscriptionPlanLoadedState) return state.packages;
          return const <SubscriptionPackageModel>[];
        });

    final selectedPlan = context
        .select<SubscriptionBloc, SubscriptionPackageModel?>((bloc) {
          final state = bloc.state;
          return state is FetchSubscriptionPlanLoadedState
              ? state.selectedPackage
              : null;
        });

    return Column(
      children: packages.map((package) {
        final isMonthly = package.identifier.contains(revenueCatMonthly);
        final isSelected =
            selectedPlan != null &&
            selectedPlan.identifier == package.identifier;

        return SubscriptionPlanCard(
          title: isMonthly
              ? context.localization.monthly_plan
              : context.localization.yearly_plan,
          price: package.price,
          duration: isMonthly
              ? context.localization.monthly_duration
              : context.localization.yearly_duration,
          renewal: isMonthly
              ? context.localization.monthly_renewal
              : context.localization.yearly_renewal,
          isSelected: isSelected,
          onTap: () => context.read<SubscriptionBloc>().add(
            SelectSubscriptionPlanEvent(
              packages: packages,
              selectedPackage: package,
            ),
          ),
        );
      }).toList(),
    );
  }
}
