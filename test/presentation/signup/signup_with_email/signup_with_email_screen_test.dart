import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/signup/bloc/signup_bloc.dart';
import 'package:skelter/presentation/signup/bloc/signup_event.dart';
import 'package:skelter/presentation/signup/bloc/signup_state.dart';
import 'package:skelter/presentation/signup/screens/signup_with_email/signup_with_email_password_screen.dart';
import 'package:skelter/presentation/signup/screens/signup_with_email/widgets/email_next_button.dart';
import 'package:skelter/presentation/signup/screens/signup_with_email/widgets/email_text_field.dart';
import 'package:skelter/services/firebase_auth_services.dart';

import '../../../../integration_test/mock_firebase_auth.dart';
import '../../../flutter_test_config.dart';
import '../../../test_helpers.dart';

class MockSignupBloc extends MockBloc<SignupEvent, SignupState>
    implements SignupBloc {}

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
  group('Signup With Email Screen', () {
    testWidgets('Signup With Email Screen renders correctly', (tester) async {
      await tester.runWidgetTest(
        child: const SignupWithEmailPasswordScreen(),
      );
      expect(find.byType(SignupWithEmailPasswordScreen), findsOneWidget);
      expect(find.byType(EmailTextField), findsOneWidget);
      expect(find.byType(EmailNextButton), findsOneWidget);
    });
  });

  // Golden tests
  testExecutable(() {
    goldenTest(
      'Signup With Email Screen UI Test',
      fileName: 'signup_with_email_screen',
      builder: () {
        final signupBlocDefault = MockSignupBloc();
        when(() => signupBlocDefault.state).thenReturn(
          SignupState.test(),
        );

        final signupBlocValidEmail = MockSignupBloc();
        when(() => signupBlocValidEmail.state).thenReturn(
          SignupState.test(
            email: 'test@example.com',
          ),
        );

        final signupBlocLongEmail = MockSignupBloc();
        when(() => signupBlocLongEmail.state).thenReturn(
          SignupState.test(
            email: 'verylongemailaddressfortestingpurposes'
                '@verylongdomainnametotest.com',
          ),
        );

        final signupBlocInvalidEmail = MockSignupBloc();
        when(() => signupBlocInvalidEmail.state).thenReturn(
          SignupState.test(
            email: 'invalid-email',
            emailErrorMessage: 'Please enter a valid email',
          ),
        );

        final signupBlocEmptyEmailError = MockSignupBloc();
        when(() => signupBlocEmptyEmailError.state).thenReturn(
          SignupState.test(
            email: '',
            emailErrorMessage: "Email can't be empty",
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'default email state',
              child:
                  SignupWithEmailPasswordScreen(signupBloc: signupBlocDefault),
            ),
            createTestScenario(
              name: 'valid email state',
              child: SignupWithEmailPasswordScreen(
                signupBloc: signupBlocValidEmail,
              ),
            ),
            createTestScenario(
              name: 'long email state',
              child: SignupWithEmailPasswordScreen(
                signupBloc: signupBlocLongEmail,
              ),
            ),
            createTestScenario(
              name: 'invalid email state',
              child: SignupWithEmailPasswordScreen(
                signupBloc: signupBlocInvalidEmail,
              ),
            ),
            createTestScenario(
              name: 'empty email state',
              child: SignupWithEmailPasswordScreen(
                signupBloc: signupBlocEmptyEmailError,
              ),
            ),
          ],
        );
      },
    );
  });
}
