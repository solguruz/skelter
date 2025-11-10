import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/presentation/login/bloc/login_state.dart';
import 'package:skelter/presentation/login/screens/login_with_email/login_with_email_password_screen.dart';
import 'package:skelter/presentation/login/screens/login_with_email/widgets/login_with_email_pass_button.dart';
import 'package:skelter/services/firebase_auth_services.dart';

import '../../../../integration_test/mock_firebase_auth.dart';
import '../../../flutter_test_config.dart';
import '../../../test_helpers.dart';

class MockLoginBloc extends MockBloc<LoginEvents, LoginState>
    implements LoginBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    final mockAuthService = MockFirebaseAuthService();
    if (sl.isRegistered<FirebaseAuthService>()) {
      sl.unregister<FirebaseAuthService>();
    }
    sl.registerLazySingleton<FirebaseAuthService>(() => mockAuthService);
  });

  // Widget tests
  group('Login With Email Screen', () {
    testWidgets('Login With Email Screen renders correctly', (tester) async {
      final loginBloc = MockLoginBloc();
      when(() => loginBloc.state).thenReturn(LoginState.test());

      await tester.runWidgetTest(
        child: LoginWithEmailPasswordScreen(loginBloc: loginBloc),
      );
      expect(find.byType(LoginWithEmailPasswordScreen), findsOneWidget);
      expect(find.byType(LoginWithEmailPassButton), findsOneWidget);
    });
  });

  // Golden tests for main screen
  testExecutable(() {
    goldenTest(
      'Login With Email Screen UI Test',
      fileName: 'login_with_email_screen',
      builder: () {
        final loginBlocEmpty = MockLoginBloc();
        when(() => loginBlocEmpty.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(),
          ),
        );

        final loginBlocFilled = MockLoginBloc();
        when(() => loginBlocFilled.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(
              email: 'test@example.com',
              password: 'password123',
            ),
          ),
        );

        final loginBlocPasswordVisible = MockLoginBloc();
        when(() => loginBlocPasswordVisible.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(
              password: 'password123',
              isPasswordVisible: true,
            ),
          ),
        );

        final loginBlocEmailError = MockLoginBloc();
        when(() => loginBlocEmailError.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(
              email: 'invalid-email',
              password: 'password123',
              emailErrorMessage: 'Invalid email format',
            ),
          ),
        );

        final loginBlocPasswordError = MockLoginBloc();
        when(() => loginBlocPasswordError.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(
              email: 'test@example.com',
              password: 'short',
              passwordErrorMessage: 'Password must be at least 8 characters',
            ),
          ),
        );

        final loginBlocWithErrors = MockLoginBloc();
        when(() => loginBlocWithErrors.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(
              email: 'invalid-email',
              password: 'short',
              emailErrorMessage: 'Invalid email format',
              passwordErrorMessage: 'Password must be at least 8 characters',
            ),
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'default email state',
              child: LoginWithEmailPasswordScreen(loginBloc: loginBlocEmpty),
            ),
            createTestScenario(
              name: 'valid email state',
              child: LoginWithEmailPasswordScreen(loginBloc: loginBlocFilled),
            ),
            createTestScenario(
              name: 'password visible state',
              child: LoginWithEmailPasswordScreen(
                loginBloc: loginBlocPasswordVisible,
              ),
            ),
            createTestScenario(
              name: 'error email state',
              child:
                  LoginWithEmailPasswordScreen(loginBloc: loginBlocEmailError),
            ),
            createTestScenario(
              name: 'error password state',
              child: LoginWithEmailPasswordScreen(
                loginBloc: loginBlocPasswordError,
              ),
            ),
            createTestScenario(
              name: 'error both fields state',
              child:
                  LoginWithEmailPasswordScreen(loginBloc: loginBlocWithErrors),
            ),
          ],
        );
      },
    );
  });

  // Golden tests for login button
  testExecutable(() {
    goldenTest(
      'Login With Email Button UI Test',
      fileName: 'login_email_button',
      builder: () {
        final loginBlocDisabled = MockLoginBloc();
        when(() => loginBlocDisabled.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(),
          ),
        );

        final loginBlocEnabled = MockLoginBloc();
        when(() => loginBlocEnabled.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(
              email: 'test@example.com',
              password: 'password123',
            ),
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'disabled button state',
              child: const LoginWithEmailPassButton(),
              addScaffold: true,
              providers: [
                BlocProvider<LoginBloc>.value(
                  value: loginBlocDisabled,
                ),
              ],
            ),
            createTestScenario(
              name: 'enabled button state',
              child: const LoginWithEmailPassButton(),
              addScaffold: true,
              providers: [
                BlocProvider<LoginBloc>.value(
                  value: loginBlocEnabled,
                ),
              ],
            ),
          ],
        );
      },
    );
  });
}
