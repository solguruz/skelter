import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/presentation/login/bloc/login_state.dart';
import 'package:skelter/presentation/login/screens/phone_num_otp_screen/phone_number_otp_screen.dart';
import 'package:skelter/presentation/login/screens/phone_num_otp_screen/widgets/otp_input_field.dart';
import 'package:skelter/presentation/login/screens/phone_num_otp_screen/widgets/otp_verification_button.dart';
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

    // Mock sms_autofill plugin
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('sms_autofill'),
      (MethodCall methodCall) async {
        if (methodCall.method == 'listenForCode') {
          return null;
        } else if (methodCall.method == 'unregisterListener') {
          return null;
        }
        return null;
      },
    );
  });

  // Widget tests
  group('Phone Number OTP Screen', () {
    testWidgets('Phone Number OTP Screen renders correctly', (tester) async {
      final loginBloc = MockLoginBloc();
      when(() => loginBloc.state).thenReturn(
        LoginState.test(
          phoneNumberLoginState: PhoneNumberLoginState.test(
            phoneNumber: '9876543210',
            countryCode: '+91',
          ),
        ),
      );

      await tester.runWidgetTest(
        child: PhoneNumberOTPScreen(loginBloc: loginBloc),
      );
      expect(find.byType(PhoneNumberOTPScreen), findsOneWidget);
      expect(find.byType(OTPCodeInputField), findsOneWidget);
      expect(find.byType(OTPVerificationButton), findsOneWidget);
    });
  });

  // Golden tests for main screen
  testExecutable(() {
    goldenTest(
      'Phone Number OTP Screen UI Test',
      fileName: 'phone_num_otp_screen',
      builder: () {
        final loginBlocEmpty = MockLoginBloc();
        when(() => loginBlocEmpty.state).thenReturn(
          LoginState.test(
            phoneNumberLoginState: PhoneNumberLoginState.test(
              phoneNumber: '9876543210',
              countryCode: '+91',
            ),
          ),
        );

        final loginBlocCompleteOTP = MockLoginBloc();
        when(() => loginBlocCompleteOTP.state).thenReturn(
          LoginState.test(
            phoneNumberLoginState: PhoneNumberLoginState.test(
              phoneNumber: '9876543210',
              countryCode: '+91',
              phoneOTPText: '123456',
            ),
          ),
        );

        final loginBlocErrorOTP = MockLoginBloc();
        when(() => loginBlocErrorOTP.state).thenReturn(
          LoginState.test(
            phoneNumberLoginState: PhoneNumberLoginState.test(
              phoneNumber: '9876543210',
              countryCode: '+91',
              phoneOTPText: '123456',
              phoneOTPErrorMessage: 'Invalid OTP code',
            ),
          ),
        );

        final loginBlocResendEnabled = MockLoginBloc();
        when(() => loginBlocResendEnabled.state).thenReturn(
          LoginState.test(
            phoneNumberLoginState: PhoneNumberLoginState.test(
              phoneNumber: '9876543210',
              countryCode: '+91',
              isResendOTPEnabled: true,
            ),
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'default OTP state',
              child: PhoneNumberOTPScreen(loginBloc: loginBlocEmpty),
              addScaffold: true,
            ),
            createTestScenario(
              name: 'complete OTP state',
              child: PhoneNumberOTPScreen(loginBloc: loginBlocCompleteOTP),
              addScaffold: true,
            ),
            createTestScenario(
              name: 'error OTP state',
              child: PhoneNumberOTPScreen(loginBloc: loginBlocErrorOTP),
              addScaffold: true,
            ),
            createTestScenario(
              name: 'resend enabled OTP state',
              child: PhoneNumberOTPScreen(loginBloc: loginBlocResendEnabled),
              addScaffold: true,
            ),
          ],
        );
      },
    );
  });

  // Golden tests for OTP verification button
  testExecutable(() {
    goldenTest(
      'OTP Verification Button UI Test',
      fileName: 'phone_num_otp_verify_button',
      builder: () {
        final loginBlocDisabled = MockLoginBloc();
        when(() => loginBlocDisabled.state).thenReturn(
          LoginState.test(
            phoneNumberLoginState: PhoneNumberLoginState.test(
              phoneOTPText: '123',
            ),
          ),
        );

        final loginBlocEnabled = MockLoginBloc();
        when(() => loginBlocEnabled.state).thenReturn(
          LoginState.test(
            phoneNumberLoginState: PhoneNumberLoginState.test(
              phoneOTPText: '123456',
            ),
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'disabled button state',
              child: const OTPVerificationButton(),
              addScaffold: true,
              providers: [
                BlocProvider<LoginBloc>.value(
                  value: loginBlocDisabled,
                ),
              ],
            ),
            createTestScenario(
              name: 'enabled button state',
              child: const OTPVerificationButton(),
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
