import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/signup/bloc/signup_bloc.dart';
import 'package:skelter/presentation/signup/bloc/signup_event.dart';
import 'package:skelter/presentation/signup/bloc/signup_state.dart';
import 'package:skelter/presentation/signup/screens/signup_with_email/create_your_password_screen.dart';
import 'package:skelter/presentation/signup/screens/signup_with_email/widgets/confirm_password_text_field.dart';
import 'package:skelter/presentation/signup/screens/signup_with_email/widgets/password_next_button.dart';
import 'package:skelter/presentation/signup/screens/signup_with_email/widgets/password_requirement_stats.dart';
import 'package:skelter/presentation/signup/screens/signup_with_email/widgets/password_text_field.dart';
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
  group('Create Your Password Screen', () {
    testWidgets('Create Your Password Screen renders correctly',
        (tester) async {
      final signupBloc = MockSignupBloc();
      when(() => signupBloc.state).thenReturn(SignupState.test());

      await tester.runWidgetTest(
        child: CreateYourPasswordScreen(signupBloc: signupBloc),
      );
      expect(find.byType(CreateYourPasswordScreen), findsOneWidget);
      expect(find.byType(PasswordTextField), findsOneWidget);
      expect(find.byType(PasswordRequirementStats), findsOneWidget);
      expect(find.byType(ConfirmPasswordTextField), findsOneWidget);
      expect(find.byType(PasswordNextButton), findsOneWidget);
    });
  });

  // Golden tests for main screen
  testExecutable(() {
    goldenTest(
      'Create Your Password Screen UI Test',
      fileName: 'create_your_password_screen',
      builder: () {
        final signupBlocEmpty = MockSignupBloc();
        when(() => signupBlocEmpty.state).thenReturn(
          SignupState.test(
            email: 'test@example.com',
          ),
        );

        final signupBlocPoorPassword = MockSignupBloc();
        when(() => signupBlocPoorPassword.state).thenReturn(
          SignupState.test(
            email: 'test@example.com',
            password: 'poor',
            passwordStrengthLevel: 1,
            isPasswordLongEnough: false,
            hasLetterAndNumberInPassword: false,
            hasSpecialCharacterInPassword: false,
          ),
        );

        final signupBlocWeakPassword = MockSignupBloc();
        when(() => signupBlocWeakPassword.state).thenReturn(
          SignupState.test(
            email: 'test@example.com',
            password: 'Password123',
            passwordStrengthLevel: 2,
            isPasswordLongEnough: true,
            hasLetterAndNumberInPassword: true,
            hasSpecialCharacterInPassword: false,
          ),
        );

        final signupBlocStrongPassword = MockSignupBloc();
        when(() => signupBlocStrongPassword.state).thenReturn(
          SignupState.test(
            email: 'test@example.com',
            password: 'Password123!',
            passwordStrengthLevel: 3,
            isPasswordLongEnough: true,
            hasLetterAndNumberInPassword: true,
            hasSpecialCharacterInPassword: true,
          ),
        );

        final signupBlocPasswordMismatch = MockSignupBloc();
        when(() => signupBlocPasswordMismatch.state).thenReturn(
          SignupState.test(
            email: 'test@example.com',
            password: 'Password123!',
            confirmPassword: 'Password123',
            confirmPasswordErrorMessage: 'Passwords do not match',
            passwordStrengthLevel: 3,
            isPasswordLongEnough: true,
            hasLetterAndNumberInPassword: true,
            hasSpecialCharacterInPassword: true,
          ),
        );

        final signupBlocOnlyLetters = MockSignupBloc();
        when(() => signupBlocOnlyLetters.state).thenReturn(
          SignupState.test(
            email: 'test@example.com',
            password: 'LettersOnly',
            passwordStrengthLevel: 1,
            isPasswordLongEnough: true,
            hasLetterAndNumberInPassword: false,
            hasSpecialCharacterInPassword: false,
            isPasswordVisible: true,
          ),
        );

        final signupBlocOnlyNumbers = MockSignupBloc();
        when(() => signupBlocOnlyNumbers.state).thenReturn(
          SignupState.test(
            email: 'test@example.com',
            password: '123456789',
            passwordStrengthLevel: 1,
            isPasswordLongEnough: true,
            hasLetterAndNumberInPassword: false,
            hasSpecialCharacterInPassword: false,
            isPasswordVisible: true,
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'default password state',
              child: CreateYourPasswordScreen(signupBloc: signupBlocEmpty),
            ),
            createTestScenario(
              name: 'poor password state',
              child:
                  CreateYourPasswordScreen(signupBloc: signupBlocPoorPassword),
            ),
            createTestScenario(
              name: 'weak password state',
              child: CreateYourPasswordScreen(
                signupBloc: signupBlocWeakPassword,
              ),
            ),
            createTestScenario(
              name: 'strong password state',
              child: CreateYourPasswordScreen(
                signupBloc: signupBlocStrongPassword,
              ),
            ),
            createTestScenario(
              name: 'password mismatch state',
              child: CreateYourPasswordScreen(
                signupBloc: signupBlocPasswordMismatch,
              ),
            ),
            createTestScenario(
              name: 'only letters password state',
              child: CreateYourPasswordScreen(
                signupBloc: signupBlocOnlyLetters,
              ),
            ),
            createTestScenario(
              name: 'only numbers password state',
              child: CreateYourPasswordScreen(
                signupBloc: signupBlocOnlyNumbers,
              ),
            ),
          ],
        );
      },
    );
  });
}
