import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_event.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_state.dart';
import 'package:flutter_skeleton/presentation/home/home_page.dart';
import 'package:flutter_skeleton/presentation/profile/profile_page.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/logout_button.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  // Widget tests
  group('Profile Page', () {
    testWidgets('Profile page', (tester) async {
      //arrange

      //act
      await tester.runWidgetTest(
        child: const ProfilePage(),
      );

      // assert
      expect(find.byType(ProfilePage), findsOneWidget);
      expect(find.byType(AppButton), findsOneWidget);
      expect(find.text('Logout'), findsOneWidget);
    });

    // Golden tests
    testExecutable(() {
      group('Profile Page UI test', () {
        goldenTest(
          'Profile page',
          fileName: 'profile_page',
          builder: () {
            //arrange
            final homeBloc = MockHomeBloc();
            when(() => homeBloc.state).thenReturn(
              HomeState.test(currentBottomNavIndex: 4),
            );

            // act, assert
            return GoldenTestGroup(
              children: [
                createTestScenario(
                  name: 'Profile page selected in bottom bar',
                  child: const HomePageWrapper(),
                  providers: [
                    BlocProvider<HomeBloc>.value(value: homeBloc),
                  ],
                ),
                createTestScenario(
                  name: 'Profile page UI',
                  child: const ProfilePage(),
                ),
              ],
            );
          },
        );

        goldenTest(
          'Having a Logout button',
          fileName: 'having_a_logout_button',
          builder: () {
            //arrange

            // act, assert
            return GoldenTestGroup(
              children: [
                createTestScenario(
                  addScaffold: true,
                  name: 'Having a Logout button with normal state',
                  child: const LogoutButton(),
                ),
              ],
            );
          },
        );
      });
    });
  });
}
