import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:skelter/presentation/login/enum/enum_login_type.dart';
import 'package:skelter/presentation/signup/enum/user_details_input_status.dart';
import 'package:skelter/presentation/verify_email/screens/verify_email_screen.dart';

class SignupState with EquatableMixin {
  final String handle;
  final String? handleErrorMessage;
  final HandleNameStatus handleNameStatus;
  final bool shouldShowHandleInputSuffix;
  final bool isDoneProfilePicEditing;
  final bool isLoading;
  final File? selectedProfilePicture;
  final LoginType selectedLoginSignupType;
  final String email;
  final String password;
  final String confirmPassword;
  final String? confirmPasswordErrorMessage;
  final String? emailErrorMessage;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final int passwordStrengthLevel;
  final bool isPasswordLongEnough;
  final bool hasLetterAndNumberInPassword;
  final bool hasSpecialCharacterInPassword;
  final int resendVerificationEmailTimeLeft;
  final UserDetailsInputStatus userDetailsInputStatus;
  final String authenticationErrorMessage;

  SignupState({
    required this.handle,
    required this.handleErrorMessage,
    required this.handleNameStatus,
    required this.shouldShowHandleInputSuffix,
    required this.isDoneProfilePicEditing,
    required this.isLoading,
    required this.selectedProfilePicture,
    required this.selectedLoginSignupType,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.confirmPasswordErrorMessage,
    required this.emailErrorMessage,
    required this.isPasswordVisible,
    required this.isConfirmPasswordVisible,
    required this.passwordStrengthLevel,
    required this.isPasswordLongEnough,
    required this.hasLetterAndNumberInPassword,
    required this.hasSpecialCharacterInPassword,
    required this.resendVerificationEmailTimeLeft,
    required this.userDetailsInputStatus,
    required this.authenticationErrorMessage,
  });

  factory SignupState.initial() {
    return SignupState(
      handle: '',
      handleErrorMessage: null,
      handleNameStatus: HandleNameStatus.unknown,
      shouldShowHandleInputSuffix: false,
      isDoneProfilePicEditing: false,
      isLoading: false,
      selectedProfilePicture: null,
      selectedLoginSignupType: LoginType.PHONE,
      email: '',
      password: '',
      confirmPassword: '',
      confirmPasswordErrorMessage: null,
      emailErrorMessage: null,
      isPasswordVisible: false,
      isConfirmPasswordVisible: false,
      passwordStrengthLevel: 0,
      isPasswordLongEnough: false,
      hasLetterAndNumberInPassword: false,
      hasSpecialCharacterInPassword: false,
      resendVerificationEmailTimeLeft:
          VerifyEmailScreen.kResendVerificationEmailMaxSeconds,
      userDetailsInputStatus: UserDetailsInputStatus.none,
      authenticationErrorMessage: '',
    );
  }

  SignupState.copy(SignupState state)
      : this(
          handle: state.handle,
          handleErrorMessage: state.handleErrorMessage,
          handleNameStatus: state.handleNameStatus,
          shouldShowHandleInputSuffix: state.shouldShowHandleInputSuffix,
          isLoading: state.isLoading,
          isDoneProfilePicEditing: state.isDoneProfilePicEditing,
          selectedProfilePicture: state.selectedProfilePicture,
          selectedLoginSignupType: state.selectedLoginSignupType,
          email: state.email,
          password: state.password,
          confirmPassword: state.confirmPassword,
          confirmPasswordErrorMessage: state.confirmPasswordErrorMessage,
          emailErrorMessage: state.emailErrorMessage,
          isPasswordVisible: state.isPasswordVisible,
          isConfirmPasswordVisible: state.isConfirmPasswordVisible,
          passwordStrengthLevel: state.passwordStrengthLevel,
          isPasswordLongEnough: state.isPasswordLongEnough,
          hasLetterAndNumberInPassword: state.hasLetterAndNumberInPassword,
          hasSpecialCharacterInPassword: state.hasSpecialCharacterInPassword,
          resendVerificationEmailTimeLeft:
              state.resendVerificationEmailTimeLeft,
          userDetailsInputStatus: state.userDetailsInputStatus,
          authenticationErrorMessage: state.authenticationErrorMessage,
        );

