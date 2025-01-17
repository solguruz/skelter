class LoginAnalyticsEvents {
  static const String kContinueWithGoogle = 'Login_ContinueWithGoogle';
  static const String kContinueWithApple = 'Login_ContinueWithApple';
  static const String kContinueWithEmailOrPhone =
      'Login_ContinueWithEmailOrPhone';
  static const String kContinueWithPhone = 'Login_ContinueWithPhone';
}

class DebugLoginAnalyticsEvents extends LoginAnalyticsEvents {
  static const String kLoginPageInitialized = 'd_Login_Init';
  static const String kPerformFirebaseSignInFailedNoInternet =
      'd_Login_PerformFBSignupNoInternet';
  static const String kGoogleSignInFailed = 'd_Login_GoogleSignInFailed';
  static const String kAppleSignInFailed = 'd_Login_AppleSignInFailed';
  static const String kEmailSignInFailed = 'd_Login_EmailSignInFailed';
  static const String kLoginEmailFBAuthException =
      'd_Login_LoginEmailFBAuthException';
  static const String kLoginEmailUnknownException =
      'd_Login_LoginEmailUnknownException';
  static const String kUserDetailsFirebaseUserNull =
      'd_Login_UserDetailsFirebaseUserNull';
  static const String kHandleUserDetailsAfterGettingFirebaseDetails =
      'd_Login_UserDetailsAfterFBDetails';
  static const String kNullToken = 'd_Login_NullToken';
  static const String kCurrentUserPhoneNumberNull =
      'd_Login_CurrentUserPhoneNumberNull';
  static const String kReturningFromHandleUserDetailsFunOnPhoneNumber =
      'd_Login_ReturningFromHandleUserDetails';
  static const String kCurrentUserEmailNull = 'd_Login_CurrentUserEmailNull';
  static const String kCheckPhoneNumberAccountExistsState =
      'd_Login_CheckPhNoAccountExists';
  static const String kAskForHandleOnPhone = 'd_Login_AskForHandleOnPhone';
  static const String kAskForHandleWithoutPhone =
      'd_Login_AskForHandleWithoutPhone';
}

class DebugPhoneLoginAnalyticsEvents extends LoginAnalyticsEvents {
  static const String kFunctionCall = 'd_PhoneLogin_FunctionCall';
  static const String kCodeSent = 'd_PhoneLogin_CodeSent';
  static const String kOnResendCode = 'd_PhoneLogin_OnResendCode';
  static const String kOtpVerificationId = 'd_PhoneLoginOtpVerificationId';
  static const String kOtpError = 'd_PhoneLogin_OtpError';
  static const String kHandleOtpInput = 'd_PhoneLogin_HandleOtpInput';
  static const String kOTPPageOnBackPressed =
      'd_PhoneLogin_OTPPageOnBackPressed';
  static const String kPhoneLoginPageOnBackPressed =
      'd_PhoneLogin_PhoneLoginPageOnBackPressed';
  static const String kVerifyPhoneLogin = 'd_PhoneLogin_VerifyPhoneLogin';
  static const String kVerificationCompleted =
      'd_PhoneLogin_VerificationCompleted';
  static const String kVerificationFailed = 'd_PhoneLogin_VerificationFailed';
  static const String kOtpErrorFirebaseException =
      'd_PhoneLogin_OtpErrorFirebaseException';
  static const String kPerformSignupFirebaseCurrentUserNull =
      'd_PhoneLogin_Signup_FBCurrentUserNull';
  static const String kPerformSignupPhoneNumberNull =
      'd_PhoneLogin_Signup_PhNoNull';
  static const String kEmailLoginPageOnBackPressed =
      'd_PhoneLogin_EmailLoginPageOnBackPressed';
  static const String kForgotPassPageOnBackPressed =
      'd_PhoneLogin_ForgotPassPageOnBackPressed';
  static const String kCheckEmailPageOnBackPressed =
      'd_PhoneLogin_CheckEmailPageOnBackPressed';
}

class DebugSignUpAnalyticsEvents extends LoginAnalyticsEvents {
  static const String kSignupPageInitialized = 'd_Signup_Init';
  static const String kPhoneVerifiedPageInit =
      'd_Signup_PhoneVerifiedPage_Init';
  static const String kPhoneVerifiedPageOnBackPressed =
      'd_Signup_PhoneVerifiedPageOnBackPressed';
  static const String kChooseHandlePageInit = 'd_Signup_ChooseHandlePage_Init';
  static const String kChooseHandlePageOnBackPressed =
      'd_Signup_ChooseHandlePageOnBackPressed';
  static const String kAddProfilePicturePageInit =
      'd_Signup_AddProfilePicture_Init';
  static const String kAddProfilePictureOnBackPressed =
      'd_Signup_AddProfilePictureOnBackPressed';
  static const String kTapSignupWithPhone = 'Tap_SignupWithPhone';
  static const String kTapSignupWithEmail = 'Tap_SignupWithEmail';
  static const String kTapSignupWithGoogle = 'Tap_SignupWithGoogle';
  static const String kTapSignupWithApple = 'Tap_SignupWithApple';
  static const String kTapLoginCTAInSignup = 'Tap_LoginCTAInSignup';
  static const String kTapPhoneNumVerifiedNext = 'Tap_PhoneNumVerifiedNext';
  static const String kTapHandleNameCreatedNext = 'Tap_HandleNameCreateNext';
  static const String kTapAddSignupProfilePicture =
      'Tap_AddSignupProfilePicture';
  static const String kTapSkipSignupProfilePicture =
      'Tap_SkipSignupProfilePicture';
  static const String kTapDoneSignupProfilePicture =
      'Tap_DoneSignupProfilePicture';
  static const String kTapEditSignupProfilePicture =
      'Tap_EditSignupProfilePicture';
  static const String kTapSignupChooseCamera = 'Tap_EditSignupChooseCamera';
  static const String kTapSignupChooseGallery = 'Tap_EditSignupChooseGallery';
  static const String kTapSignupProfilePictureSelected =
      'Tap_SignupProfilePictureSelected';
  static const String kTapSignupProfilePictureRemoved =
      'Tap_SignupProfilePictureRemoved';
  static const String kSignupWithGoogleEmailNull =
      'd_Signup_LoginWithGoogleEmailNull';
  static const String kEmailSignupPageOnBackPressed =
      'd_Signup_EmailPageOnBackPressed';
  static const String kCreatePasswordPageOnBackPressed =
      'd_Signup_CreatePasswordPageOnBackPressed';
  static const String kContinueWithEmail = 'd_Signup_ContinueWithEmail';
  static const String kTapSignupEmailNextCTA = 'Tap_SignupEmailNextCTA';
  static const String kTapSignupPasswordCTA = 'Tap_SignupPasswordCTA';
  static const String kEmailVerifyPageOnBackPressed =
      'd_Signup_EmailVerifyPageOnBackPressed';
  static const String kTapResendEmailVerificationLink =
      'Tap_ResendEmailVerificationLink';
  static const String kNavigateLoginFromEmailSignup =
      'd_Signup_NavigateLoginFromEmailSignup';
  static const String kTapChangeWrongEmail = 'Tap_ChangeWrongEmail';
}
