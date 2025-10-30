import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/presentation/login/bloc/login_state.dart';
import 'package:skelter/presentation/login/enum/enum_login_type.dart';
import 'package:skelter/services/firebase_auth_services.dart';

import '../../../../integration_test/mock_firebase_auth.dart';

class MockAppLocalizations extends Mock implements AppLocalizations {}

void main() {
  late MockFirebaseAuthService mockAuthService;
  late MockAppLocalizations l10n;

  setUp(() {
    mockAuthService = MockFirebaseAuthService();
    l10n = MockAppLocalizations();

    if (sl.isRegistered<FirebaseAuthService>()) {
      sl.unregister<FirebaseAuthService>();
    }
    sl.registerLazySingleton<FirebaseAuthService>(() => mockAuthService);
  });

  group('LoginBloc Initialization', () {
    blocTest<LoginBloc, LoginState>(
      'should emit initial state with default values',
      build: () => LoginBloc(localizations: l10n),
      expect: () => <LoginState>[],
      verify: (bloc) {
        expect(bloc.state.isSignup, isFalse);
        expect(bloc.state.isLoading, isFalse);
        expect(bloc.state.selectedLoginType, LoginType.PHONE);
        expect(bloc.state.phoneNumberLoginState?.phoneNumErrorMessage, isNull);
        expect(bloc.state.emailPasswordLoginState?.email, isEmpty);
      },
    );
  });

  group('LoginBloc Mode Selection', () {
    blocTest<LoginBloc, LoginState>(
      'should enable signup mode',
      build: () => LoginBloc(localizations: l10n),
      act: (bloc) => bloc.add(EnableSignupModeEvent(isSignup: true)),
      expect: () => [
        predicate<LoginState>((state) => state.isSignup),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should select phone login type',
      build: () => LoginBloc(localizations: l10n),
      act: (bloc) => bloc.add(SelectLoginSignupTypeEvent(LoginType.PHONE)),
      expect: () => [
        predicate<LoginState>(
          (state) => state.selectedLoginType == LoginType.PHONE,
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should select email login type',
      build: () => LoginBloc(localizations: l10n),
      act: (bloc) => bloc.add(SelectLoginSignupTypeEvent(LoginType.EMAIL)),
      expect: () => [
        predicate<LoginState>(
          (state) => state.selectedLoginType == LoginType.EMAIL,
        ),
      ],
    );
  });

  group('LoginBloc Phone Number Input', () {
    blocTest<LoginBloc, LoginState>(
      'should update phone number in state',
      build: () => LoginBloc(localizations: l10n),
      act: (bloc) => bloc.add(PhoneNumChangeEvent(phoneNumber: '9876543210')),
      expect: () => [
        isA<LoginState>().having(
          (state) => state.phoneNumberLoginState?.phoneNumber,
          'phoneNumber',
          '9876543210',
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should update country code in state',
      build: () => LoginBloc(localizations: l10n),
      act: (bloc) => bloc.add(CountryCodeChangeEvent(countryCode: '+93')),
      expect: () => [
        isA<LoginState>().having(
          (state) => state.phoneNumberLoginState?.countryCode,
          'countryCode',
          '+93',
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should update phone number validation state',
      build: () => LoginBloc(localizations: l10n),
      act: (bloc) => bloc.add(IsPhoneNumValidEvent(isValid: false)),
      expect: () => [
        isA<LoginState>().having(
          (state) => state.phoneNumberLoginState?.isPhoneNumValid,
          'isPhoneNumValid',
          false,
        ),
      ],
    );
  });

  group('LoginBloc Phone Number Authentication', () {
    blocTest<LoginBloc, LoginState>(
      'should emit error state when phone number is invalid',
      build: () {
        when(() => l10n.invalid_mobile_number).thenReturn('Invalid number');
        return LoginBloc(localizations: l10n);
      },
      act: (bloc) => bloc.add(LoginWithPhoneNumEvent('+91abc')),
      expect: () => [
        isA<PhoneNumLoginLoadingState>()
            .having((state) => state.isLoading, 'isLoading', true),
        predicate<LoginState>(
          (state) =>
              state.phoneNumberLoginState?.phoneNumErrorMessage ==
              'Invalid number',
        ),
        isA<PhoneNumLoginLoadingState>()
            .having((state) => state.isLoading, 'isLoading', false),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should navigate to OTP screen when phone number is valid',
      build: () {
        when(() => l10n.invalid_mobile_number).thenReturn('Invalid number');
        return LoginBloc(localizations: l10n);
      },
      act: (bloc) => bloc.add(LoginWithPhoneNumEvent('+919876543210')),
      expect: () => [
        isA<PhoneNumLoginLoadingState>()
            .having((state) => state.isLoading, 'isLoading', true),
        isA<PhoneNumLoginLoadingState>()
            .having((state) => state.isLoading, 'isLoading', false),
        isA<NavigateToOTPScreenState>().having(
          (state) => state.phoneOTPVerificationId,
          'phoneOTPVerificationId',
          'mock_verification_id',
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should navigate to OTP screen in signup mode',
      build: () {
        when(() => l10n.invalid_mobile_number).thenReturn('Invalid number');
        return LoginBloc(localizations: l10n);
      },
      act: (bloc) {
        bloc.add(EnableSignupModeEvent(isSignup: true));
        bloc.add(LoginWithPhoneNumEvent('+919999888877'));
      },
      expect: () => [
        predicate<LoginState>((state) => state.isSignup),
        isA<PhoneNumLoginLoadingState>()
            .having((state) => state.isLoading, 'isLoading', true),
        isA<PhoneNumLoginLoadingState>()
            .having((state) => state.isLoading, 'isLoading', false),
        isA<NavigateToOTPScreenState>(),
      ],
    );
  });

  group('LoginBloc OTP Input and Verification', () {
    blocTest<LoginBloc, LoginState>(
      'should update OTP text in state',
      build: () => LoginBloc(localizations: l10n),
      act: (bloc) => bloc.add(PhoneOtpTextChangeEvent(phoneOtpText: '123456')),
      expect: () => [
        isA<LoginState>().having(
          (state) => state.phoneNumberLoginState?.phoneOTPText,
          'phoneOTPText',
          '123456',
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should set OTP error message',
      build: () => LoginBloc(localizations: l10n),
      act: (bloc) => bloc.add(PhoneOtpErrorEvent(errorMessage: 'Invalid OTP')),
      expect: () => [
        isA<LoginState>().having(
          (state) => state.phoneNumberLoginState?.phoneOTPErrorMessage,
          'phoneOTPErrorMessage',
          'Invalid OTP',
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should enable resend OTP functionality',
      build: () => LoginBloc(localizations: l10n),
      act: (bloc) =>
          bloc.add(IsResendOTPEnabledEvent(isResendOTPEnabled: true)),
      expect: () => [
        isA<LoginState>().having(
          (state) => state.phoneNumberLoginState?.isResendOTPEnabled,
          'isResendOTPEnabled',
          true,
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should update resend OTP timer countdown',
      build: () => LoginBloc(localizations: l10n),
      act: (bloc) => bloc.add(ResendOTPTimeLeftEvent(resentOTPTimeLeft: 45)),
      expect: () => [
        isA<LoginState>().having(
          (state) => state.phoneNumberLoginState?.resendOTPTimeLeft,
          'resendOTPTimeLeft',
          45,
        ),
      ],
    );
  });

  group('LoginBloc Email and Password Input', () {
    blocTest<LoginBloc, LoginState>(
      'should update email in state',
      build: () => LoginBloc(localizations: l10n),
      act: (bloc) => bloc.add(EmailChangeEvent(email: 'valid@example.com')),
      expect: () => [
        isA<LoginState>().having(
          (state) => state.emailPasswordLoginState?.email,
          'email',
          'valid@example.com',
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should set error when email is empty',
      build: () {
        when(() => l10n.email_cant_be_empty).thenReturn("Email can't be empty");
        return LoginBloc(localizations: l10n);
      },
      act: (bloc) {
        bloc.add(EmailChangeEvent(email: ''));
        bloc.add(EmailErrorEvent(errorMessage: l10n.email_cant_be_empty));
      },
      expect: () => [
        isA<LoginState>().having(
          (state) => state.emailPasswordLoginState?.email,
          'email',
          '',
        ),
        isA<LoginState>().having(
          (state) => state.emailPasswordLoginState?.emailErrorMessage,
          'emailErrorMessage',
          "Email can't be empty",
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should set error when email format is invalid',
      build: () {
        when(() => l10n.invalid_email).thenReturn('Invalid email');
        return LoginBloc(localizations: l10n);
      },
      act: (bloc) {
        bloc.add(EmailChangeEvent(email: 'foo@bar'));
        bloc.add(EmailErrorEvent(errorMessage: l10n.invalid_email));
      },
      expect: () => [
        isA<LoginState>().having(
          (state) => state.emailPasswordLoginState?.email,
          'email',
          'foo@bar',
        ),
        isA<LoginState>().having(
          (state) => state.emailPasswordLoginState?.emailErrorMessage,
          'emailErrorMessage',
          'Invalid email',
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should reset email state to initial values',
      build: () => LoginBloc(localizations: l10n),
      act: (bloc) => bloc.add(ResetEmailStateEvent()),
      expect: () => [
        isA<LoginState>().having(
          (state) => state.emailPasswordLoginState?.email,
          'email',
          '',
        ),
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          false,
        ),
        isA<ClearLoginWithEmailControllerState>(),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should update password in state',
      build: () => LoginBloc(localizations: l10n),
      act: (bloc) => bloc.add(PasswordChangeEvent(password: 'P@ssw0rd!')),
      expect: () => [
        isA<LoginState>().having(
          (state) => state.emailPasswordLoginState?.password,
          'password',
          'P@ssw0rd!',
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should set password error message',
      build: () => LoginBloc(localizations: l10n),
      act: (bloc) {
        bloc.add(PasswordChangeEvent(password: 'short'));
        bloc.add(PasswordErrorEvent(errorMessage: 'Password is too weak'));
      },
      expect: () => [
        isA<LoginState>().having(
          (state) => state.emailPasswordLoginState?.password,
          'password',
          'short',
        ),
        isA<LoginState>().having(
          (state) => state.emailPasswordLoginState?.passwordErrorMessage,
          'passwordErrorMessage',
          'Password is too weak',
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should toggle password visibility',
      build: () => LoginBloc(localizations: l10n),
      act: (bloc) => bloc.add(IsPasswordVisibleEvent(isPasswordVisible: true)),
      expect: () => [
        isA<LoginState>().having(
          (state) => state.emailPasswordLoginState?.isPasswordVisible,
          'isPasswordVisible',
          true,
        ),
      ],
    );
  });

  group('LoginBloc Email Authentication', () {
    blocTest<LoginBloc, LoginState>(
      'should emit AuthenticationExceptionState when credentials are invalid',
      build: () {
        mockAuthService.signInWithEmailShouldFail = true;
        mockAuthService.signInWithEmailError = 'Invalid email or password';
        return LoginBloc(localizations: l10n);
      },
      act: (bloc) {
        bloc.add(SelectLoginSignupTypeEvent(LoginType.EMAIL));
        bloc.add(EmailPasswordLoginEvent());
      },
      expect: () => [
        predicate<LoginState>(
          (state) => state.selectedLoginType == LoginType.EMAIL,
        ),
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          true,
        ),
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          false,
        ),
        isA<LoginState>().having(
          (state) => state.emailPasswordLoginState?.authenticationErrorMessage,
          'authenticationErrorMessage',
          'Invalid email or password',
        ),
        isA<AuthenticationExceptionState>(),
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          false,
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should send verification link and navigate when email is unverified',
      build: () {
        mockAuthService.signInWithEmailUserEmail = 'user@example.com';
        mockAuthService.signInWithEmailUserVerified = false;
        mockAuthService.sendVerificationShouldFail = false;
        return LoginBloc(localizations: l10n);
      },
      act: (bloc) {
        bloc.add(SelectLoginSignupTypeEvent(LoginType.EMAIL));
        bloc.add(EmailPasswordLoginEvent());
      },
      expect: () => [
        predicate<LoginState>(
          (state) => state.selectedLoginType == LoginType.EMAIL,
        ),
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          true,
        ),
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          false,
        ),
        isA<NavigateToEmailVerifyScreenState>(),
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          false,
        ),
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          true,
        ),
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          false,
        ),
        isA<RestartVerificationMailResendTimerState>(),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should emit AuthenticationExceptionState when verification link fails',
      build: () {
        mockAuthService.sendVerificationShouldFail = true;
        mockAuthService.sendVerificationError = 'Failed to send verification';
        return LoginBloc(localizations: l10n);
      },
      act: (bloc) => bloc.add(SendEmailVerificationLinkEvent()),
      expect: () => [
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          true,
        ),
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          false,
        ),
        isA<LoginState>().having(
          (state) => state.emailPasswordLoginState?.authenticationErrorMessage,
          'authenticationErrorMessage',
          'Failed to send verification',
        ),
        isA<AuthenticationExceptionState>(),
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          false,
        ),
        isA<RestartVerificationMailResendTimerState>(),
      ],
    );
  });

  group('LoginBloc Password Reset', () {
    blocTest<LoginBloc, LoginState>(
      'should emit ResetPasswordLinkSentState on successful reset',
      build: () {
        mockAuthService.resetPasswordShouldFail = false;
        return LoginBloc(localizations: l10n);
      },
      act: (bloc) => bloc.add(ForgotPasswordEvent()),
      expect: () => [
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          true,
        ),
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          false,
        ),
        isA<ResetPasswordLinkSentState>(),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should emit error and ResetPasswordLinkSentState when reset fails',
      build: () {
        mockAuthService.resetPasswordShouldFail = true;
        mockAuthService.resetPasswordError = 'Invalid email';
        return LoginBloc(localizations: l10n);
      },
      act: (bloc) => bloc.add(ForgotPasswordEvent()),
      expect: () => [
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          true,
        ),
        isA<LoginState>().having(
          (state) => state.emailPasswordLoginState?.emailErrorMessage,
          'emailErrorMessage',
          'Invalid email',
        ),
        isA<EmailLoginLoadingState>().having(
          (state) => state.isLoading,
          'isLoading',
          false,
        ),
        isA<ResetPasswordLinkSentState>(),
      ],
    );
  });

  group('LoginBloc SSO Authentication', () {
    blocTest<LoginBloc, LoginState>(
      'should emit AuthenticationExceptionState when Google sign-in fails',
      build: () {
        mockAuthService.loginWithGoogleShouldFail = true;
        mockAuthService.loginWithGoogleError = 'Google sign-in failed';
        return LoginBloc(localizations: l10n);
      },
      act: (bloc) {
        bloc.add(SelectLoginSignupTypeEvent(LoginType.GOOGLE));
        bloc.add(LoginWithGoogleEvent());
      },
      expect: () => [
        predicate<LoginState>(
          (state) => state.selectedLoginType == LoginType.GOOGLE,
        ),
        isA<LoginState>().having(
          (state) => state.emailPasswordLoginState?.authenticationErrorMessage,
          'authenticationErrorMessage',
          'Google sign-in failed',
        ),
        isA<AuthenticationExceptionState>(),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should emit AuthenticationExceptionState when Apple sign-in fails',
      build: () {
        mockAuthService.loginWithAppleShouldFail = true;
        mockAuthService.loginWithAppleError = 'Apple sign-in failed';
        return LoginBloc(localizations: l10n);
      },
      act: (bloc) {
        bloc.add(SelectLoginSignupTypeEvent(LoginType.APPLE));
        bloc.add(LoginWithAppleEvent());
      },
      expect: () => [
        predicate<LoginState>(
          (state) => state.selectedLoginType == LoginType.APPLE,
        ),
        isA<LoginState>().having(
          (state) => state.emailPasswordLoginState?.authenticationErrorMessage,
          'authenticationErrorMessage',
          'Apple sign-in failed',
        ),
        isA<AuthenticationExceptionState>(),
      ],
    );
  });
}
