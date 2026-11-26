import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/presentation/payment_failed/payment_failed_screen.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_bloc.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_event.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_state.dart';
import 'package:skelter/presentation/subscription/model/subscription_package_model.dart';
import 'package:skelter/presentation/subscription/subscription_screen.dart';
import 'package:skelter/presentation/subscription/widgets/subscription_bottom_nav_bar.dart';
import 'package:skelter/presentation/subscription/widgets/subscription_plan_fetch_error.dart';
import 'package:skelter/presentation/subscription_activated/subscription_activated_screen.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockSubscriptionBloc
    extends MockBloc<SubscriptionEvent, SubscriptionState>
    implements SubscriptionBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testExecutable(() {
    goldenTest(
      'Subscription Screen',
      fileName: 'subscription_screen',
      pumpBeforeTest: precacheImages,
      builder: () {
        final subscriptionBlocLoaded = MockSubscriptionBloc();
        when(() => subscriptionBlocLoaded.state).thenReturn(
          FetchSubscriptionPlanLoadedState(
            SubscriptionState.test(
              packages: const [
                SubscriptionPackageModel(
                  identifier: 'monthly',
                  price: '\$9.99',
                  title: 'Monthly',
                  description: 'Monthly subscription',
                ),
                SubscriptionPackageModel(
                  identifier: 'yearly',
                  price: '\$99.99',
                  title: 'Yearly',
                  description: 'Yearly subscription',
                ),
              ],
              selectedPackage: const SubscriptionPackageModel(
                identifier: 'monthly',
                price: '\$9.99',
                title: 'Monthly',
                description: 'Monthly subscription',
              ),
            ),
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Subscription Screen Light Theme',
              child: const SubscriptionScreenBody(),
              addScaffold: true,
              providers: [
                BlocProvider<SubscriptionBloc>.value(
                  value: subscriptionBlocLoaded,
                ),
              ],
            ),
            createTestScenario(
              name: 'Subscription Screen Dark Theme',
              theme: AppThemeEnum.DarkTheme,
              addScaffold: true,
              child: const SubscriptionScreenBody(),
              providers: [
                BlocProvider<SubscriptionBloc>.value(
                  value: subscriptionBlocLoaded,
                ),
              ],
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Subscription Bottom Nav Bar',
      fileName: 'subscription_bottom_nav_bar',
      builder: () {
        final subscriptionBlocEnabled = MockSubscriptionBloc();
        when(() => subscriptionBlocEnabled.state).thenReturn(
          FetchSubscriptionPlanLoadedState(
            SubscriptionState.test(
              packages: const [
                SubscriptionPackageModel(
                  identifier: 'monthly',
                  price: '\$9.99',
                  title: 'Monthly',
                  description: 'Monthly subscription',
                ),
              ],
              selectedPackage: const SubscriptionPackageModel(
                identifier: 'monthly',
                price: '\$9.99',
                title: 'Monthly',
                description: 'Monthly subscription',
              ),
            ),
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Subscription Bottom Nav Bar Light Theme',
              child: const SubscriptionBottomNavBar(),
              addScaffold: true,
              providers: [
                BlocProvider<SubscriptionBloc>.value(
                  value: subscriptionBlocEnabled,
                ),
              ],
            ),
            createTestScenario(
              name: 'Subscription Bottom Nav Bar Dark Theme',
              theme: AppThemeEnum.DarkTheme,
              child: const SubscriptionBottomNavBar(),
              addScaffold: true,
              providers: [
                BlocProvider<SubscriptionBloc>.value(
                  value: subscriptionBlocEnabled,
                ),
              ],
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Subscription Plan Fetch Error',
      fileName: 'subscription_plan_fetch_error',
      builder: () {
        final subscriptionBlocError = MockSubscriptionBloc();
        when(() => subscriptionBlocError.state).thenReturn(
          FetchSubscriptionPlanFailureState(
            SubscriptionState.test(),
            error: 'Failed to load subscription plans',
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Subscription Plan Fetch Error Light Theme',
              child: const SubscriptionPlanFetchError(),
              addScaffold: true,
              providers: [
                BlocProvider<SubscriptionBloc>.value(
                  value: subscriptionBlocError,
                ),
              ],
            ),
            createTestScenario(
              name: 'Subscription Plan Fetch Error Dark Theme',
              theme: AppThemeEnum.DarkTheme,
              child: const SubscriptionPlanFetchError(),
              addScaffold: true,
              providers: [
                BlocProvider<SubscriptionBloc>.value(
                  value: subscriptionBlocError,
                ),
              ],
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Subscription Activated Screen',
      fileName: 'subscription_activated_screen',
      pumpBeforeTest: precacheImages,
      builder: () {
        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Subscription Activated Screen Light Theme',
              child: const SubscriptionActivatedScreen(),
            ),
            createTestScenario(
              name: 'Subscription Activated Screen Dark Theme',
              theme: AppThemeEnum.DarkTheme,
              child: const SubscriptionActivatedScreen(),
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Payment Failed Screen',
      fileName: 'payment_failed_screen',
      pumpBeforeTest: precacheImages,
      builder: () {
        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Payment Failed Screen Light Theme',
              child: const PaymentFailedScreen(),
            ),
            createTestScenario(
              name: 'Payment Failed Screen Dark Theme',
              theme: AppThemeEnum.DarkTheme,
              child: const PaymentFailedScreen(),
            ),
          ],
        );
      },
    );
  });
}
