import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/presentation/login/bloc/login_state.dart';
import 'package:skelter/presentation/login/enum/enum_login_type.dart';
import 'package:skelter/presentation/login/models/login_details.dart';
import 'package:skelter/presentation/signup/enum/user_details_input_status.dart';
import 'package:skelter/services/firebase_auth_services.dart';
import 'package:skelter/shared_pref/pref_keys.dart';
import 'package:skelter/shared_pref/prefs.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';
import 'package:skelter/validators/validators.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  static const kMinimumPasswordLength = 8;

  final FirebaseAuthService _firebaseAuthService = sl();
  final AppLocalizations localizations;

  LoginBloc({
    required this.localizations,
  }) : super(LoginState.initial()) {
    _setupEventListener();
  }

  void _setupEventListener() {
    on<EnableSignupModeEvent>(_onEnableSignupModeEvent);
    on<PhoneInputHasFocus>(_onUpdatePhoneInputHasFocusEvent);
    on<IsPhoneNumValidEvent>(_onUpdateIsPhoneNumValidEvent);
    on<CountryCodeChangeEvent>(_onUpdateCountryCodeChangeEvent);
    on<PhoneNumChangeEvent>(_onPhoneNumChangeEvent);
    on<NavigateToEmailVerifyScreenEvent>(_onNavigateToEmailVerifyScreenEvent);
    on<PhoneNumErrorEvent>(_onPhoneNumErrorEvent);
    on<PhoneOtpTextChangeEvent>(_onPhoneOtpTextChangeEvent);
    on<PhoneOtpErrorEvent>(_onPhoneOtpErrorEvent);
    on<IsResendOTPEnabledEvent>(_onIsResendOTPEnabledEvent);
    on<ResendOTPTimeLeftEvent>(_onResendOTPTimeLeftEvent);
    on<NavigateToOtpEvent>(_onNavigateToOtpEvent);
    on<FirebasePhoneLoginEvent>(_onFirebasePhoneLoginEvent);
    on<FirebaseOTPVerificationEvent>(_onFirebaseOTPVerificationEvent);
    on<FirebaseOTPAutoVerificationEvent>(
      _onFirebaseOTPAutoVerificationEvent,
    );
    on<NavigateToHomeScreenEvent>(_onNavigateToHomeScreenEvent);
    on<EmailChangeEvent>(_onEmailChangeEvent);
    on<EmailErrorEvent>(_onEmailErrorEvent);
    on<PasswordChangeEvent>(_onPasswordChangeEvent);
    on<PasswordErrorEvent>(_onPasswordErrorEvent);
    on<IsPasswordVisibleEvent>(_onIsPasswordVisibleEvent);
    on<EmailPasswordLoginEvent>(_onEmailPasswordLoginEvent);
    on<AuthenticationExceptionEvent>(_onAuthenticationExceptionEvent);
    on<CompleteOnboardingEvent>(_onCompleteOnboardingEvent);
    on<ForgotPasswordEvent>(_onForgotPasswordEvent);
    on<ResetPasswordLinkSentEvent>(_onResetPasswordLinkSentEvent);
    on<LoginWithGoogleEvent>(_onLoginWithGoogleSSOEvent);
    on<LoginWithAppleEvent>(_onLoginWithAppleSSOEvent);
    on<PhoneNumLoginLoadingEvent>(_onPhoneNumberLoadingEvent);
    on<EmailLoginLoadingEvent>(_onEmailLoginLoadingEvent);
    on<ResetEmailStateEvent>(_onResetEmailStateEvent);
    on<ResetPhoneNumberStateEvent>(_onResetPhoneNumberStateEvent);
    on<NavigateToVerifiedScreenEvent>(_onNavigateToVerifiedScreenEvent);

    on<SendEmailVerificationLinkEvent>(_onSendEmailVerificationLinkEvent);

    on<RestartVerificationMailResendTimerEvent>(
      _onRestartVerificationMailResendTimerEvent,
    );
    on<VerificationCodeFailedToSendEvent>(_onVerificationCodeFailedToSendEvent);
    on<LoginWithPhoneNumEvent>(_onLoginWithPhoneNumEvent);
    on<ChangeUserDetailsInputStatusEvent>(
      _onChangeUserDetailsInputStatusEvent,
    );
    on<SelectLoginSignupTypeEvent>(_onSelectLoginSignupTypeEvent);
  }

  void _onSelectLoginSignupTypeEvent(
    SelectLoginSignupTypeEvent event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(
        selectedLoginType: event.selectedType,
      ),
    );
  }

  void _onEnableSignupModeEvent(EnableSignupModeEvent event, Emitter emit) {
    emit(state.copyWith(isSignup: event.isSignup));
  }

  void _onUpdatePhoneInputHasFocusEvent(
    PhoneInputHasFocus event,
    Emitter emit,
  ) {
    final PhoneNumberLoginState phoneNumberLoginState =
        state.phoneNumberLoginState ?? PhoneNumberLoginState.initial();
    emit(
      state.copyWith(
        phoneNumberLoginState: phoneNumberLoginState.copyWith(
          phoneInputHasFocus: event.hasFocus,
        ),
      ),
    );
  }

  void _onUpdateIsPhoneNumValidEvent(
    IsPhoneNumValidEvent event,
    Emitter emit,
  ) {
    final PhoneNumberLoginState phoneNumberLoginState =
        state.phoneNumberLoginState ?? PhoneNumberLoginState.initial();
    emit(
      state.copyWith(
        phoneNumberLoginState: phoneNumberLoginState.copyWith(
          isPhoneNumValid: event.isValid,
        ),
      ),
    );
  }

  void _onUpdateCountryCodeChangeEvent(
    CountryCodeChangeEvent event,
    Emitter emit,
  ) {
    final PhoneNumberLoginState phoneNumberLoginState =
        state.phoneNumberLoginState ?? PhoneNumberLoginState.initial();
    emit(
      state.copyWith(
        phoneNumberLoginState: phoneNumberLoginState.copyWith(
          countryCode: event.countryCode,
        ),
      ),
    );
  }

  void _onPhoneNumChangeEvent(PhoneNumChangeEvent event, Emitter emit) {
    final PhoneNumberLoginState phoneNumberLoginState =
        state.phoneNumberLoginState ?? PhoneNumberLoginState.initial();
    emit(
      state.copyWith(
        phoneNumberLoginState: phoneNumberLoginState.copyWith(
          phoneNumber: event.phoneNumber,
        ),
      ),
    );
  }

  void _onPhoneNumErrorEvent(PhoneNumErrorEvent event, Emitter emit) {
    final PhoneNumberLoginState phoneNumberLoginState =
        state.phoneNumberLoginState ?? PhoneNumberLoginState.initial();
    emit(
      state.copyWith(
        phoneNumberLoginState: phoneNumberLoginState.copyWith(
          phoneNumErrorMessage: event.errorMessage,
        ),
      ),
    );
  }

  void _onPhoneOtpTextChangeEvent(
    PhoneOtpTextChangeEvent event,
    Emitter emit,
  ) {
    final PhoneNumberLoginState phoneNumberLoginState =
        state.phoneNumberLoginState ?? PhoneNumberLoginState.initial();
    emit(
      state.copyWith(
        phoneNumberLoginState: phoneNumberLoginState.copyWith(
          phoneOTPText: event.phoneOtpText,
        ),
      ),
    );
  }

  void _onPhoneOtpErrorEvent(PhoneOtpErrorEvent event, Emitter emit) {
    final PhoneNumberLoginState phoneNumberLoginState =
        state.phoneNumberLoginState ?? PhoneNumberLoginState.initial();
    emit(
      state.copyWith(
        phoneNumberLoginState: phoneNumberLoginState.copyWith(
          phoneOTPErrorMessage: event.errorMessage,
          canSetOTPErrorMessageToNull: true,
        ),
      ),
    );
  }

  void _onIsResendOTPEnabledEvent(
    IsResendOTPEnabledEvent event,
    Emitter emit,
  ) {
    final PhoneNumberLoginState phoneNumberLoginState =
        state.phoneNumberLoginState ?? PhoneNumberLoginState.initial();
    emit(
      state.copyWith(
        phoneNumberLoginState: phoneNumberLoginState.copyWith(
          isResendOTPEnabled: event.isResendOTPEnabled,
        ),
      ),
    );
  }

  void _onResendOTPTimeLeftEvent(
    ResendOTPTimeLeftEvent event,
    Emitter emit,
  ) {
    final PhoneNumberLoginState phoneNumberLoginState =
        state.phoneNumberLoginState ?? PhoneNumberLoginState.initial();
    emit(
      state.copyWith(
        phoneNumberLoginState: phoneNumberLoginState.copyWith(
          resendOTPTimeLeft: event.resentOTPTimeLeft,
        ),
      ),
    );
  }

  void _onNavigateToOtpEvent(
    NavigateToOtpEvent event,
    Emitter emit,
  ) {
    emit(
      NavigateToOTPScreenState(
        state,
        phoneOTPVerificationId: event.verificationId,
      ),
    );
  }

  void _onNavigateToHomeScreenEvent(
    NavigateToHomeScreenEvent event,
    Emitter emit,
  ) {
    emit(NavigateToHomeScreenState(state));
  }

  Future<void> _onFirebasePhoneLoginEvent(
    FirebasePhoneLoginEvent event,
    Emitter emit,
  ) async {
    await _firebaseVerifyAndOpenOtpScreenOnCodeSent(
      isFromVerificationScreen: event.isFromVerificationScreen,
    );
  }

  Future<void> _onFirebaseOTPVerificationEvent(
    FirebaseOTPVerificationEvent event,
    Emitter emit,
  ) async {
    await _firebaseOTPVerification();
  }

  void _onFirebaseOTPAutoVerificationEvent(
    FirebaseOTPAutoVerificationEvent event,
    Emitter emit,
  ) {
    final PhoneNumberLoginState phoneNumberLoginState =
        state.phoneNumberLoginState ?? PhoneNumberLoginState.initial();
    emit(FirebaseOTPAutoVerificationState(phoneNumberLoginState));
  }

  void _onEmailChangeEvent(EmailChangeEvent event, Emitter emit) {
    final EmailPasswordLoginState emailPasswordLoginState =
        state.emailPasswordLoginState ?? EmailPasswordLoginState.initial();
    emit(
      state.copyWith(
        emailPasswordLoginState: emailPasswordLoginState.copyWith(
          email: event.email,
        ),
      ),
    );
  }

  void _onEmailErrorEvent(EmailErrorEvent event, Emitter emit) {
    final EmailPasswordLoginState emailPasswordLoginState =
        state.emailPasswordLoginState ?? EmailPasswordLoginState.initial();
    emit(
      state.copyWith(
        emailPasswordLoginState: emailPasswordLoginState.copyWith(
          emailErrorMessage: event.errorMessage,
          canSetEmailErrorMessageToNull: true,
        ),
      ),
    );
  }

  void _onPasswordChangeEvent(PasswordChangeEvent event, Emitter emit) {
    final EmailPasswordLoginState emailPasswordLoginState =
        state.emailPasswordLoginState ?? EmailPasswordLoginState.initial();
    emit(
      state.copyWith(
        emailPasswordLoginState: emailPasswordLoginState.copyWith(
          password: event.password,
        ),
      ),
    );
  }

  void _onPasswordErrorEvent(PasswordErrorEvent event, Emitter emit) {
    final EmailPasswordLoginState emailPasswordLoginState =
        state.emailPasswordLoginState ?? EmailPasswordLoginState.initial();
    emit(
      state.copyWith(
        emailPasswordLoginState: emailPasswordLoginState.copyWith(
          passwordErrorMessage: event.errorMessage,
          canSetPasswordErrorMessageToNull: true,
        ),
      ),
    );
  }

  void _onIsPasswordVisibleEvent(IsPasswordVisibleEvent event, Emitter emit) {
    final EmailPasswordLoginState emailPasswordLoginState =
        state.emailPasswordLoginState ?? EmailPasswordLoginState.initial();
    emit(
      state.copyWith(
        emailPasswordLoginState: emailPasswordLoginState.copyWith(
          isPasswordVisible: event.isPasswordVisible,
        ),
      ),
    );
  }

  Future<void> _onEmailPasswordLoginEvent(
    EmailPasswordLoginEvent event,
    Emitter emit,
  ) async {
    await _loginUsingEmailAndPassword();
  }

  void _onAuthenticationExceptionEvent(
    AuthenticationExceptionEvent event,
    Emitter emit,
  ) {
    final EmailPasswordLoginState emailPasswordLoginState =
        state.emailPasswordLoginState ?? EmailPasswordLoginState.initial();
    emit(
      state.copyWith(
        emailPasswordLoginState: emailPasswordLoginState.copyWith(
          authenticationErrorMessage: event.errorMessage,
        ),
        isLoading: false,
      ),
    );
    emit(AuthenticationExceptionState(state));
  }

  Future<void> _onCompleteOnboardingEvent(
    CompleteOnboardingEvent event,
    Emitter emit,
  ) async {
    await Prefs.setBool(PrefKeys.kHasCompletedOnboarding, value: true);
    add(ChangeUserDetailsInputStatusEvent(UserDetailsInputStatus.done));
    add(NavigateToHomeScreenEvent());
  }

  Future<void> _onForgotPasswordEvent(
    ForgotPasswordEvent event,
    Emitter emit,
  ) async {
    await _sendPasswordResetLink();
  }

  void _onResetPasswordLinkSentEvent(
    ResetPasswordLinkSentEvent event,
    Emitter emit,
  ) {
    emit(ResetPasswordLinkSentState(state));
  }

  Future<void> _onLoginWithGoogleSSOEvent(
    LoginWithGoogleEvent event,
    Emitter emit,
  ) async {
    await _loginWithGoogle();
  }

  Future<void> _onLoginWithAppleSSOEvent(
    LoginWithAppleEvent event,
    Emitter emit,
  ) async {
    await _loginWithApple();
  }

  void _onPhoneNumberLoadingEvent(
    PhoneNumLoginLoadingEvent event,
    Emitter emit,
  ) {
    emit(PhoneNumLoginLoadingState(state, isLoading: event.isLoading));
  }

  void _onEmailLoginLoadingEvent(EmailLoginLoadingEvent event, Emitter emit) {
    emit(EmailLoginLoadingState(state, isLoading: event.isLoading));
  }

  void _onResetEmailStateEvent(ResetEmailStateEvent event, Emitter emit) {
    final EmailPasswordLoginState emailPasswordLoginState =
        EmailPasswordLoginState.initial();
    emit(
      state.copyWith(emailPasswordLoginState: emailPasswordLoginState),
    );
    emit(EmailLoginLoadingState(state, isLoading: false));
    emit(ClearLoginWithEmailControllerState(state));
  }

  void _onResetPhoneNumberStateEvent(
    ResetPhoneNumberStateEvent event,
    Emitter emit,
  ) {
    final PhoneNumberLoginState phoneNumberLoginState =
        PhoneNumberLoginState.initial();
    emit(
      state.copyWith(phoneNumberLoginState: phoneNumberLoginState),
    );
    emit(PhoneNumLoginLoadingState(state, isLoading: false));
  }

  void _onNavigateToVerifiedScreenEvent(
    NavigateToVerifiedScreenEvent event,
    Emitter emit,
  ) {
    emit(
      NavigateToVerifiedScreenState(
        state.copyWith(
          userDetailsInputStatus: UserDetailsInputStatus.inProgress,
        ),
      ),
    );
  }

  void _onSendEmailVerificationLinkEvent(
    SendEmailVerificationLinkEvent event,
    Emitter emit,
  ) async {
    add(EmailLoginLoadingEvent(isLoading: true));
    await _firebaseAuthService.sendVerificationEmail(
      onError: (errorMessage, {stackTrace}) {
        add(EmailLoginLoadingEvent(isLoading: false));
        add(AuthenticationExceptionEvent(errorMessage: errorMessage));
      },
    );
    add(EmailLoginLoadingEvent(isLoading: false));
    add(RestartVerificationMailResendTimerEvent());
  }

  void _onRestartVerificationMailResendTimerEvent(
    RestartVerificationMailResendTimerEvent event,
    Emitter emit,
  ) {
    emit(RestartVerificationMailResendTimerState(state));
  }

  void _onVerificationCodeFailedToSendEvent(
    VerificationCodeFailedToSendEvent event,
    Emitter emit,
  ) {
    emit(VerificationCodeFailedToSendState(state));
  }

  Future<void> _onLoginWithPhoneNumEvent(
    LoginWithPhoneNumEvent event,
    Emitter emit,
  ) async {
    add(PhoneNumLoginLoadingEvent(isLoading: true));
    final isPhoneNumValid = await isPhoneNumberValid(event.phoneNumberWithCode);

    if (!isPhoneNumValid) {
      final phoneNumberLoginState =
          state.phoneNumberLoginState ?? PhoneNumberLoginState.initial();

      emit(
        state.copyWith(
          phoneNumberLoginState: phoneNumberLoginState.copyWith(
            phoneNumErrorMessage: localizations.invalid_mobile_number,
          ),
        ),
      );
      add(PhoneNumLoginLoadingEvent(isLoading: false));
      return;
    }
    add(FirebasePhoneLoginEvent(isFromVerificationScreen: false));
  }

  void _onChangeUserDetailsInputStatusEvent(
    ChangeUserDetailsInputStatusEvent event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(userDetailsInputStatus: UserDetailsInputStatus.inProgress),
    );
  }

  void hideAllLoadingsAndShowError() {
    add(PhoneNumLoginLoadingEvent(isLoading: false));
    add(EmailLoginLoadingEvent(isLoading: false));
    add(
      AuthenticationExceptionEvent(
        errorMessage: localizations.opps_something_went_wrong,
      ),
    );
  }

  Future<void> _firebaseVerifyAndOpenOtpScreenOnCodeSent({
    required bool isFromVerificationScreen,
  }) async {
    add(PhoneNumLoginLoadingEvent(isLoading: !isFromVerificationScreen));

    await _firebaseAuthService.verifyFBAuthPhoneNumber(
      phoneNumber: state.phoneNumberLoginState?.phoneNumber ?? '',
      verificationCompleted: (credential) {
        debugPrint('Firebase Phone number verified ${credential.smsCode}');
      },
      codeSent: (verificationId) {
        add(PhoneNumLoginLoadingEvent(isLoading: false));
        if (!isFromVerificationScreen) {
          add(NavigateToOtpEvent(verificationId: verificationId));
        }
      },
      codeAutoRetrievalTimeout: (_) {},
      onError: (error, {stackTrace}) {
        add(PhoneNumErrorEvent(errorMessage: error));
        add(PhoneNumLoginLoadingEvent(isLoading: false));
      },
    );
  }

  Future<void> _firebaseOTPVerification() async {
    add(PhoneNumLoginLoadingEvent(isLoading: true));

    final credential = _firebaseAuthService.getPhoneAuthCredential(
      verificationId: state.phoneOTPVerificationId,
      smsCode: state.phoneNumberLoginState?.phoneOTPText ?? '',
    );

    final userCredential =
        await _firebaseAuthService.signInWithPhoneAuthCredential(
      credential,
      onError: (error, {stackTrace}) {
        add(PhoneNumLoginLoadingEvent(isLoading: false));
        add(PhoneOtpErrorEvent(errorMessage: error));
      },
    );

    if (userCredential != null && userCredential.user != null) {
      if (state.isSignup) {
        await _storeLoginDetailsInPrefs(userCredential.user!);
        add(NavigateToVerifiedScreenEvent());
      } else {
        await handleUserDetails(
          userCredential.user,
          onError: (error) {
            add(AuthenticationExceptionEvent(errorMessage: error));
          },
        );
      }
    }
    add(PhoneNumLoginLoadingEvent(isLoading: false));
  }

  Future<void> _loginUsingEmailAndPassword() async {
    add(EmailLoginLoadingEvent(isLoading: true));
    final email = state.emailPasswordLoginState?.email ?? '';
    final password = state.emailPasswordLoginState?.password ?? '';

    final userCredential =
        await _firebaseAuthService.signInWithEmailAndPassword(
      email,
      password,
      onError: (error, {stackTrace}) {
        add(EmailLoginLoadingEvent(isLoading: false));
        add(AuthenticationExceptionEvent(errorMessage: error));
      },
    );

    if (userCredential != null) {
      await handleUserDetails(
        userCredential.user,
        onError: (error) =>
            add(AuthenticationExceptionEvent(errorMessage: error)),
      );
    }
    add(EmailLoginLoadingEvent(isLoading: false));
  }

  Future<void> _loginWithGoogle() async {
    final userCredential = await _firebaseAuthService.loginWithGoogle(
      onError: (error, {stackTrace}) {
        add(AuthenticationExceptionEvent(errorMessage: error));
      },
    );

    if (userCredential != null) {
      await handleUserDetails(
        userCredential.user,
        onError: (error) =>
            add(AuthenticationExceptionEvent(errorMessage: error)),
      );
    }
  }

  Future<void> _loginWithApple() async {
    final userCredential = await _firebaseAuthService.loginWithApple(
      onError: (error, {stackTrace}) {
        add(AuthenticationExceptionEvent(errorMessage: error));
      },
    );
    if (userCredential != null) {
      await handleUserDetails(
        userCredential.user,
        onError: (error) =>
            add(AuthenticationExceptionEvent(errorMessage: error)),
      );
    }
  }

  Future<void> _sendPasswordResetLink() async {
    add(EmailLoginLoadingEvent(isLoading: true));
    await _firebaseAuthService.sendFBAuthPasswordResetEmail(
      state.emailPasswordLoginState?.email ?? '',
      onError: (error, {stackTrace}) =>
          add(EmailErrorEvent(errorMessage: error)),
    );
    add(EmailLoginLoadingEvent(isLoading: false));
    add(ResetPasswordLinkSentEvent());
  }

  Future<void> handleUserDetails(
    User? firebaseUser, {
    required Function(String) onError,
  }) async {
    final loginType = state.selectedLoginType;
    if (firebaseUser == null) {
      debugPrint('firebaseUser is null');
      onError('User information could not be retrieved.');
      return;
    }
    if (loginType == LoginType.PHONE) {
      if (firebaseUser.phoneNumber?.isNullOrEmpty() ?? true) {
        debugPrint('Authentication Current user phone number is null');

        onError('Error retrieving your phone number');
        return;
      }

      await _storeLoginDetailsInPrefs(firebaseUser);
      add(PhoneNumLoginLoadingEvent(isLoading: false));
      add(NavigateToHomeScreenEvent());
    } else if (loginType == LoginType.EMAIL) {
      if (firebaseUser.email.isNullOrEmpty()) {
        onError('Error retrieving your email');
        return;
      }
      add(EmailLoginLoadingEvent(isLoading: false));
      if (!firebaseUser.emailVerified) {
        add(SendEmailVerificationLinkEvent());
        add(NavigateToEmailVerifyScreenEvent());
        return;
      }

      await _storeLoginDetailsInPrefs(firebaseUser);
      add(NavigateToHomeScreenEvent());
    } else if (loginType == LoginType.GOOGLE) {
      await _storeLoginDetailsInPrefs(firebaseUser);
      add(NavigateToHomeScreenEvent());
    } else if (loginType == LoginType.APPLE) {
      await _storeLoginDetailsInPrefs(firebaseUser);
      add(NavigateToHomeScreenEvent());
    } else {
      debugPrint('Login/Signup type not specified');
      hideAllLoadingsAndShowError();
    }
  }

  Future<void> _storeLoginDetailsInPrefs(User firebaseUser) async {
    final loginDetails = LoginDetails(
      uid: firebaseUser.uid,
      token: await firebaseUser.getIdToken(),
      phoneNumber: firebaseUser.phoneNumber,
      email: firebaseUser.email,
    );
    await Prefs.setString(
      PrefKeys.kUserDetails,
      json.encode(loginDetails.toJson()),
    );
  }

  void _onNavigateToEmailVerifyScreenEvent(
    NavigateToEmailVerifyScreenEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(NavigateToEmailVerifyScreenState(state));
  }
}
