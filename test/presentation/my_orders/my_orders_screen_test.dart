import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/presentation/my_orders/bloc/my_order_bloc.dart';
import 'package:skelter/presentation/my_orders/bloc/my_order_event.dart';
import 'package:skelter/presentation/my_orders/bloc/my_order_state.dart';
import 'package:skelter/presentation/my_orders/my_orders_screen.dart';
import 'package:skelter/presentation/my_orders/widgets/my_order_app_bar.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';
import 'data/my_orders_sample_data.dart';

class MockMyOrderBloc extends MockBloc<MyOrderEvent, MyOrderState>
    implements MyOrderBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testExecutable(() {
    group('My Orders Screen UI Golden Tests', () {
      goldenTest(
        'MyOrdersScreenBody filled',
        fileName: 'my_orders_screen',
        pumpBeforeTest: precacheImages,
        builder: () {
          final lightMockBloc = MockMyOrderBloc();
          when(() => lightMockBloc.state)
              .thenReturn(const MyOrderState.test(products: sampleProducts));

          final darkMockBloc = MockMyOrderBloc();
          when(() => darkMockBloc.state)
              .thenReturn(const MyOrderState.test(products: sampleProducts));

          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'My Orders Light Theme',
                addScaffold: true,
                providers: [
                  BlocProvider<MyOrderBloc>.value(value: lightMockBloc),
                ],
                child: const MyOrdersScreenBody(),
              ),
              createTestScenario(
                name: 'My Orders Dark Theme',
                theme: AppThemeEnum.DarkTheme,
                addScaffold: true,
                providers: [
                  BlocProvider<MyOrderBloc>.value(value: darkMockBloc),
                ],
                child: const MyOrdersScreenBody(),
              ),
            ],
          );
        },
      );

      goldenTest(
        'MyOrderAppBar',
        fileName: 'my_orders_app_bar',
        builder: () {
          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'My Orders AppBar Light Theme',
                child: const Scaffold(
                  appBar: MyOrderAppBar(),
                  body: SizedBox(),
                ),
              ),
              createTestScenario(
                name: 'My Orders AppBar Dark Theme',
                theme: AppThemeEnum.DarkTheme,
                child: const Scaffold(
                  appBar: MyOrderAppBar(),
                  body: SizedBox(),
                ),
              ),
            ],
          );
        },
      );
    });
  });
}
