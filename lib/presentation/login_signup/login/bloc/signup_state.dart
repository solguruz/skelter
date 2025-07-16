import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_skeleton/presentation/login_signup/enum_login_type.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/verify_email_screen/verify_email_screen.dart';

class SignUpState with EquatableMixin {
  final String handle;
  final String? handleErrorMessage;
  final HandleNameStatus handleNameStatus;
  final bool shouldShowHandleInputSuffix;
  final bool isDoneProfilePicEditing;
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

  SignUpState({
    required this.handle,
    required this.handleErrorMessage,
    required this.handleNameStatus,
    required this.shouldShowHandleInputSuffix,
    required this.isDoneProfilePicEditing,
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
  });

  factory SignUpState.initial() {
    return SignUpState(
      handle: '',
      handleErrorMessage: null,
      handleNameStatus: HandleNameStatus.unknown,
      shouldShowHandleInputSuffix: false,
      isDoneProfilePicEditing: false,
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
    );
  }

  SignUpState.copy(SignUpState state)
      : this(
          handle: state.handle,
          handleErrorMessage: state.handleErrorMessage,
          handleNameStatus: state.handleNameStatus,
          shouldShowHandleInputSuffix: state.shouldShowHandleInputSuffix,
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
        );

  SignUpState copyWith({
    String? handle,
    String? handleErrorMessage,
    HandleNameStatus? handleNameStatus,
    bool canSetHandleErrorMessageToNull = false,
    bool? shouldShowHandleInputSuffix,
    bool? isDoneProfilePicEditing,
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
  }) {
    return SignUpState(
      handle: handle ?? this.handle,
      handleErrorMessage: handleErrorMessage ??
          (canSetHandleErrorMessageToNull ? null : this.handleErrorMessage),
      handleNameStatus: handleNameStatus ?? this.handleNameStatus,
      shouldShowHandleInputSuffix:
          shouldShowHandleInputSuffix ?? this.shouldShowHandleInputSuffix,
      isDoneProfilePicEditing:
          isDoneProfilePicEditing ?? this.isDoneProfilePicEditing,
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
    );
  }

  @visibleForTesting
  factory SignUpState.test({
    String? handle,
    String? handleErrorMessage,
    HandleNameStatus? handleNameStatus,
    bool? shouldShowHandleInputSuffix,
    bool? isDoneProfilePicEditing,
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
  }) {
    return SignUpState(
      handle: handle ?? '',
      handleErrorMessage: handleErrorMessage,
      handleNameStatus: handleNameStatus ?? HandleNameStatus.unknown,
      shouldShowHandleInputSuffix: shouldShowHandleInputSuffix ?? false,
      isDoneProfilePicEditing: isDoneProfilePicEditing ?? false,
      selectedProfilePicture: selectedProfilePicture,
      selectedLoginSignupType: LoginType.PHONE,
      email: email ?? '',
      password: password ?? '',
      confirmPassword: '',
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
      ];
}

enum HandleNameStatus {
  checking,
  doesExist,
  valid,
  unknown,
}
