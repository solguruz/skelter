import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/presentation/login/enum/enum_login_type.dart';
import 'package:skelter/presentation/login/models/login_details.dart';
import 'package:skelter/presentation/signup/bloc/signup_event.dart';
import 'package:skelter/presentation/signup/bloc/signup_state.dart';
import 'package:skelter/presentation/signup/enum/user_details_input_status.dart';
import 'package:skelter/services/firebase_auth_services.dart';
import 'package:skelter/shared_pref/pref_keys.dart';
import 'package:skelter/shared_pref/prefs.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  static const kMinimumPasswordLength = 8;

  final FirebaseAuthService _firebaseAuthService = sl();
  final AppLocalizations localizations;

  SignupBloc({
    required this.localizations,
  }) : super(SignupState.initial()) {
    _setupEventListener();
  }

  void _setupEventListener() {
    on<SelectedProfilePictureEvent>(_onSelectedProfilePictureEvent);
    on<RemoveProfilePictureEvent>(_onRemoveProfilePictureEvent);
    on<ProfilePictureDoneToggleEvent>(_onProfilePictureDoneToggleEvent);
    on<ResetSignUpStateOnScreenClosedEvent>(
      _resetSignUpStateOnScreenClosedEvent,
    );
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
    on<ResendVerificationEmailTimeLeftEvent>(
      _onResendVerificationEmailTimeLeftEvent,
    );
    on<FinishProfilePictureEvent>(_onFinishProfilePictureEvent);
    on<AuthenticationExceptionEvent>(_onAuthenticationExceptionEvent);

    on<EmailSignUpLoadingEvent>(_onEmailSignUpLoadingEvent);
    on<CheckEmailAvailabilityEvent>(_onVerifyEmailAccountEvent);
    on<ResetPasswordStateEvent>(_onResetPasswordStateEvent);
    on<ChangeUserDetailsInputStatusEvent>(
      _onChangeUserDetailsInputStatusEvent,
    );
    on<SendEmailVerificationLinkEvent>(_onSendEmailVerificationLinkEvent);
    on<RestartVerificationMailResendTimerEvent>(
      _onRestartVerificationMailResendTimerEvent,
    );
    on<NavigateToEmailVerifyScreenEvent>(_onNavigateToEmailVerifyScreenEvent);
  }

  void _onChangeUserDetailsInputStatusEvent(
    ChangeUserDetailsInputStatusEvent event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(userDetailsInputStatus: UserDetailsInputStatus.inProgress),
    );
  }

  void _onResetPasswordStateEvent(ResetPasswordStateEvent event, Emitter emit) {
    emit(
      state.copyWith(
        password: '',
        confirmPassword: '',
        isPasswordVisible: false,
        isConfirmPasswordVisible: false,
        passwordStrengthLevel: 0,
        isPasswordLongEnough: false,
        hasLetterAndNumberInPassword: false,
        hasSpecialCharacterInPassword: false,
      ),
    );
  }

  void _onVerifyEmailAccountEvent(
    CheckEmailAvailabilityEvent event,
    Emitter emit,
  ) {
    emit(SignupLoadingState(state, isLoading: false));
    emit(NavigateToCreatePasswordState(state));
  }

  void _onSelectedProfilePictureEvent(
    SelectedProfilePictureEvent event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(selectedProfilePicture: event.image),
    );
  }

  void _onRemoveProfilePictureEvent(
    RemoveProfilePictureEvent event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(canSetProfilePictureToNull: true),
    );
  }

  void _onProfilePictureDoneToggleEvent(
    ProfilePictureDoneToggleEvent event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(isDoneProfilePicEditing: event.isDoneEditing),
    );
  }

  void _resetSignUpStateOnScreenClosedEvent(
    ResetSignUpStateOnScreenClosedEvent event,
    Emitter emit,
  ) {
    // If we are in the process of completing the user details,
    // we don’t want to reset the signup state on page closed.
    if (state.userDetailsInputStatus != UserDetailsInputStatus.inProgress) {
      emit(SignupState.initial());
    }
  }

  void _onSignupEmailChangeEvent(SignupEmailChangeEvent event, Emitter emit) {
    emit(
      state.copyWith(email: event.email),
    );
  }

  void _onSignupEmailErrorEvent(SignupEmailErrorEvent event, Emitter emit) {
    emit(
      state.copyWith(
        emailErrorMessage: event.errorMessage,
        canSetEmailErrorMessageToNull: true,
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

    emit(
      state.copyWith(
        password: event.password,
        passwordStrengthLevel: passedCriteria,
        isPasswordLongEnough: isLongEnough,
        hasLetterAndNumberInPassword: hasLetterAndNumber,
        hasSpecialCharacterInPassword: hasSpecialCharacter,
      ),
    );
  }

  void _onConfirmPasswordChangeEvent(
    ConfirmPasswordChangeEvent event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(confirmPassword: event.confirmPassword),
    );
  }

  void _onConfirmPasswordErrorEvent(
    ConfirmPasswordErrorEvent event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(
        confirmPasswordErrorMessage: event.errorMessage,
        canSetEmailErrorMessageToNull: true,
      ),
    );
  }

  void _onTogglePasswordVisibilityEvent(
    TogglePasswordVisibilityEvent event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(
        isPasswordVisible: event.isVisible,
      ),
    );
  }

  void _onToggleConfirmPasswordVisibilityEvent(
    ToggleConfirmPasswordVisibilityEvent event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(
        isConfirmPasswordVisible: event.isVisible,
      ),
    );
  }

  void _onUpdatePasswordStrengthEvent(
    UpdatePasswordStrengthEvent event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(
        passwordStrengthLevel: event.passwordStrengthLevel,
      ),
    );
  }

  void _onSignupWithEmailEvent(
    SignupWithEmailEvent event,
    Emitter emit,
  ) {
    final String password = state.password;
    final String confirmPassword = state.confirmPassword;
    if (confirmPassword.isEmpty) {
      add(
        ConfirmPasswordErrorEvent(
          errorMessage: localizations.signup_error_enter_confirm_password,
        ),
      );
      return;
    } else if (password != confirmPassword) {
      add(
        ConfirmPasswordErrorEvent(
          errorMessage: localizations.signup_passwords_do_not_match,
        ),
      );
      return;
    }
    _signupWithEmailAndPassword();
  }

  void _onResendVerificationEmailTimeLeftEvent(
    ResendVerificationEmailTimeLeftEvent event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(
        resendVerificationEmailTimeLeft: event.resendTimeLeft,
      ),
    );
  }

  void _onFinishProfilePictureEvent(
    FinishProfilePictureEvent event,
    Emitter emit,
  ) {
    _proceedSignUpDetailsUpload();
  }

  void _onAuthenticationExceptionEvent(
    AuthenticationExceptionEvent event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(
        authenticationErrorMessage: event.errorMessage,
        isLoading: false,
      ),
    );
    emit(AuthenticationExceptionState(state));
  }

  void _onEmailSignUpLoadingEvent(EmailSignUpLoadingEvent event, Emitter emit) {
    emit(
      EmailSignUpLoadingState(
        state,
        isLoading: event.isLoading,
      ),
    );
  }

  void _proceedSignUpDetailsUpload() async {
    final User? firebaseCurrentUser = FirebaseAuth.instance.currentUser;
    if (firebaseCurrentUser == null) {
      debugPrint('Firebase current user == null');

      add(
        AuthenticationExceptionEvent(
          errorMessage: localizations.opps_something_went_wrong,
        ),
      );
      return;
    }
    final String? token =
        await FirebaseAuth.instance.currentUser!.getIdToken(true);
    if (token == null) {
      debugPrint('token == null');
      hideAllLoadingsAndShowError();
      return;
    }
    switch (state.selectedLoginSignupType) {
      case LoginType.PHONE:
        await _performSignupWithPhone(firebaseCurrentUser, token);
      case LoginType.EMAIL:
      case LoginType.GOOGLE:
      case LoginType.APPLE:
        await _performSignupWithEmailOrSSO(firebaseCurrentUser, token);
    }
  }

  Future<void> _performSignupWithPhone(
    User firebaseCurrentUser,
    String token,
  ) async {
    add(PhoneNumSignUpLoadingEvent(isLoading: true));
    final String? phoneNumber = firebaseCurrentUser.phoneNumber;
    if (phoneNumber == null) {
      debugPrint('Firebase current user phone number == null');

      add(PhoneNumSignUpLoadingEvent(isLoading: false));
      add(
        AuthenticationExceptionEvent(
          errorMessage: localizations.opps_something_went_wrong,
        ),
      );
      return;
    }
  }

  Future<void> _performSignupWithEmailOrSSO(
    User firebaseCurrentUser,
    String token,
  ) async {
    add(EmailSignUpLoadingEvent(isLoading: true));
    if (firebaseCurrentUser.email == null) {
      debugPrint('Firebase current user email == null');

      add(EmailSignUpLoadingEvent(isLoading: false));
      add(
        AuthenticationExceptionEvent(
          errorMessage: localizations.opps_something_went_wrong,
        ),
      );
      return;
    }
  }

  Future<void> _signupWithEmailAndPassword() async {
    add(EmailSignUpLoadingEvent(isLoading: true));
    final email = state.email;
    final password = state.password;

    final userCredential =
        await _firebaseAuthService.signupWithEmailAndPassword(
      email,
      password,
      onError: (error, {stackTrace}) {
        add(EmailSignUpLoadingEvent(isLoading: false));
        add(AuthenticationExceptionEvent(errorMessage: error));
      },
    );

    if (userCredential != null) {
      add(SendEmailVerificationLinkEvent());
    } else {
      debugPrint('signup with Email/Password userCredential is null');
      return;
    }
    add(NavigateToEmailVerifyScreenEvent());
    add(EmailSignUpLoadingEvent(isLoading: false));
  }

  Future<void> handleUserDetails(
    User? firebaseUser, {
    required Function(String) onError,
  }) async {
    final loginType = state.selectedLoginSignupType;
    if (firebaseUser == null) {
      debugPrint('firebaseUser is null');
      onError(localizations.signup_user_info_not_retrieved);
      return;
    }
    if (loginType == LoginType.PHONE) {
      if (firebaseUser.phoneNumber.isNullOrEmpty()) {
        debugPrint('Authentication Current user phone number is null');

        onError(localizations.signup_error_retrieving_phone_number);
        return;
      }

      await _storeLoginDetailsInPrefs(firebaseUser);
      add(PhoneNumSignUpLoadingEvent(isLoading: false));
      add(NavigateToHomeScreenEvent());
    } else if (loginType == LoginType.EMAIL) {
      if (firebaseUser.email.isNullOrEmpty()) {
        onError(localizations.signup_error_retrieving_email);
        return;
      }
    } else if (loginType == LoginType.GOOGLE) {
    } else if (loginType == LoginType.APPLE) {
    } else {
      debugPrint('Login/Signup type not specified');
      hideAllLoadingsAndShowError();
    }
  }

  void hideAllLoadingsAndShowError() {
    add(
      AuthenticationExceptionEvent(
        errorMessage: localizations.opps_something_went_wrong,
      ),
    );
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

  FutureOr<void> _onSendEmailVerificationLinkEvent(
    event,
    Emitter<SignupState> emit,
  ) async {
    add(EmailSignUpLoadingEvent(isLoading: true));
    await _firebaseAuthService.sendVerificationEmail(
      onError: (errorMessage, {stackTrace}) {
        add(EmailSignUpLoadingEvent(isLoading: false));
        add(AuthenticationExceptionEvent(errorMessage: errorMessage));
      },
    );
    add(EmailSignUpLoadingEvent(isLoading: false));
    add(RestartVerificationMailResendTimerEvent());
  }

  FutureOr<void> _onRestartVerificationMailResendTimerEvent(
    RestartVerificationMailResendTimerEvent event,
    Emitter<SignupState> emit,
  ) {
    emit(RestartVerificationMailResendTimerState(state));
  }

  FutureOr<void> _onNavigateToEmailVerifyScreenEvent(
    NavigateToEmailVerifyScreenEvent event,
    Emitter<SignupState> emit,
  ) {
    emit(NavigateToEmailVerifyScreenState(state));
  }
}
