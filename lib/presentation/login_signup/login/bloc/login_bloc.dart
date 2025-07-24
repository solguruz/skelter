import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/enum_login_type.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/signup_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/models/login_details.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/services/firebase_auth_services.dart';
import 'package:flutter_skeleton/shared_pref/pref_keys.dart';
import 'package:flutter_skeleton/shared_pref/prefs.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';
import 'package:flutter_skeleton/validators/validators.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  static const kMinimumPasswordLength = 8;

  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final AppLocalizations localizations;

  LoginBloc({
    required this.localizations,
  }) : super(LoginState.initial()) {
    _initialiseFirebaseServices();
    _setupEventListener();
  }

  void _setupEventListener() {
    on<EnableSignupModeEvent>(_onEnableSignupModeEvent);
    on<PhoneInputHasFocus>(_onUpdatePhoneInputHasFocusEvent);
    on<IsPhoneNumValidEvent>(_onUpdateIsPhoneNumValidEvent);
    on<CountryCodeChangeEvent>(_onUpdateCountryCodeChangeEvent);
    on<PhoneNumChangeEvent>(_onPhoneNumChangeEvent);
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
    on<SSOLoginLoadingEvent>(_onSSOLoadingEvent);
    on<PhoneNumLoginLoadingEvent>(_onPhoneNumberLoadingEvent);
    on<EmailLoginLoadingEvent>(_onEmailLoginLoadingEvent);
    on<ResetEmailStateEvent>(_onResetEmailStateEvent);
    on<ResetPhoneNumberStateEvent>(_onResetPhoneNumberStateEvent);
    on<NavigateToVerifiedScreenEvent>(_onNavigateToVerifiedScreenEvent);
    on<HandleNameChangeEvent>(_onHandleNameChangeEvent);
    on<HandleNameErrorEvent>(_onHandleNameErrorEvent);
    on<NavigateToChooseHandleScreenEvent>(_onNavigateToChooseHandleScreenEvent);
    on<HandleNameStatusEvent>(_onHandleNameStatusEvent);
    on<HandleInputSuffixVisibilityEvent>(_onHandleInputSuffixVisibilityEvent);
    on<SignupLoadingEvent>(_onSignupLoadingEvent);
    on<SelectedProfilePictureEvent>(_onSelectedProfilePictureEvent);
    on<RemoveProfilePictureEvent>(_onRemoveProfilePictureEvent);
    on<ProfilePictureDoneToggleEvent>(_onProfilePictureDoneToggleEvent);
    on<FinishProfilePictureEvent>(_onFinishProfilePictureEvent);
    on<ResetSignUpStateOnScreenClosedEvent>(
      _resetSignUpStateOnScreenClosedEvent,
    );
    on<SelectLoginSignupTypeEvent>(_onSelectLoginSignupTypeEvent);
    on<SignupEmailChangeEvent>(_onSignupEmailChangeEvent);
    on<SignupEmailErrorEvent>(_onSignupEmailErrorEvent);
    on<SignupPasswordChangeEvent>(_onSignupPasswordChangeEvent);
    on<ConfirmPasswordChangeEvent>(_onConfirmPasswordChangeEvent);
    on<ConfirmPasswordErrorEvent>(_onConfirmPasswordErrorEvent);
    on<TogglePasswordVisibilityEvent>(_onTogglePasswordVisibilityEvent);
    on<ToggleConfirmPasswordVisibilityEvent>(
      _onToggleConfirmPasswordVisibilityEvent,
    );
    on<UpdatePasswordStrengthEvent>(_onUpdatePasswordStrengthEvent);
    on<SignupWithEmailEvent>(_onSignupWithEmailEvent);
    on<NavigateToEmailVerifyScreenEvent>(_onNavigateToEmailVerifyScreenState);
    on<SendEmailVerificationLinkEvent>(_onSendEmailVerificationLinkEvent);
    on<ResendVerificationEmailTimeLeftEvent>(
      _onResendVerificationEmailTimeLeftEvent,
    );
    on<RestartVerificationMailResendTimerEvent>(
      _onRestartVerificationMailResendTimerEvent,
    );
    on<VerificationCodeFailedToSendEvent>(_onVerificationCodeFailedToSendEvent);
    on<LoginWithPhoneNumEvent>(_onLoginWithPhoneNumEvent);
    on<CheckEmailAvailabilityEvent>(_onVerifyEmailAccountEvent);
    on<ChangeUserDetailsInputStatusEvent>(
      _onChangeUserDetailsInputStatusEvent,
    );
  }

  // region eventHandler

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
    // mainBloc.add(OnCompleteOnboardingEvent());
    add(SSOLoginLoadingEvent(isLoading: false));
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

  void _onSSOLoadingEvent(SSOLoginLoadingEvent event, Emitter emit) {
    emit(SSOLoginLoadingState(state, isLoading: event.isLoading));
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

  void _onHandleNameChangeEvent(
    HandleNameChangeEvent event,
    Emitter emit,
  ) {
    final SignUpState signUpState = state.signupState ?? SignUpState.initial();
    String? handleNameError;

    if (event.handleName.length >= 5) {
      add(HandleNameStatusEvent(status: HandleNameStatus.checking));
      // gqlBloc.add(CheckHandleEvent(event.handleName));
      add(HandleInputSuffixVisibilityEvent(showSuffix: true));
    } else if (event.handleName.isNotEmpty) {
      add(HandleNameStatusEvent(status: HandleNameStatus.unknown));
      add(HandleInputSuffixVisibilityEvent(showSuffix: true));
      handleNameError = localizations.login_signup_handle_name_length_error;
    } else {
      // remove error message if handle is empty
      add(HandleNameErrorEvent(errorMessage: ''));
      add(HandleInputSuffixVisibilityEvent(showSuffix: false));
    }
    emit(
      state.copyWith(
        signupState: signUpState.copyWith(
          handle: event.handleName,
          handleErrorMessage: handleNameError,
        ),
      ),
    );
  }

  void _onHandleNameErrorEvent(HandleNameErrorEvent event, Emitter emit) {
    final SignUpState signUpState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState: signUpState.copyWith(
          handleErrorMessage: event.errorMessage,
          canSetHandleErrorMessageToNull: true,
        ),
      ),
    );
  }

  void _onNavigateToChooseHandleScreenEvent(
    NavigateToChooseHandleScreenEvent event,
    Emitter emit,
  ) {
    emit(
      NavigateToChooseHandleState(
        state.copyWith(
          userDetailsInputStatus: UserDetailsInputStatus.inProgress,
        ),
      ),
    );
  }

  void _onHandleNameStatusEvent(
    HandleNameStatusEvent event,
    Emitter emit,
  ) {
    final SignUpState signUpState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState: signUpState.copyWith(handleNameStatus: event.status),
      ),
    );
  }

  void _onHandleInputSuffixVisibilityEvent(
    HandleInputSuffixVisibilityEvent event,
    Emitter emit,
  ) {
    final SignUpState signUpState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState:
            signUpState.copyWith(shouldShowHandleInputSuffix: event.showSuffix),
      ),
    );
  }

  void _onSignupLoadingEvent(SignupLoadingEvent event, Emitter emit) {
    emit(SignupLoadingState(state, isLoading: event.isLoading));
  }

  void _onSelectedProfilePictureEvent(
    SelectedProfilePictureEvent event,
    Emitter emit,
  ) {
    final SignUpState signUpState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState: signUpState.copyWith(selectedProfilePicture: event.image),
      ),
    );
  }

  void _onRemoveProfilePictureEvent(
    RemoveProfilePictureEvent event,
    Emitter emit,
  ) {
    final SignUpState signUpState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState: signUpState.copyWith(canSetProfilePictureToNull: true),
      ),
    );
  }

  void _onProfilePictureDoneToggleEvent(
    ProfilePictureDoneToggleEvent event,
    Emitter emit,
  ) {
    final SignUpState signUpState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState:
            signUpState.copyWith(isDoneProfilePicEditing: event.isDoneEditing),
      ),
    );
  }

  void _onFinishProfilePictureEvent(
    FinishProfilePictureEvent event,
    Emitter emit,
  ) {
    _proceedSignUpDetailsUpload();
  }

  void _resetSignUpStateOnScreenClosedEvent(
    ResetSignUpStateOnScreenClosedEvent event,
    Emitter emit,
  ) {
    // If we are in the process of completing the user details,
    // we don’t want to reset the signup state on page closed.
    if (state.userDetailsInputStatus != UserDetailsInputStatus.inProgress) {
      emit(state.copyWith(signupState: SignUpState.initial()));
    }
    emit(EmailLoginLoadingState(state, isLoading: false));
  }

  void _onSelectLoginSignupTypeEvent(
    SelectLoginSignupTypeEvent event,
    Emitter emit,
  ) {
    final SignUpState signUpState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState: signUpState.copyWith(
          selectedLoginSignupType: event.selectedType,
        ),
      ),
    );
  }

  void _onSignupEmailChangeEvent(SignupEmailChangeEvent event, Emitter emit) {
    final SignUpState signUpState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState: signUpState.copyWith(email: event.email),
      ),
    );
  }

  void _onSignupEmailErrorEvent(SignupEmailErrorEvent event, Emitter emit) {
    final SignUpState signupState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState: signupState.copyWith(
          emailErrorMessage: event.errorMessage,
          canSetEmailErrorMessageToNull: true,
        ),
      ),
    );
  }

  void _onSignupPasswordChangeEvent(
    SignupPasswordChangeEvent event,
    Emitter emit,
  ) {
    final password = event.password;
    final bool isLongEnough = password.length >= kMinimumPasswordLength;
    final bool hasLetterAndNumber = password.hasLetterAndNumber();
    final bool hasSpecialCharacter = password.hasSpecialCharacter();
    final int passedCriteria = (isLongEnough ? 1 : 0) +
        (hasLetterAndNumber ? 1 : 0) +
        (hasSpecialCharacter ? 1 : 0);

    final SignUpState signUpState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState: signUpState.copyWith(
          password: event.password,
          passwordStrengthLevel: passedCriteria,
          isPasswordLongEnough: isLongEnough,
          hasLetterAndNumberInPassword: hasLetterAndNumber,
          hasSpecialCharacterInPassword: hasSpecialCharacter,
        ),
      ),
    );
  }

  void _onConfirmPasswordChangeEvent(
    ConfirmPasswordChangeEvent event,
    Emitter emit,
  ) {
    final SignUpState signUpState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState:
            signUpState.copyWith(confirmPassword: event.confirmPassword),
      ),
    );
  }

  void _onConfirmPasswordErrorEvent(
    ConfirmPasswordErrorEvent event,
    Emitter emit,
  ) {
    final SignUpState signupState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState: signupState.copyWith(
          confirmPasswordErrorMessage: event.errorMessage,
          canSetEmailErrorMessageToNull: true,
        ),
      ),
    );
  }

  void _onTogglePasswordVisibilityEvent(
    TogglePasswordVisibilityEvent event,
    Emitter emit,
  ) {
    final SignUpState signupState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState: signupState.copyWith(
          isPasswordVisible: event.isVisible,
        ),
      ),
    );
  }

  void _onToggleConfirmPasswordVisibilityEvent(
    ToggleConfirmPasswordVisibilityEvent event,
    Emitter emit,
  ) {
    final SignUpState signupState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState: signupState.copyWith(
          isConfirmPasswordVisible: event.isVisible,
        ),
      ),
    );
  }

  void _onUpdatePasswordStrengthEvent(
    UpdatePasswordStrengthEvent event,
    Emitter emit,
  ) {
    final SignUpState signupState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState: signupState.copyWith(
          passwordStrengthLevel: event.passwordStrengthLevel,
        ),
      ),
    );
  }

  void _onSignupWithEmailEvent(
    SignupWithEmailEvent event,
    Emitter emit,
  ) {
    final String? password = state.signupState?.password;
    final String? confirmPassword = state.signupState?.confirmPassword;
    if (confirmPassword == null || confirmPassword.isEmpty) {
      add(
        ConfirmPasswordErrorEvent(
          errorMessage: localizations.login_signup_error_enter_confirm_password,
        ),
      );
      return;
    } else if (password != confirmPassword) {
      add(
        ConfirmPasswordErrorEvent(
          errorMessage: localizations.login_signup_passwords_do_not_match,
        ),
      );
      return;
    }
    _signupWithEmailAndPassword();
  }

  void _onNavigateToEmailVerifyScreenState(
    NavigateToEmailVerifyScreenEvent event,
    Emitter emit,
  ) {
    emit(NavigateToEmailVerifyScreenState(state));
  }

  void _onSendEmailVerificationLinkEvent(
    SendEmailVerificationLinkEvent event,
    Emitter emit,
  ) async {
    add(EmailLoginLoadingEvent(isLoading: true));
    // await gqlBloc.add(RequestVerificationEmailEvent());
    add(RestartVerificationMailResendTimerEvent());
  }

  void _onResendVerificationEmailTimeLeftEvent(
    ResendVerificationEmailTimeLeftEvent event,
    Emitter emit,
  ) {
    final SignUpState signupState = state.signupState ?? SignUpState.initial();
    emit(
      state.copyWith(
        signupState: signupState.copyWith(
          resendVerificationEmailTimeLeft: event.resendTimeLeft,
        ),
      ),
    );
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
            phoneNumErrorMessage:
                localizations.login_signup_invalid_mobile_number,
          ),
        ),
      );
      add(PhoneNumLoginLoadingEvent(isLoading: false));
      return;
    }
    add(FirebasePhoneLoginEvent(isFromVerificationScreen: false));
  }

  void _onVerifyEmailAccountEvent(
    CheckEmailAvailabilityEvent event,
    Emitter emit,
  ) {
    emit(SignupLoadingState(state, isLoading: true));
    // gqlBloc.add(CheckEmailEvent(event.email));
  }

  void _onChangeUserDetailsInputStatusEvent(
    ChangeUserDetailsInputStatusEvent event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(userDetailsInputStatus: UserDetailsInputStatus.inProgress),
    );
  }

  /* void _onRequestVerificationEmailState(RequestVerificationEmailState s) {
    add(EmailLoginLoadingEvent(isLoading: false));
    if (s.message.haveContent()) {
      add(
        AuthenticationExceptionEvent(
          errorMessage: s.message ?? kSomethingWentWrong,
        ),
      );
      add(VerificationCodeFailedToSendEvent());
    }
  }

  void _onCheckEmailResult(CheckEmailResult gqlState) {
    emit(SignupLoadingState(state, isLoading: false));
    if (gqlState.doesExist) {
      add(
        SignupEmailErrorEvent(
          errorMessage: localizations.login_signup_email_already_in_use,
        ),
      );
      return;
    }
    emit(NavigateToCreatePasswordState(state));
  }*/

  void _proceedSignUpDetailsUpload() async {
    final User? firebaseCurrentUser = FirebaseAuth.instance.currentUser;
    if (firebaseCurrentUser == null) {
      debugPrint('Firebase current user == null');

      add(AuthenticationExceptionEvent(errorMessage: kSomethingWentWrong));
      return;
    }
    final String? token =
        await FirebaseAuth.instance.currentUser!.getIdToken(true);
    if (token == null) {
      debugPrint('token == null');
      hideAllLoadingsAndShowError();
      return;
    }
    switch (state.signupState?.selectedLoginSignupType) {
      case LoginType.PHONE:
        await _performSignupWithPhone(firebaseCurrentUser, token);
      case LoginType.EMAIL:
      case LoginType.GOOGLE:
      case LoginType.APPLE:
        await _performSignupWithEmailOrSSO(firebaseCurrentUser, token);
      default:
        debugPrint('Signup type not specified');
        hideAllLoadingsAndShowError();
    }
  }

  Future<void> _performSignupWithPhone(
    User firebaseCurrentUser,
    String token,
  ) async {
    add(PhoneNumLoginLoadingEvent(isLoading: true));
    final String? phoneNumber = firebaseCurrentUser.phoneNumber;
    if (phoneNumber == null) {
      debugPrint('Firebase current user phone number == null');

      add(PhoneNumLoginLoadingEvent(isLoading: false));
      add(AuthenticationExceptionEvent(errorMessage: kSomethingWentWrong));
      return;
    }
  }

  Future<void> _performSignupWithEmailOrSSO(
    User firebaseCurrentUser,
    String token,
  ) async {
    add(EmailLoginLoadingEvent(isLoading: true));
    if (firebaseCurrentUser.email == null) {
      debugPrint('Firebase current user email == null');

      add(EmailLoginLoadingEvent(isLoading: false));
      add(AuthenticationExceptionEvent(errorMessage: kSomethingWentWrong));
      return;
    }
    // final String fullName = (firebaseCurrentUser.displayName.haveContent()
    //         ? firebaseCurrentUser.displayName
    //         : state.signupState?.handle) ??
    //     '';
  }

  void hideAllLoadingsAndShowError() {
    add(PhoneNumLoginLoadingEvent(isLoading: false));
    add(EmailLoginLoadingEvent(isLoading: false));
    add(SSOLoginLoadingEvent(isLoading: false));
    add(AuthenticationExceptionEvent(errorMessage: kSomethingWentWrong));
  }

  // endregion

  // region Firebase methods
  void _initialiseFirebaseServices() {
    FirebaseAuthService().init();
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

    if (userCredential != null) {
      if (state.isSignup) {
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
    add(SSOLoginLoadingEvent(isLoading: true));

    final userCredential = await _firebaseAuthService.loginWithGoogle(
      onError: (error, {stackTrace}) {
        add(AuthenticationExceptionEvent(errorMessage: error));
      },
    );

    if (userCredential != null) {
      if (state.isSignup) {
        add(NavigateToChooseHandleScreenEvent());
      } else {
        await handleUserDetails(
          userCredential.user,
          onError: (error) =>
              add(AuthenticationExceptionEvent(errorMessage: error)),
        );
      }
    }

    add(SSOLoginLoadingEvent(isLoading: false));
  }

  Future<void> _loginWithApple() async {
    add(SSOLoginLoadingEvent(isLoading: true));

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
    add(SSOLoginLoadingEvent(isLoading: false));
  }

  Future<void> _signupWithEmailAndPassword() async {
    add(EmailLoginLoadingEvent(isLoading: true));
    final email = state.signupState?.email ?? '';
    final password = state.signupState?.password ?? '';

    final userCredential =
        await _firebaseAuthService.signupWithEmailAndPassword(
      email,
      password,
      onError: (error, {stackTrace}) {
        add(EmailLoginLoadingEvent(isLoading: false));
        add(AuthenticationExceptionEvent(errorMessage: error));
      },
    );

    if (userCredential != null) {
      add(SendEmailVerificationLinkEvent());
    } else {
      debugPrint('signup with Email/Password userCredential is null');
      return;
    }
    add(EmailLoginLoadingEvent(isLoading: false));
    add(NavigateToEmailVerifyScreenEvent());
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
    final loginType = state.signupState?.selectedLoginSignupType;
    if (firebaseUser == null) {
      debugPrint('firebaseUser is null');
      onError('User information could not be retrieved.');
      return;
    }
    if (loginType == LoginType.PHONE) {
      if (firebaseUser.phoneNumber.isNullOrEmpty()) {
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
      // TODO:
      // if (!isEmailVerified() &&
      //     getVerifiedEmail() == null) {
      //   add(NavigateToEmailVerifyScreenEvent());
      //   add(SendEmailVerificationLinkEvent());
      //   return;
      // }
      // await _addAuthEventInGQLBloc(firebaseUser, token);
    } else if (loginType == LoginType.GOOGLE) {
      // await _addAuthEventInGQLBloc(firebaseUser, token);
    } else if (loginType == LoginType.APPLE) {
      // await _addAuthEventInGQLBloc(firebaseUser, token);
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
// endregion
}
