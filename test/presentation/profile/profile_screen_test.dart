import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/presentation/home/bloc/home_bloc.dart';
import 'package:skelter/presentation/home/bloc/home_event.dart';
import 'package:skelter/presentation/home/bloc/home_state.dart';
import 'package:skelter/presentation/profile/bloc/profile_bloc.dart';
import 'package:skelter/presentation/profile/bloc/profile_event.dart';
import 'package:skelter/presentation/profile/bloc/profile_state.dart';
import 'package:skelter/presentation/profile/profile_screen.dart';
import 'package:skelter/presentation/profile/widgets/profile_details.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

class MockProfileBloc extends MockBloc<ProfileEvent, ProfileState>
    implements ProfileBloc {}

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
  group('Profile Page', () {
    testWidgets('Profile page', (tester) async {
      //arrange
      final mockProfileBloc = MockProfileBloc();
      when(() => mockProfileBloc.state).thenReturn(
        ProfileState.test(
          name: 'Test User',
          email: 'test@example.com',
          isProUser: true,
        ),
      );

      //act
      await tester.runWidgetTest(
        providers: [
          BlocProvider<ProfileBloc>.value(value: mockProfileBloc),
        ],
        child: const ProfileScreenBody(), // Use ProfileScreenBody instead of
        // ProfileScreen to avoid duplicate BlocProvider
      );

      // assert
      expect(find.byType(ProfileScreenBody), findsOneWidget);
      expect(find.text('Sign out'), findsOneWidget);
    });

    // Golden tests
    testExecutable(() {
      group(
        'Profile Page UI test',
        () {
          goldenTest(
            'Profile page',
            fileName: 'profile_page',
            pumpBeforeTest: precacheImages,
            builder: () {
              //arrange

              final mockProfileBloc = MockProfileBloc();
              when(() => mockProfileBloc.state).thenReturn(
                ProfileState.test(
                  name: 'Test User',
                  email: 'x5t4T@example.com',
                  isProUser: true,
                ),
              );

              // act, assert
              return GoldenTestGroup(
                // Fixes "LayoutBuilder does not support returning
                // intrinsic dimensions" error
                columnWidthBuilder: (_) =>
                    const FixedColumnWidth(pixel5DeviceWidth),
                children: [
                  createTestScenario(
                    name: 'Profile page Light Theme',
                    child: const ProfileScreenBody(),
                    addScaffold: true,
                    providers: [
                      BlocProvider<ProfileBloc>.value(value: mockProfileBloc),
                    ],
                  ),
                  createTestScenario(
                    name: 'Profile page Dark Theme',
                    child: const ProfileScreenBody(),
                    addScaffold: true,
                    theme: AppThemeEnum.DarkTheme,
                    providers: [
                      BlocProvider<ProfileBloc>.value(value: mockProfileBloc),
                    ],
                  ),
                  createTestScenario(
                    name: 'Profile details Light Theme',
                    child: const ProfileDetails(),
                    addScaffold: true,
                    providers: [
                      BlocProvider<ProfileBloc>.value(value: mockProfileBloc),
                    ],
                  ),
                  createTestScenario(
                    name: 'Profile details Dark Theme',
                    child: const ProfileDetails(),
                    addScaffold: true,
                    theme: AppThemeEnum.DarkTheme,
                    providers: [
                      BlocProvider<ProfileBloc>.value(value: mockProfileBloc),
                    ],
                  ),
                ],
              );
            },
          );
        },
      );
    });
  });

  testExecutable(() {
    goldenTest(
      'Profile details with long name',
      fileName: 'profile_details_long_name',
      pumpBeforeTest: precacheImages,
      builder: () {
        // arrange
        final profileBloc = MockProfileBloc();
        when(() => profileBloc.state).thenReturn(
          ProfileState.test(
            name: 'This is very long name for testing purpose only',
            email: 'x5t4T_wzkrhzj_45454_qweurnzzlahrnzgkhf@example.com',
            isProUser: true,
          ),
        );

        // act, assert
        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Profile details with long name Light Theme',
              child: const ProfileDetails(),
              addScaffold: true,
              providers: [
                BlocProvider<ProfileBloc>.value(value: profileBloc),
              ],
            ),
            createTestScenario(
              name: 'Profile details with long name Dark Theme',
              child: const ProfileDetails(),
              addScaffold: true,
              theme: AppThemeEnum.DarkTheme,
              providers: [
                BlocProvider<ProfileBloc>.value(value: profileBloc),
              ],
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Regular User Profile details',
      fileName: 'profile_details_regular_user',
      pumpBeforeTest: precacheImages,
      builder: () {
        // arrange
        final profileBloc = MockProfileBloc();
        when(() => profileBloc.state).thenReturn(
          ProfileState.test(
            name: 'Test User',
            email: 'x5t4T@example.com',
          ),
        );

        // act, assert
        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Regular User Profile details Light Theme',
              child: const ProfileDetails(),
              addScaffold: true,
              providers: [
                BlocProvider<ProfileBloc>.value(value: profileBloc),
              ],
            ),
            createTestScenario(
              name: 'Regular User Profile details Dark Theme',
              child: const ProfileDetails(),
              addScaffold: true,
              theme: AppThemeEnum.DarkTheme,
              providers: [
                BlocProvider<ProfileBloc>.value(value: profileBloc),
              ],
            ),
          ],
        );
      },
    );
  });
}
