import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_event.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_state.dart';
import 'package:flutter_skeleton/presentation/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
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
        child: const HomePage(),
      );

      // assert
      expect(find.byType(HomePage), findsOneWidget);
    });

    // Golden tests
    testExecutable(() {
      goldenTest(
        'Home page UI test',
        fileName: 'home_page_selected_in_bottom_bar',
        builder: () {
          //arrange
          final homeBloc = MockHomeBloc();
          when(() => homeBloc.state).thenReturn(
            HomeState.test(),
          );

          // act, assert
          return GoldenTestGroup(
            children: [
              createTestScenario(
                name: 'selected in bottom nav bar',
                addScaffold: true,
                providers: [
                  BlocProvider<HomeBloc>.value(value: homeBloc),
                ],
                child: const HomePage(),
              ),
            ],
          );
        },
      );
    });
  });
}
