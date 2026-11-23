import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/presentation/login/bloc/login_state.dart';
import 'package:skelter/presentation/login/screens/forgot_password/forgot_password_screen.dart';
import 'package:skelter/presentation/login/screens/forgot_password/widgets/email_text_field.dart';
import 'package:skelter/presentation/login/screens/forgot_password/widgets/send_reset_link_button.dart';
import 'package:skelter/services/firebase_auth_services.dart';

import '../../../../integration_test/mock_firebase_auth.dart';
import '../../../flutter_test_config.dart';
import '../../../test_helpers.dart';

class MockLoginBloc extends MockBloc<LoginEvents, LoginState>
    implements LoginBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockFirebaseAuth mokFirebaseAuth;
  late FirebaseAuthService mockFirebaseAuthService;

  setUp(() {
    mokFirebaseAuth = MockFirebaseAuth();
    sl.allowReassignment = true;
    mockFirebaseAuthService = FirebaseAuthService(
      firebaseAuth: mokFirebaseAuth,
    );
    sl.registerLazySingleton<FirebaseAuthService>(
      () => mockFirebaseAuthService,
    );
  });

  // Widget tests
  group('Forgot Password Screen', () {
    testWidgets('Forgot Password Screen renders correctly', (tester) async {
      final loginBloc = MockLoginBloc();
      when(() => loginBloc.state).thenReturn(LoginState.test());

      await tester.runWidgetTest(
        child: ForgotPasswordScreen(loginBloc: loginBloc),
      );
      expect(find.byType(ForgotPasswordScreen), findsOneWidget);
      expect(find.byType(EmailTextField), findsOneWidget);
      expect(find.byType(SendResetLinkButton), findsOneWidget);
    });
  });

  // Golden tests
  testExecutable(() {
    goldenTest(
      'Forgot Password Screen UI Test',
      fileName: 'forgot_password_screen',
      builder: () {
        final loginBlocEmptyEmail = MockLoginBloc();
        when(() => loginBlocEmptyEmail.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(),
          ),
        );

        final loginBlocValidEmail = MockLoginBloc();
        when(() => loginBlocValidEmail.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(
              email: 'test@example.com',
            ),
          ),
        );

        final loginBlocLongEmail = MockLoginBloc();
        when(() => loginBlocLongEmail.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(
              email:
                  'longemailaddressforlogintestingpurposes'
                  '@longdomainnametotest.com',
            ),
          ),
        );

        final loginBlocInvalidEmail = MockLoginBloc();
        when(() => loginBlocInvalidEmail.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(
              email: 'invalid-email',
              emailErrorMessage: 'Please enter a valid email',
            ),
          ),
        );

        final loginBlocEmptyEmailError = MockLoginBloc();
        when(() => loginBlocEmptyEmailError.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(
              email: '',
              emailErrorMessage: "Email can't be empty",
            ),
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'default email state',
              child: ForgotPasswordScreen(loginBloc: loginBlocEmptyEmail),
            ),
            createTestScenario(
              name: 'valid email state',
              child: ForgotPasswordScreen(loginBloc: loginBlocValidEmail),
            ),
            createTestScenario(
              name: 'long email state',
              child: ForgotPasswordScreen(loginBloc: loginBlocLongEmail),
            ),
            createTestScenario(
              name: 'invalid email state',
              child: ForgotPasswordScreen(loginBloc: loginBlocInvalidEmail),
            ),
            createTestScenario(
              name: 'empty email state',
              child: ForgotPasswordScreen(loginBloc: loginBlocEmptyEmailError),
            ),
          ],
        );
      },
    );
  });
  // Test send reset link button widget
  testExecutable(() {
    goldenTest(
      'Send Reset Link Button UI Test',
      fileName: 'forgot_password_reset_button',
      builder: () {
        final loginBlocEmptyEmail = MockLoginBloc();
        when(() => loginBlocEmptyEmail.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(),
          ),
        );

        final loginBlocValidEmail = MockLoginBloc();
        when(() => loginBlocValidEmail.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(
              email: 'test@example.com',
            ),
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'disabled button state',
              child: const SendResetLinkButton(),
              addScaffold: true,
              providers: [
                BlocProvider<LoginBloc>.value(value: loginBlocEmptyEmail),
              ],
            ),
            createTestScenario(
              name: 'enabled button state',
              child: const SendResetLinkButton(),
              addScaffold: true,
              providers: [
                BlocProvider<LoginBloc>.value(value: loginBlocValidEmail),
              ],
            ),
          ],
        );
      },
    );
  });
}
