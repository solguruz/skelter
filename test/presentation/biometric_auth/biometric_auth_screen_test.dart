import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/biometric_auth/biometric_auth_screen.dart';
import 'package:skelter/presentation/biometric_auth/bloc/biometric_auth_bloc.dart';
import 'package:skelter/presentation/biometric_auth/bloc/biometric_auth_event.dart';
import 'package:skelter/presentation/biometric_auth/bloc/biometric_auth_state.dart';
import 'package:skelter/presentation/biometric_auth/widgets/biometric_auth_enrollment_bottom_sheet.dart';
import 'package:skelter/services/firebase_auth_services.dart';
import 'package:skelter/services/local_auth_services.dart';
import 'package:skelter/shared_pref/pref_keys.dart';
import 'package:skelter/shared_pref/prefs.dart';

import '../../../integration_test/mock_firebase_auth.dart';
import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockBiometricAuthBloc
    extends MockBloc<BiometricAuthEvent, BiometricAuthState>
    implements BiometricAuthBloc {}

class MockLocalAuthService extends Mock implements LocalAuthService {}

class MockSharedPreferencesAsync extends Mock
    implements SharedPreferencesAsync {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFirebaseAuth mockFirebaseAuthService;
  late MockLocalAuthService mockLocalAuthService;

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

    mockFirebaseAuthService = MockFirebaseAuth();
    sl.registerLazySingleton<FirebaseAuthService>(
      () => FirebaseAuthService(firebaseAuth: mockFirebaseAuthService),
    );

    mockLocalAuthService = MockLocalAuthService();
    when(
      () => mockLocalAuthService.isBiometricSupported,
    ).thenAnswer((_) async => true);
    sl.registerLazySingleton<LocalAuthService>(() => mockLocalAuthService);

    // Mocks SharedPreferencesAsync to prevent LateInitializationError
    // in the BLoC during tests.
    final mockPrefs = MockSharedPreferencesAsync();
    when(() => mockPrefs.getBool(any())).thenAnswer((_) async => null);
    Prefs.setMockPrefs(mockPrefs);
  });

  group('BiometricAuthScreen UI Test', () {
    testWidgets('BiometricAuthScreen', (tester) async {
      final biometricAuthBloc = MockBiometricAuthBloc();

      when(
        () => biometricAuthBloc.state,
      ).thenReturn(const BiometricAuthState.test(isBiometricSupported: true));

      whenListen(
        biometricAuthBloc,
        Stream.value(const BiometricAuthState.test(isBiometricSupported: true)),
        initialState: const BiometricAuthState.test(isBiometricSupported: true),
      );

      await tester.runWidgetTest(
        providers: [
          BlocProvider<BiometricAuthBloc>.value(value: biometricAuthBloc),
        ],
        child: const BiometricAuthScreen(),
      );

      expect(find.byType(BiometricAuthScreen), findsOneWidget);
    });

    testExecutable(() {
      goldenTest(
        'Biometric supported but not enrolled',
        fileName: 'biometric_supported_not_enrolled',
        builder: () {
          final biometricAuthBloc = MockBiometricAuthBloc();

          const biometricAuthState = BiometricAuthState.test(
            isBiometricSupported: true,
          );

          when(() => biometricAuthBloc.state).thenReturn(biometricAuthState);

          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'Biometric supported but not enrolled',
                addScaffold: true,
                child: const BiometricAuthBody(),
                providers: [
                  BlocProvider<BiometricAuthBloc>.value(
                    value: biometricAuthBloc,
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
        'Biometric supported and enrolled',
        fileName: 'biometric_supported_and_enrolled',
        builder: () {
          final biometricAuthBloc = MockBiometricAuthBloc();

          const biometricAuthState = BiometricAuthState.test(
            isBiometricSupported: true,
            isBiometricEnrolled: true,
          );

          when(() => biometricAuthBloc.state).thenReturn(biometricAuthState);

          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'Biometric supported and enrolled',
                addScaffold: true,
                child: const BiometricAuthBody(),
                providers: [
                  BlocProvider<BiometricAuthBloc>.value(
                    value: biometricAuthBloc,
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
        'Biometric enabled state',
        fileName: 'biometric_enabled_state',
        builder: () {
          final biometricAuthBloc = MockBiometricAuthBloc();

          final biometricAuthState = IsBiometricAuthEnabledState(
            const BiometricAuthState.test(isBiometricSupported: true),
            isBiometricEnrolled: true,
          );

          when(() => biometricAuthBloc.state).thenReturn(biometricAuthState);

          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'Biometric enabled state',
                addScaffold: true,
                child: const BiometricAuthBody(),
                providers: [
                  BlocProvider<BiometricAuthBloc>.value(
                    value: biometricAuthBloc,
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
        'Biometric disabled state',
        fileName: 'biometric_disabled_state',
        builder: () {
          final biometricAuthBloc = MockBiometricAuthBloc();

          final biometricAuthState = IsBiometricAuthEnabledState(
            const BiometricAuthState.test(isBiometricSupported: true),
            isBiometricEnrolled: false,
          );

          when(() => biometricAuthBloc.state).thenReturn(biometricAuthState);

          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'Biometric supported but not enrolled',
                addScaffold: true,
                child: const BiometricAuthBody(),
                providers: [
                  BlocProvider<BiometricAuthBloc>.value(
                    value: biometricAuthBloc,
                  ),
                ],
              ),
            ],
          );
        },
      );
    });

    testExecutable(() {
      final biometricAuthBloc = MockBiometricAuthBloc();
      final streamController = StreamController<BiometricAuthState>.broadcast();

      goldenTest(
        'Biometric enrollment bottom sheet',
        fileName: 'biometric_enrollment_bottom_sheet',
        pumpBeforeTest: (tester) async {
          // Mock initial values for SharedPreferences.
          SharedPreferences.setMockInitialValues({
            PrefKeys.kIsBiometricEnabled: false,
          });

          // Emit state to trigger the bottom sheet.
          streamController.add(
            BiometricAuthNotEnrolledState(
              const BiometricAuthState.test(isBiometricSupported: true),
            ),
          );
          await tester.pumpAndSettle();
        },
        builder: () {
          // Set initial state
          when(() => biometricAuthBloc.state).thenReturn(
            const BiometricAuthState.test(isBiometricSupported: true),
          );

          // Mock the stream
          whenListen(
            biometricAuthBloc,
            streamController.stream,
            initialState: const BiometricAuthState.test(
              isBiometricSupported: true,
            ),
          );

          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'Biometric enrollment bottom sheet',
                addScaffold: true,
                child: BlocListener<BiometricAuthBloc, BiometricAuthState>(
                  listener: (context, state) {
                    if (state is BiometricAuthNotEnrolledState) {
                      showBiometricSetupEnrollmentBottomSheet(context);
                    }
                  },
                  child: const BiometricAuthBody(),
                ),
                providers: [
                  BlocProvider<BiometricAuthBloc>.value(
                    value: biometricAuthBloc,
                  ),
                ],
              ),
            ],
          );
        },
      );
    });
  });
}
