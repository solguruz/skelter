import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_event.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_state.dart';
import 'package:flutter_skeleton/presentation/home/data/dummy_product_data.dart';
import 'package:flutter_skeleton/presentation/home/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    setupFirebaseCoreMocks();
    await Firebase.initializeApp(
      name: 'tenantIdTest',
      options: const FirebaseOptions(
        apiKey: 'apiKey',
        appId: 'appId',
        messagingSenderId: 'messagingSenderId',
        projectId: 'projectId',
      ),
    );
  });

  // Widget tests
  group('Home Page', () {
    testWidgets('home page', (tester) async {
      //arrange
      final homeBloc = MockHomeBloc();
      when(() => homeBloc.state).thenReturn(
        HomeState.test(),
      );

      //act
      await tester.runWidgetTest(
        providers: [
          BlocProvider<HomeBloc>.value(value: homeBloc),
        ],
        child: const HomeScreenWrapper(),
      );

      // assert
      expect(find.byType(HomeScreenWrapper), findsOneWidget);
    });

    // Golden test cases
    testExecutable(() {
      goldenTest(
        'Home page UI test',
        fileName: 'home_screen',
        pumpBeforeTest: precacheImages,
        builder: () {
          //arrange
          final homeBloc = MockHomeBloc();
          when(() => homeBloc.state).thenReturn(
            HomeState.test(topProducts: dummyProductData),
          );

          // act, assert
          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'home_screen',
                providers: [
                  BlocProvider<HomeBloc>.value(value: homeBloc),
                ],
                child: const HomeScreenWrapper(),
              ),
            ],
          );
        },
      );
    });
  });
}
