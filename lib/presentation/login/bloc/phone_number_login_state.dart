part of 'login_state.dart';

class PhoneNumberLoginState with EquatableMixin {
  final bool phoneInputHasFocus;
  final bool isPhoneNumValid;
  final String countryCode;
  final String phoneNumber;
  final String? phoneNumErrorMessage;
  final String phoneOTPText;
  final String? phoneOTPErrorMessage;
  final bool isResendOTPEnabled;
  final int resendOTPTimeLeft;

  PhoneNumberLoginState({
    required this.phoneInputHasFocus,
    required this.isPhoneNumValid,
    required this.countryCode,
    required this.phoneNumber,
    required this.phoneNumErrorMessage,
    required this.phoneOTPText,
    required this.phoneOTPErrorMessage,
    required this.isResendOTPEnabled,
    required this.resendOTPTimeLeft,
  });

  factory PhoneNumberLoginState.initial() {
    return PhoneNumberLoginState(
      phoneInputHasFocus: false,
      isPhoneNumValid: true,
      countryCode: '',
      phoneNumber: '',
      phoneNumErrorMessage: null,
      phoneOTPText: '',
      phoneOTPErrorMessage: null,
      isResendOTPEnabled: false,
      resendOTPTimeLeft: PhoneNumberOTPScreen.kResendOTPMaxSeconds,
    );
  }

  PhoneNumberLoginState.copy(PhoneNumberLoginState state)
      : this(
          phoneInputHasFocus: state.phoneInputHasFocus,
          isPhoneNumValid: state.isPhoneNumValid,
          countryCode: state.countryCode,
          phoneNumber: state.phoneNumber,
          phoneNumErrorMessage: state.phoneNumErrorMessage,
          phoneOTPText: state.phoneOTPText,
          phoneOTPErrorMessage: state.phoneOTPErrorMessage,
          isResendOTPEnabled: state.isResendOTPEnabled,
          resendOTPTimeLeft: state.resendOTPTimeLeft,
        );

  PhoneNumberLoginState copyWith({
    bool? phoneInputHasFocus,
    bool? isPhoneNumValid,
    String? countryCode,
    String? phoneNumber,
    String? phoneNumErrorMessage,
    String? phoneOTPText,
    String? phoneOTPErrorMessage,
    bool? isResendOTPEnabled,
    int? resendOTPTimeLeft,
    bool canSetOTPErrorMessageToNull = false,
  }) {
    return PhoneNumberLoginState(
      phoneInputHasFocus: phoneInputHasFocus ?? this.phoneInputHasFocus,
      isPhoneNumValid: isPhoneNumValid ?? this.isPhoneNumValid,
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      phoneNumErrorMessage: phoneNumErrorMessage,
      phoneOTPText: phoneOTPText ?? this.phoneOTPText,
      phoneOTPErrorMessage: phoneOTPErrorMessage ??
          (canSetOTPErrorMessageToNull ? null : this.phoneOTPErrorMessage),
      isResendOTPEnabled: isResendOTPEnabled ?? this.isResendOTPEnabled,
      resendOTPTimeLeft: resendOTPTimeLeft ?? this.resendOTPTimeLeft,
    );
  }

  @visibleForTesting
  factory PhoneNumberLoginState.test({
    bool? phoneInputHasFocus,
    bool? isPhoneNumValid,
    String? countryCode,
    String? phoneNumber,
    String? phoneNumErrorMessage,
    String? phoneOTPText,
    String? phoneOTPErrorMessage,
    bool? isResendOTPEnabled,
    int? resendOTPTimeLeft,
  }) {
    return PhoneNumberLoginState(
      phoneInputHasFocus: phoneInputHasFocus ?? false,
      isPhoneNumValid: isPhoneNumValid ?? true,
      countryCode: countryCode ?? '',
      phoneNumber: phoneNumber ?? '',
      phoneNumErrorMessage: phoneNumErrorMessage,
      phoneOTPText: phoneOTPText ?? '',
      phoneOTPErrorMessage: phoneOTPErrorMessage,
      isResendOTPEnabled: isResendOTPEnabled ?? false,
      resendOTPTimeLeft:
          resendOTPTimeLeft ?? PhoneNumberOTPScreen.kResendOTPMaxSeconds,
    );
  }

  @override
  List<Object?> get props => [
        phoneInputHasFocus,
        isPhoneNumValid,
        countryCode,
        phoneNumber,
        phoneNumErrorMessage,
        phoneOTPText,
        phoneOTPErrorMessage,
        isResendOTPEnabled,
        resendOTPTimeLeft,
      ];
}

class FirebaseOTPAutoVerificationState extends PhoneNumberLoginState {
  FirebaseOTPAutoVerificationState(PhoneNumberLoginState state)
      : super.copy(state.copyWith(phoneOTPText: state.phoneOTPText));
}
