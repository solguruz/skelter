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
import 'package:skelter/presentation/login/screens/login_with_phone_number/login_with_phone_number_screen.dart';
import 'package:skelter/presentation/login/screens/login_with_phone_number/widgets/heading_welcome_widget.dart';
import 'package:skelter/presentation/login/screens/login_with_phone_number/widgets/login_options_divider.dart';
import 'package:skelter/presentation/login/screens/login_with_phone_number/widgets/more_login_options_button.dart';
import 'package:skelter/presentation/login/screens/login_with_phone_number/widgets/phone_number_text_field.dart';
import 'package:skelter/presentation/login/screens/login_with_phone_number/widgets/send_otp_button.dart';
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
  group('Login With Phone Number Screen', () {
    testWidgets('Login With Phone Number Screen renders correctly',
        (tester) async {
      await tester.runWidgetTest(
        child: const LoginWithPhoneNumberScreen(),
      );
      expect(find.byType(LoginWithPhoneNumberScreen), findsOneWidget);
      expect(find.byType(HeadingWelcomeWidget), findsOneWidget);
      expect(find.byType(PhoneNumberTextField), findsOneWidget);
      expect(find.byType(SendOTPButton), findsOneWidget);
      expect(find.byType(LoginOptionsDivider), findsOneWidget);
      expect(find.byType(MoreLoginOptionsButton), findsOneWidget);
    });
  });

  // Golden tests for main screen
  testExecutable(() {
    goldenTest(
      'Login With Phone Number Screen UI Test',
      fileName: 'login_with_phone_number_screen',
      pumpBeforeTest: precacheImages,
      builder: () {
        final loginBlocEmpty = MockLoginBloc();
        when(() => loginBlocEmpty.state).thenReturn(
          LoginState.test(
            phoneNumberLoginState: PhoneNumberLoginState.test(),
          ),
        );

        final loginBlocFilled = MockLoginBloc();
        when(() => loginBlocFilled.state).thenReturn(
          LoginState.test(
            phoneNumberLoginState: PhoneNumberLoginState.test(
              countryCode: '+91',
              phoneNumber: '9876543210',
            ),
          ),
        );

        final loginBlocWithError = MockLoginBloc();
        when(() => loginBlocWithError.state).thenReturn(
          LoginState.test(
            phoneNumberLoginState: PhoneNumberLoginState.test(
              countryCode: '+91',
              phoneNumber: '123456',
              phoneNumErrorMessage: 'Invalid phone number',
            ),
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'default phone number state',
              child: const LoginWithPhoneNumberBody(isFromDeleteAccount: false),
              addScaffold: true,
              providers: [
                BlocProvider<LoginBloc>.value(value: loginBlocEmpty),
              ],
            ),
            createTestScenario(
              name: 'valid phone number state',
              child: const LoginWithPhoneNumberBody(isFromDeleteAccount: false),
              addScaffold: true,
              providers: [
                BlocProvider<LoginBloc>.value(value: loginBlocFilled),
              ],
            ),
            createTestScenario(
              name: 'error phone number state',
              child: const LoginWithPhoneNumberBody(isFromDeleteAccount: false),
              addScaffold: true,
              providers: [
                BlocProvider<LoginBloc>.value(value: loginBlocWithError),
              ],
            ),
          ],
        );
      },
    );
  });

  // Golden tests for send OTP button
  testExecutable(() {
    goldenTest(
      'Send OTP Button UI Test',
      fileName: 'login_send_otp_button',
      pumpBeforeTest: precacheImages,
      builder: () {
        final loginBlocDisabled = MockLoginBloc();
        when(() => loginBlocDisabled.state).thenReturn(
          LoginState.test(
            phoneNumberLoginState: PhoneNumberLoginState.test(),
          ),
        );

        final loginBlocEnabled = MockLoginBloc();
        when(() => loginBlocEnabled.state).thenReturn(
          LoginState.test(
            phoneNumberLoginState: PhoneNumberLoginState.test(
              countryCode: '+91',
              phoneNumber: '9876543210',
              isPhoneNumValid: true,
            ),
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'disabled button state',
              child: const SendOTPButton(),
              addScaffold: true,
              providers: [
                BlocProvider<LoginBloc>.value(
                  value: loginBlocDisabled,
                ),
              ],
            ),
            createTestScenario(
              name: 'enabled button state',
              child: const SendOTPButton(),
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
