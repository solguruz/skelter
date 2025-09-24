import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/presentation/force_update/bloc/force_update_bloc.dart';
import 'package:skelter/presentation/force_update/bloc/force_update_event.dart';
import 'package:skelter/presentation/force_update/bloc/force_update_state.dart';
import 'package:skelter/presentation/force_update/force_update_screen.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockForceUpdateBloc extends MockBloc<ForceUpdateEvent, ForceUpdateState>
    implements ForceUpdateBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    setupFirebaseCoreMocks();
    await Firebase.initializeApp(
      name: 'test',
      options: const FirebaseOptions(
        apiKey: 'apiKey',
        appId: 'appId',
        messagingSenderId: 'messagingSenderId',
        projectId: 'projectId',
      ),
    );
  });

  group(
    'Force Update Screen',
    () {
      testExecutable(() {
        goldenTest(
          'Optional update (skip allowed)',
          fileName: 'force_update_optional_screen',
          builder: () {
            final forceUpdateBloc = MockForceUpdateBloc();

            const forceUpdateState = ForceUpdateState.test();

            when(() => forceUpdateBloc.state).thenReturn(forceUpdateState);

            return GoldenTestGroup(
              columnWidthBuilder: (_) =>
                  const FixedColumnWidth(pixel5DeviceWidth),
              children: [
                createTestScenario(
                  name: 'Optional update (skip allowed) Light Theme',
                  addScaffold: true,
                  child: const ForceUpdateScreenBody(),
                  providers: [
                    BlocProvider<ForceUpdateBloc>.value(
                      value: forceUpdateBloc,
                    ),
                  ],
                ),
                createTestScenario(
                  name: 'Optional update (skip allowed) Dark Theme',
                  addScaffold: true,
                  theme: AppThemeEnum.DarkTheme,
                  child: const ForceUpdateScreenBody(),
                  providers: [
                    BlocProvider<ForceUpdateBloc>.value(
                      value: forceUpdateBloc,
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
          'Mandatory update (no skip)',
          fileName: 'force_update_mandatory_screen',
          builder: () {
            final mockBloc = MockForceUpdateBloc();

            const forceUpdateState = ForceUpdateState.test(
              isMandatoryUpdate: true,
            );

            when(() => mockBloc.state).thenReturn(forceUpdateState);

            return GoldenTestGroup(
              columnWidthBuilder: (_) =>
                  const FixedColumnWidth(pixel5DeviceWidth),
              children: [
                createTestScenario(
                  name: 'Mandatory update (no skip) Light Theme',
                  addScaffold: true,
                  child: const ForceUpdateScreenBody(),
                  providers: [
                    BlocProvider<ForceUpdateBloc>.value(
                      value: mockBloc,
                    ),
                  ],
                ),
                createTestScenario(
                  name: 'Mandatory update (no skip) Dark Theme',
                  addScaffold: true,
                  theme: AppThemeEnum.DarkTheme,
                  child: const ForceUpdateScreenBody(),
                  providers: [
                    BlocProvider<ForceUpdateBloc>.value(
                      value: mockBloc,
                    ),
                  ],
                ),
              ],
            );
          },
        );
      });
    },
  );
}