  SignupState copyWith({
    String? handle,
    String? handleErrorMessage,
    HandleNameStatus? handleNameStatus,
    bool canSetHandleErrorMessageToNull = false,
    bool? shouldShowHandleInputSuffix,
    bool? isDoneProfilePicEditing,
    bool? isLoading,
    File? selectedProfilePicture,
    bool canSetProfilePictureToNull = false,
    LoginType? selectedLoginSignupType,
    String? email,
    String? password,
    String? confirmPassword,
    String? confirmPasswordErrorMessage,
    String? emailErrorMessage,
    bool canSetEmailErrorMessageToNull = false,
    bool canSetConfirmPasswordMessageToNull = false,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    int? passwordStrengthLevel,
    bool? isPasswordLongEnough,
    bool? hasLetterAndNumberInPassword,
    bool? hasSpecialCharacterInPassword,
    int? resendVerificationEmailTimeLeft,
    UserDetailsInputStatus? userDetailsInputStatus,
    String? authenticationErrorMessage,
  }) {
    return SignupState(
      handle: handle ?? this.handle,
      handleErrorMessage: handleErrorMessage ??
          (canSetHandleErrorMessageToNull ? null : this.handleErrorMessage),
      handleNameStatus: handleNameStatus ?? this.handleNameStatus,
      shouldShowHandleInputSuffix:
          shouldShowHandleInputSuffix ?? this.shouldShowHandleInputSuffix,
      isDoneProfilePicEditing:
          isDoneProfilePicEditing ?? this.isDoneProfilePicEditing,
      isLoading: isLoading ?? this.isLoading,
      selectedProfilePicture: selectedProfilePicture ??
          (canSetProfilePictureToNull ? null : this.selectedProfilePicture),
      selectedLoginSignupType:
          selectedLoginSignupType ?? this.selectedLoginSignupType,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      confirmPasswordErrorMessage: confirmPasswordErrorMessage ??
          (canSetConfirmPasswordMessageToNull
              ? null
              : this.confirmPasswordErrorMessage),
      emailErrorMessage: emailErrorMessage ??
          (canSetEmailErrorMessageToNull ? null : this.emailErrorMessage),
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      passwordStrengthLevel:
          passwordStrengthLevel ?? this.passwordStrengthLevel,
      isPasswordLongEnough: isPasswordLongEnough ?? this.isPasswordLongEnough,
      hasLetterAndNumberInPassword:
          hasLetterAndNumberInPassword ?? this.hasLetterAndNumberInPassword,
      hasSpecialCharacterInPassword:
          hasSpecialCharacterInPassword ?? this.hasSpecialCharacterInPassword,
      resendVerificationEmailTimeLeft: resendVerificationEmailTimeLeft ??
          this.resendVerificationEmailTimeLeft,
      userDetailsInputStatus:
          userDetailsInputStatus ?? this.userDetailsInputStatus,
      authenticationErrorMessage:
          authenticationErrorMessage ?? this.authenticationErrorMessage,
    );
  }

  @visibleForTesting
  factory SignupState.test({
    String? handle,
    String? handleErrorMessage,
    HandleNameStatus? handleNameStatus,
    bool? shouldShowHandleInputSuffix,
    bool? isDoneProfilePicEditing,
    bool? isLoading,
    File? selectedProfilePicture,
    String? email,
    String? password,
    String? confirmPassword,
    String? emailErrorMessage,
    String? passwordErrorMessage,
    String? confirmPasswordErrorMessage,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    bool? isPasswordLongEnough,
    bool? hasLetterAndNumberInPassword,
    bool? hasSpecialCharacterInPassword,
    int? passwordStrengthLevel,
    int? resendVerificationEmailTimeLeft,
    UserDetailsInputStatus? userDetailsInputStatus,
    String? authenticationErrorMessage,
  }) {
    return SignupState(
      handle: handle ?? '',
      handleErrorMessage: handleErrorMessage,
      handleNameStatus: handleNameStatus ?? HandleNameStatus.unknown,
      shouldShowHandleInputSuffix: shouldShowHandleInputSuffix ?? false,
      isDoneProfilePicEditing: isDoneProfilePicEditing ?? false,
      isLoading: isLoading ?? false,
      selectedProfilePicture: selectedProfilePicture,
      selectedLoginSignupType: LoginType.PHONE,
      email: email ?? '',
      password: password ?? '',
      confirmPassword: confirmPassword ?? '',
      confirmPasswordErrorMessage: confirmPasswordErrorMessage,
      emailErrorMessage: emailErrorMessage,
      isPasswordVisible: isPasswordVisible ?? false,
      isConfirmPasswordVisible: isConfirmPasswordVisible ?? false,
      passwordStrengthLevel: passwordStrengthLevel ?? 0,
      isPasswordLongEnough: isPasswordLongEnough ?? false,
      hasLetterAndNumberInPassword: hasLetterAndNumberInPassword ?? false,
      hasSpecialCharacterInPassword: hasSpecialCharacterInPassword ?? false,
      resendVerificationEmailTimeLeft: resendVerificationEmailTimeLeft ??
          VerifyEmailScreen.kResendVerificationEmailMaxSeconds,
      userDetailsInputStatus:
          userDetailsInputStatus ?? UserDetailsInputStatus.none,
      authenticationErrorMessage: authenticationErrorMessage ?? '',
    );
  }

  @override
  List<Object?> get props => [
        handle,
        handleErrorMessage,
        handleNameStatus,
        shouldShowHandleInputSuffix,
        isDoneProfilePicEditing,
        selectedProfilePicture,
        selectedLoginSignupType,
        email,
        password,
        confirmPassword,
        confirmPasswordErrorMessage,
        emailErrorMessage,
        isPasswordVisible,
        isConfirmPasswordVisible,
        passwordStrengthLevel,
        isPasswordLongEnough,
        hasLetterAndNumberInPassword,
        hasSpecialCharacterInPassword,
        resendVerificationEmailTimeLeft,
        userDetailsInputStatus,
        isLoading,
      ];
}

class NavigateToEmailVerifyScreenState extends SignupState {
  NavigateToEmailVerifyScreenState(super.state) : super.copy();
}

class NavigateToHomeScreenState extends SignupState {
  NavigateToHomeScreenState(super.state) : super.copy();
}

class NavigateToCreatePasswordState extends SignupState {
  NavigateToCreatePasswordState(super.state) : super.copy();
}

class AuthenticationExceptionState extends SignupState {
  AuthenticationExceptionState(super.state) : super.copy();
}

class SignupLoadingState extends SignupState {
  SignupLoadingState(SignupState state, {required bool isLoading})
      : super.copy(state.copyWith(isLoading: isLoading));
}

class EmailSignUpLoadingState extends SignupState {
  EmailSignUpLoadingState(SignupState state, {required bool isLoading})
      : super.copy(state.copyWith(isLoading: isLoading));
}

class RestartVerificationMailResendTimerState extends SignupState {
  RestartVerificationMailResendTimerState(super.state) : super.copy();
}

enum HandleNameStatus {
  checking,
  doesExist,
  valid,
  unknown,
}
