import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'i18n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @login_signup_signup.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get login_signup_signup;

  /// No description provided for @login_signup_accountNotFoundSignupMessage.
  ///
  /// In en, this message translates to:
  /// **'Account not found. Please sign up to create a new account.'**
  String get login_signup_accountNotFoundSignupMessage;

  /// No description provided for @login_signup_invalidEmailAddressErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get login_signup_invalidEmailAddressErrorMessage;

  /// No description provided for @login_signup_sendPasswordResetLinkButton.
  ///
  /// In en, this message translates to:
  /// **'Send password reset link'**
  String get login_signup_sendPasswordResetLinkButton;

  /// No description provided for @login_signup_needMoreHelp.
  ///
  /// In en, this message translates to:
  /// **'Need more help?'**
  String get login_signup_needMoreHelp;

  /// No description provided for @login_signup_passwordResetLinkSentMessage.
  ///
  /// In en, this message translates to:
  /// **'Password reset link sent!'**
  String get login_signup_passwordResetLinkSentMessage;

  /// No description provided for @login_signup_checkEmailInstructionsMessage.
  ///
  /// In en, this message translates to:
  /// **'Please check your inbox and follow the\ninstructions in the email'**
  String get login_signup_checkEmailInstructionsMessage;

  /// No description provided for @login_signup_goBackToSignIn.
  ///
  /// In en, this message translates to:
  /// **'Go back to Sign in'**
  String get login_signup_goBackToSignIn;

  /// No description provided for @login_signup_cap_help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get login_signup_cap_help;

  /// No description provided for @login_signup_birthdayQuestionPrompt.
  ///
  /// In en, this message translates to:
  /// **'When\'s your birthday?'**
  String get login_signup_birthdayQuestionPrompt;

  /// No description provided for @login_signup_cap_birthdate.
  ///
  /// In en, this message translates to:
  /// **'Birthdate'**
  String get login_signup_cap_birthdate;

  /// No description provided for @login_signup_passionsQuestionPrompt.
  ///
  /// In en, this message translates to:
  /// **'What are your passions?'**
  String get login_signup_passionsQuestionPrompt;

  /// No description provided for @login_signup_interestsSelectionPrompt.
  ///
  /// In en, this message translates to:
  /// **'Choose some interests to help us curate your feed and recommendations'**
  String get login_signup_interestsSelectionPrompt;

  /// No description provided for @login_signup_pronounsQuestionPrompt.
  ///
  /// In en, this message translates to:
  /// **'What are your pronouns?'**
  String get login_signup_pronounsQuestionPrompt;

  /// No description provided for @login_signup_cap_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get login_signup_cap_skip;

  /// No description provided for @login_signup_setUpYourProfile.
  ///
  /// In en, this message translates to:
  /// **'Create your profile'**
  String get login_signup_setUpYourProfile;

  /// No description provided for @login_signup_addAProfilePicture.
  ///
  /// In en, this message translates to:
  /// **'Add a profile picture'**
  String get login_signup_addAProfilePicture;

  /// No description provided for @login_signup_cap_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get login_signup_cap_save;

  /// No description provided for @login_signup_realPhotoRecognitionPrompt.
  ///
  /// In en, this message translates to:
  /// **'Help your friends recognize you by using a real photo of yourself'**
  String get login_signup_realPhotoRecognitionPrompt;

  /// No description provided for @login_signup_emailVerificationRequired.
  ///
  /// In en, this message translates to:
  /// **'Email Verification Required'**
  String get login_signup_emailVerificationRequired;

  /// No description provided for @login_signup_verificationEmailSentMessage.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent you a verification email. Please verify your account.'**
  String get login_signup_verificationEmailSentMessage;

  /// No description provided for @login_signup_cap_submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get login_signup_cap_submit;

  /// No description provided for @login_signup_forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get login_signup_forgotPassword;

  /// No description provided for @login_signup_userAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'User already exists'**
  String get login_signup_userAlreadyExists;

  /// No description provided for @login_signup_usernameMinimumLengthErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Username should at least be 5 characters'**
  String get login_signup_usernameMinimumLengthErrorMessage;

  /// No description provided for @login_signup_tryAgainInFewSecondsMessage.
  ///
  /// In en, this message translates to:
  /// **'Please try again in few seconds'**
  String get login_signup_tryAgainInFewSecondsMessage;

  /// No description provided for @login_signup_yourPassword.
  ///
  /// In en, this message translates to:
  /// **'Your password'**
  String get login_signup_yourPassword;

  /// No description provided for @login_signup_cap_refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get login_signup_cap_refresh;

  /// No description provided for @login_signup_cap_resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get login_signup_cap_resend;

  /// No description provided for @login_signup_continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get login_signup_continueWithGoogle;

  /// No description provided for @login_signup_continueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get login_signup_continueWithApple;

  /// No description provided for @login_signup_continueWithEmailOrPhone.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Email or Phone'**
  String get login_signup_continueWithEmailOrPhone;

  /// No description provided for @login_signup_skipForNow.
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get login_signup_skipForNow;

  /// No description provided for @login_signup_enter_phone.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get login_signup_enter_phone;

  /// No description provided for @login_signup_byContinuingYouAreAgreeingToUur.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you are agreeing to our '**
  String get login_signup_byContinuingYouAreAgreeingToUur;

  /// No description provided for @login_signup_termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get login_signup_termsAndConditions;

  /// No description provided for @login_signup_dataFeesDisclaimer.
  ///
  /// In en, this message translates to:
  /// **' and any data fees that may apply.'**
  String get login_signup_dataFeesDisclaimer;

  /// No description provided for @login_signup_noAccountFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'Looks like you don’t have an account.\nTry a different number or '**
  String get login_signup_noAccountFoundMessage;

  /// No description provided for @login_signup_DoNotHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get login_signup_DoNotHaveAnAccount;

  /// No description provided for @login_signup_signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get login_signup_signIn;

  /// No description provided for @login_signup_createAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get login_signup_createAnAccount;

  /// No description provided for @login_signup_createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get login_signup_createAccount;

  /// No description provided for @login_signup_cap_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get login_signup_cap_phone;

  /// No description provided for @login_signup_sendVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Get OTP'**
  String get login_signup_sendVerificationCode;

  /// No description provided for @login_signup_phone_label.
  ///
  /// In en, this message translates to:
  /// **'10-Digit Phone number'**
  String get login_signup_phone_label;

  /// No description provided for @login_signup_cap_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get login_signup_cap_continue;

  /// No description provided for @login_signup_emailCanNotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Email can\'t be empty'**
  String get login_signup_emailCanNotBeEmpty;

  /// No description provided for @login_signup_passwordCanNotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Password can\'t be empty'**
  String get login_signup_passwordCanNotBeEmpty;

  /// No description provided for @login_signup_enterNumberToProceedMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter your number to sign proceed'**
  String get login_signup_enterNumberToProceedMessage;

  /// No description provided for @login_signup_tooManyRequestsErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Too many requests, please try again later.'**
  String get login_signup_tooManyRequestsErrorMessage;

  /// No description provided for @login_signup_resendEmail.
  ///
  /// In en, this message translates to:
  /// **'Resend email'**
  String get login_signup_resendEmail;

  /// No description provided for @login_signup_verificationCode.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get login_signup_verificationCode;

  /// No description provided for @login_signup_accountVerificationInstruction.
  ///
  /// In en, this message translates to:
  /// **'so we can verify your account'**
  String get login_signup_accountVerificationInstruction;

  /// No description provided for @login_signup_emailVerificationSentMessage.
  ///
  /// In en, this message translates to:
  /// **'We have sent you an email verification to:'**
  String get login_signup_emailVerificationSentMessage;

  /// No description provided for @login_signup_emailSentMessage.
  ///
  /// In en, this message translates to:
  /// **'We have sent you an email'**
  String get login_signup_emailSentMessage;

  /// No description provided for @login_signup_weakPassword.
  ///
  /// In en, this message translates to:
  /// **'Weak password'**
  String get login_signup_weakPassword;

  /// No description provided for @login_signup_emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'Email already in use'**
  String get login_signup_emailAlreadyInUse;

  /// No description provided for @login_signup_invalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid Credentials'**
  String get login_signup_invalidCredentials;

  /// No description provided for @login_signup_resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get login_signup_resendCode;

  /// No description provided for @login_signup_resendCodeTime.
  ///
  /// In en, this message translates to:
  /// **'Resend code ({timeLeft}s)'**
  String login_signup_resendCodeTime(Object timeLeft);

  /// No description provided for @login_signup_verificationCodeSent.
  ///
  /// In en, this message translates to:
  /// **'Verification code sent'**
  String get login_signup_verificationCodeSent;

  /// No description provided for @login_signup_enterOtpSentTo.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6 digit OTP sent to\n{phoneNumber}'**
  String login_signup_enterOtpSentTo(Object phoneNumber);

  /// No description provided for @login_signup_looksLikeThisIsTheWrongCode.
  ///
  /// In en, this message translates to:
  /// **'Looks like this is the wrong code,\nPlease try again or get a new code'**
  String get login_signup_looksLikeThisIsTheWrongCode;

  /// No description provided for @login_signup_signupWithPhoneOnly.
  ///
  /// In en, this message translates to:
  /// **'New accounts are created only using phone number'**
  String get login_signup_signupWithPhoneOnly;

  /// No description provided for @login_signup_enterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your Name'**
  String get login_signup_enterName;

  /// No description provided for @otp_errors_number_not_valid.
  ///
  /// In en, this message translates to:
  /// **'The provided phone number is not valid.'**
  String get otp_errors_number_not_valid;

  /// No description provided for @otp_errors_too_many_requests.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. We have temporarily blocked attempts from this device. Please try again later.'**
  String get otp_errors_too_many_requests;

  /// No description provided for @otp_errors_the_sms_code_expired.
  ///
  /// In en, this message translates to:
  /// **'The SMS code has expired.'**
  String get otp_errors_the_sms_code_expired;

  /// No description provided for @otp_errors_invalid_verification_code.
  ///
  /// In en, this message translates to:
  /// **'Invalid OTP code. Please try again.'**
  String get otp_errors_invalid_verification_code;

  /// No description provided for @otp_errors_phone_number_not_allowed.
  ///
  /// In en, this message translates to:
  /// **'Phone numbers from this country are not allowed.'**
  String get otp_errors_phone_number_not_allowed;

  /// No description provided for @otp_errors_oops_something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong.'**
  String get otp_errors_oops_something_went_wrong;

  /// No description provided for @otp_errors_network_request_failed.
  ///
  /// In en, this message translates to:
  /// **'Network error! Please check your internet connection and try again.'**
  String get otp_errors_network_request_failed;

  /// No description provided for @login_signup_login_to_app.
  ///
  /// In en, this message translates to:
  /// **'Login to App'**
  String get login_signup_login_to_app;

  /// No description provided for @login_signup_welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get login_signup_welcome_back;

  /// No description provided for @login_signup_send_otp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get login_signup_send_otp;

  /// No description provided for @login_signup_enter_your_registered_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Enter your registered phone number'**
  String get login_signup_enter_your_registered_phone_number;

  /// No description provided for @login_signup_or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get login_signup_or;

  /// No description provided for @login_signup_no_account.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account? '**
  String get login_signup_no_account;

  /// No description provided for @login_signup_sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get login_signup_sign_up;

  /// No description provided for @login_signup_agreement_info.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you are acknowledge and accept our '**
  String get login_signup_agreement_info;

  /// No description provided for @login_signup_terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get login_signup_terms_and_conditions;

  /// No description provided for @login_signup_and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get login_signup_and;

  /// No description provided for @login_signup_privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get login_signup_privacy_policy;

  /// No description provided for @login_signup_continue_with_google.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get login_signup_continue_with_google;

  /// No description provided for @login_signup_continue_with_apple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get login_signup_continue_with_apple;

  /// No description provided for @login_signup_continue_with_number.
  ///
  /// In en, this message translates to:
  /// **'Continue with Phone Number'**
  String get login_signup_continue_with_number;

  /// No description provided for @login_signup_continue_with_email.
  ///
  /// In en, this message translates to:
  /// **'Continue with Email'**
  String get login_signup_continue_with_email;

  /// No description provided for @login_signup_login_with_phone.
  ///
  /// In en, this message translates to:
  /// **'Login with phone number'**
  String get login_signup_login_with_phone;

  /// No description provided for @login_signup_mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get login_signup_mobile_number;

  /// No description provided for @login_signup_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get login_signup_continue;

  /// No description provided for @login_signup_enter_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get login_signup_enter_phone_number;

  /// No description provided for @login_signup_enter_otp.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get login_signup_enter_otp;

  /// No description provided for @login_signup_sent_code_info.
  ///
  /// In en, this message translates to:
  /// **'We’ve sent a 6-digit code to'**
  String get login_signup_sent_code_info;

  /// No description provided for @login_signup_error_invalid_otp.
  ///
  /// In en, this message translates to:
  /// **'Invalid OTP. Please try again.'**
  String get login_signup_error_invalid_otp;

  /// No description provided for @login_signup_verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get login_signup_verify;

  /// No description provided for @login_signup_resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get login_signup_resend;

  /// No description provided for @login_signup_login_with_email.
  ///
  /// In en, this message translates to:
  /// **'Login with email'**
  String get login_signup_login_with_email;

  /// No description provided for @login_signup_email_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get login_signup_email_hint;

  /// No description provided for @login_signup_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get login_signup_password;

  /// No description provided for @login_signup_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get login_signup_password_hint;

  /// No description provided for @login_signup_ask_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get login_signup_ask_forgot_password;

  /// No description provided for @login_signup_login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login_signup_login;

  /// No description provided for @login_signup_email_cant_be_empty.
  ///
  /// In en, this message translates to:
  /// **'Email can\'t be empty'**
  String get login_signup_email_cant_be_empty;

  /// No description provided for @login_signup_invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get login_signup_invalid_email;

  /// No description provided for @login_signup_password_cant_be_empty.
  ///
  /// In en, this message translates to:
  /// **'Password can\'t be empty'**
  String get login_signup_password_cant_be_empty;

  /// No description provided for @login_signup_send_reset_link.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get login_signup_send_reset_link;

  /// No description provided for @login_signup_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get login_signup_forgot_password;

  /// No description provided for @login_signup_check_your_email.
  ///
  /// In en, this message translates to:
  /// **'Check Your Email'**
  String get login_signup_check_your_email;

  /// Email where reset link has been sent
  ///
  /// In en, this message translates to:
  /// **'A reset link has been sent to {email}. Please check your inbox and click the link to reset the password.'**
  String login_signup_link_send_info(String email);

  /// No description provided for @login_signup_signup_already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get login_signup_signup_already_have_account;

  /// No description provided for @login_signup_signup_lets_get_started.
  ///
  /// In en, this message translates to:
  /// **'Let\'s get started'**
  String get login_signup_signup_lets_get_started;

  /// No description provided for @login_signup_signup_lets_get_started_info.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number, we will send you a verification code'**
  String get login_signup_signup_lets_get_started_info;

  /// No description provided for @login_signup_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get login_signup_next;

  /// No description provided for @login_signup_Phone_no_verified.
  ///
  /// In en, this message translates to:
  /// **'Phone number verified!'**
  String get login_signup_Phone_no_verified;

  /// No description provided for @login_signup_Phone_no_verified_info.
  ///
  /// In en, this message translates to:
  /// **'Your Phone number has been successfully verified. You can now complete your profile.'**
  String get login_signup_Phone_no_verified_info;

  /// No description provided for @login_signup_checking.
  ///
  /// In en, this message translates to:
  /// **'Checking'**
  String get login_signup_checking;

  /// No description provided for @login_signup_error_phone_number_not_registered.
  ///
  /// In en, this message translates to:
  /// **'Phone number is not registered, please sign up to continue'**
  String get login_signup_error_phone_number_not_registered;

  /// No description provided for @login_signup_phone_number_already_registered.
  ///
  /// In en, this message translates to:
  /// **'Welcome back! We found your phone number in our records. Please continue with the login.'**
  String get login_signup_phone_number_already_registered;

  /// No description provided for @login_signup_add_profile_picture.
  ///
  /// In en, this message translates to:
  /// **'Add a profile picture'**
  String get login_signup_add_profile_picture;

  /// No description provided for @login_signup_add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get login_signup_add;

  /// No description provided for @login_signup_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get login_signup_skip;

  /// No description provided for @login_signup_done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get login_signup_done;

  /// No description provided for @login_signup_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get login_signup_edit;

  /// No description provided for @login_signup_remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get login_signup_remove;

  /// No description provided for @login_signup_camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get login_signup_camera;

  /// No description provided for @login_signup_gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get login_signup_gallery;

  /// No description provided for @login_signup_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get login_signup_email;

  /// No description provided for @login_signup_sign_up_with_email.
  ///
  /// In en, this message translates to:
  /// **'Sign up with email'**
  String get login_signup_sign_up_with_email;

  /// No description provided for @login_signup_create_your_password.
  ///
  /// In en, this message translates to:
  /// **'Create your password'**
  String get login_signup_create_your_password;

  /// No description provided for @login_signup_password_requirements.
  ///
  /// In en, this message translates to:
  /// **'Your password must have at least:'**
  String get login_signup_password_requirements;

  /// No description provided for @login_signup_password_requirements_length.
  ///
  /// In en, this message translates to:
  /// **'8 characters or more'**
  String get login_signup_password_requirements_length;

  /// No description provided for @login_signup_password_requirements_letter_number.
  ///
  /// In en, this message translates to:
  /// **'1 letter and number'**
  String get login_signup_password_requirements_letter_number;

  /// No description provided for @login_signup_password_requirements_special_char.
  ///
  /// In en, this message translates to:
  /// **'1 special character (Example: # ? ! \$ & @)'**
  String get login_signup_password_requirements_special_char;

  /// No description provided for @login_signup_password_strength.
  ///
  /// In en, this message translates to:
  /// **'Password strength:'**
  String get login_signup_password_strength;

  /// No description provided for @login_signup_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get login_signup_confirm_password;

  /// No description provided for @login_signup_confirm_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter confirm password'**
  String get login_signup_confirm_password_hint;

  /// No description provided for @login_signup_poor.
  ///
  /// In en, this message translates to:
  /// **'Poor'**
  String get login_signup_poor;

  /// No description provided for @login_signup_weak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get login_signup_weak;

  /// No description provided for @login_signup_strong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get login_signup_strong;

  /// No description provided for @login_signup_error_enter_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter confirm password'**
  String get login_signup_error_enter_confirm_password;

  /// No description provided for @login_signup_passwords_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get login_signup_passwords_do_not_match;

  /// No description provided for @login_signup_verify_your_email.
  ///
  /// In en, this message translates to:
  /// **'Verify your email'**
  String get login_signup_verify_your_email;

  /// Email where verification link has been sent
  ///
  /// In en, this message translates to:
  /// **'A verification link has been sent to {email}. Click the link to verify your account.'**
  String login_signup_link_verify_info(String email);

  /// No description provided for @login_signup_back_to_login.
  ///
  /// In en, this message translates to:
  /// **'Back to login'**
  String get login_signup_back_to_login;

  /// No description provided for @login_signup_resend_verification_email.
  ///
  /// In en, this message translates to:
  /// **'Resend Verification Email'**
  String get login_signup_resend_verification_email;

  /// No description provided for @login_signup_entered_wrong_email.
  ///
  /// In en, this message translates to:
  /// **'Entered the wrong email?'**
  String get login_signup_entered_wrong_email;

  /// No description provided for @login_signup_change_email.
  ///
  /// In en, this message translates to:
  /// **' Change Email'**
  String get login_signup_change_email;

  /// No description provided for @login_signup_signup_with_google.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get login_signup_signup_with_google;

  /// No description provided for @login_signup_signup_with_apple.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Apple'**
  String get login_signup_signup_with_apple;

  /// No description provided for @login_signup_signup_with_email.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Email'**
  String get login_signup_signup_with_email;

  /// No description provided for @login_signup_invalid_mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Invalid mobile number'**
  String get login_signup_invalid_mobile_number;

  /// No description provided for @login_signup_search_by_country.
  ///
  /// In en, this message translates to:
  /// **'Search by name or code'**
  String get login_signup_search_by_country;

  /// No description provided for @login_signup_registration_complete.
  ///
  /// In en, this message translates to:
  /// **'Registration complete!'**
  String get login_signup_registration_complete;

  /// No description provided for @login_signup_what_interest_you.
  ///
  /// In en, this message translates to:
  /// **'What topics interest you?'**
  String get login_signup_what_interest_you;

  /// No description provided for @login_signup_select_three_categories.
  ///
  /// In en, this message translates to:
  /// **'Select at least 3 topics to personalize your feed.'**
  String get login_signup_select_three_categories;

  /// No description provided for @login_signup_email_already_in_use.
  ///
  /// In en, this message translates to:
  /// **'This email is already registered. Please log in or use a different email.'**
  String get login_signup_email_already_in_use;

  /// No description provided for @login_signup_error_retrieving_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Error retrieving your phone number'**
  String get login_signup_error_retrieving_phone_number;

  /// No description provided for @login_signup_error_retrieving_email.
  ///
  /// In en, this message translates to:
  /// **'Error retrieving your email'**
  String get login_signup_error_retrieving_email;

  /// No description provided for @login_signup_user_info_not_retrieved.
  ///
  /// In en, this message translates to:
  /// **'User information could not be retrieved.'**
  String get login_signup_user_info_not_retrieved;

  /// No description provided for @share_type_instagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get share_type_instagram;

  /// No description provided for @share_type_x.
  ///
  /// In en, this message translates to:
  /// **'X'**
  String get share_type_x;

  /// No description provided for @share_type_facebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get share_type_facebook;

  /// No description provided for @share_type_tiktok.
  ///
  /// In en, this message translates to:
  /// **'Tiktok'**
  String get share_type_tiktok;

  /// No description provided for @share_type_snapchat.
  ///
  /// In en, this message translates to:
  /// **'Snapchat'**
  String get share_type_snapchat;

  /// No description provided for @share_type_iMessage.
  ///
  /// In en, this message translates to:
  /// **'iMessage'**
  String get share_type_iMessage;

  /// No description provided for @share_type_messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get share_type_messages;

  /// No description provided for @share_type_whatsApp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get share_type_whatsApp;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @top_products.
  ///
  /// In en, this message translates to:
  /// **'Top Products'**
  String get top_products;

  /// No description provided for @see_all.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get see_all;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @pro.
  ///
  /// In en, this message translates to:
  /// **'PRO'**
  String get pro;

  /// No description provided for @sign_out.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get sign_out;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @personal_details.
  ///
  /// In en, this message translates to:
  /// **'Personal Details'**
  String get personal_details;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @community.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get community;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @feedback_and_ratings.
  ///
  /// In en, this message translates to:
  /// **'Feedback & Ratings'**
  String get feedback_and_ratings;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @help_and_support.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get help_and_support;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @send_a_new_message.
  ///
  /// In en, this message translates to:
  /// **'Send a new message'**
  String get send_a_new_message;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get you;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @shipping.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get shipping;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @order_review.
  ///
  /// In en, this message translates to:
  /// **'Order Review'**
  String get order_review;

  /// No description provided for @cart_and_checkout.
  ///
  /// In en, this message translates to:
  /// **'Cart Details'**
  String get cart_and_checkout;

  /// No description provided for @cart_items.
  ///
  /// In en, this message translates to:
  /// **'Cart Items'**
  String get cart_items;

  /// No description provided for @your_cart_is_empty.
  ///
  /// In en, this message translates to:
  /// **'Your Cart is Empty !'**
  String get your_cart_is_empty;

  /// No description provided for @empty_cart_message.
  ///
  /// In en, this message translates to:
  /// **'There is no single item here. Explore products to add in your cart.'**
  String get empty_cart_message;

  /// No description provided for @explore_products.
  ///
  /// In en, this message translates to:
  /// **'Explore Products'**
  String get explore_products;

  /// No description provided for @expected_delivery_by.
  ///
  /// In en, this message translates to:
  /// **'Expected Delivery by'**
  String get expected_delivery_by;

  /// No description provided for @order_summary.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get order_summary;

  /// Total products count with correct plural form
  ///
  /// In en, this message translates to:
  /// **'Price({total_product, plural, =1{{total_product} item} other{{total_product} items}})'**
  String price_of_items(int total_product);

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @delivery_charges.
  ///
  /// In en, this message translates to:
  /// **'Delivery Charges'**
  String get delivery_charges;

  /// No description provided for @total_amount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get total_amount;

  /// No description provided for @add_shipping_details.
  ///
  /// In en, this message translates to:
  /// **'Add Shipping Details'**
  String get add_shipping_details;

  /// No description provided for @shipping_details.
  ///
  /// In en, this message translates to:
  /// **'Shipping Details'**
  String get shipping_details;

  /// No description provided for @shipping_address.
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get shipping_address;

  /// No description provided for @deliver_to.
  ///
  /// In en, this message translates to:
  /// **'Deliver to'**
  String get deliver_to;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @add_new_address.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get add_new_address;

  /// No description provided for @select_address.
  ///
  /// In en, this message translates to:
  /// **'Select Address'**
  String get select_address;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @use_current_location.
  ///
  /// In en, this message translates to:
  /// **'Use Current Location'**
  String get use_current_location;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @enter_your_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Name'**
  String get enter_your_name;

  /// No description provided for @enter_your_mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Mobile Number'**
  String get enter_your_mobile_number;

  /// No description provided for @mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobile_number;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @select_country.
  ///
  /// In en, this message translates to:
  /// **'Select Country'**
  String get select_country;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @select_state.
  ///
  /// In en, this message translates to:
  /// **'Select State'**
  String get select_state;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @select_city.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get select_city;

  /// No description provided for @zip_code.
  ///
  /// In en, this message translates to:
  /// **'Zip Code'**
  String get zip_code;

  /// No description provided for @enter_zip_code.
  ///
  /// In en, this message translates to:
  /// **'Enter Zip Code'**
  String get enter_zip_code;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @enter_your_address.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Address'**
  String get enter_your_address;

  /// No description provided for @set_as_default_address.
  ///
  /// In en, this message translates to:
  /// **'Set as Default Address'**
  String get set_as_default_address;

  /// No description provided for @select_payment_method.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get select_payment_method;

  /// No description provided for @selected_payment_method.
  ///
  /// In en, this message translates to:
  /// **'Selected Payment Method'**
  String get selected_payment_method;

  /// No description provided for @cash_on_delivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery'**
  String get cash_on_delivery;

  /// No description provided for @apply_coupon.
  ///
  /// In en, this message translates to:
  /// **'Apply Coupon'**
  String get apply_coupon;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @available_coupons.
  ///
  /// In en, this message translates to:
  /// **'Available Coupons'**
  String get available_coupons;

  /// Message based on the number of available coupons
  ///
  /// In en, this message translates to:
  /// **'{coupon_count, plural, =0 {No Coupon Available} =1 {{coupon_count} Coupon Available} other {{coupon_count} Coupons Available}}'**
  String coupon_message(int coupon_count);

  /// No description provided for @select_and_review_order.
  ///
  /// In en, this message translates to:
  /// **'Select & Review Order'**
  String get select_and_review_order;

  /// No description provided for @confirm_and_pay.
  ///
  /// In en, this message translates to:
  /// **'Confirm and Pay'**
  String get confirm_and_pay;

  /// No description provided for @product_already_scanned.
  ///
  /// In en, this message translates to:
  /// **'Product already scanned. Continue?'**
  String get product_already_scanned;

  /// No description provided for @previous_scan_will_be_overwritten.
  ///
  /// In en, this message translates to:
  /// **'Previous scan will be overwritten.'**
  String get previous_scan_will_be_overwritten;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cart_checkout_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get cart_checkout_continue;

  /// No description provided for @add_certificate.
  ///
  /// In en, this message translates to:
  /// **'Add Certificate'**
  String get add_certificate;

  /// No description provided for @add_certificate_description.
  ///
  /// In en, this message translates to:
  /// **'Do You want to add lab tested certificate for this item?'**
  String get add_certificate_description;

  /// No description provided for @proceed.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get proceed;

  /// No description provided for @are_you_sure_want_to_delete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this item?'**
  String get are_you_sure_want_to_delete;

  /// No description provided for @delete_product_from_cart_description.
  ///
  /// In en, this message translates to:
  /// **'By deleting this, you will delete all relevent data connected to this'**
  String get delete_product_from_cart_description;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @contact_us.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contact_us;

  /// No description provided for @contact_us_message.
  ///
  /// In en, this message translates to:
  /// **'Let’s get connect if you have any queries. We are happy to help you anytime.'**
  String get contact_us_message;

  /// No description provided for @email_id.
  ///
  /// In en, this message translates to:
  /// **'Email Id'**
  String get email_id;

  /// No description provided for @enter_your_email_id.
  ///
  /// In en, this message translates to:
  /// **'Enter your email id'**
  String get enter_your_email_id;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @message_description.
  ///
  /// In en, this message translates to:
  /// **'Write description...'**
  String get message_description;

  /// No description provided for @attachment.
  ///
  /// In en, this message translates to:
  /// **'Attachments (Up to 5)'**
  String get attachment;

  /// No description provided for @choose_a_file.
  ///
  /// In en, this message translates to:
  /// **'Choose a file or drag and drop here'**
  String get choose_a_file;

  /// No description provided for @supported_format.
  ///
  /// In en, this message translates to:
  /// **'Supported JPG,PNG,PDF. Maximum file size 10mb'**
  String get supported_format;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @alright.
  ///
  /// In en, this message translates to:
  /// **'Alright !'**
  String get alright;

  /// No description provided for @response_received.
  ///
  /// In en, this message translates to:
  /// **'We have received your response and will revert back to you as soon as possible.'**
  String get response_received;

  /// No description provided for @back_to_home.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get back_to_home;

  /// No description provided for @name_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get name_required;

  /// No description provided for @name_cannot_be_empty.
  ///
  /// In en, this message translates to:
  /// **'Name can\'t be empty'**
  String get name_cannot_be_empty;

  /// No description provided for @message_cannot_be_empty.
  ///
  /// In en, this message translates to:
  /// **'Message can\'t be empty'**
  String get message_cannot_be_empty;

  /// No description provided for @pick_image_error.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while picking images. Please try again.'**
  String get pick_image_error;

  /// No description provided for @pick_file_error.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while picking files. Please try again.'**
  String get pick_file_error;

  /// No description provided for @file_too_large_error.
  ///
  /// In en, this message translates to:
  /// **'One or more selected files exceed the 5MB limit.'**
  String get file_too_large_error;

  /// No description provided for @file_cannot_be_empty.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one file'**
  String get file_cannot_be_empty;

  /// No description provided for @take_a_photo.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get take_a_photo;

  /// No description provided for @upload_from_gallery.
  ///
  /// In en, this message translates to:
  /// **'Upload from gallery'**
  String get upload_from_gallery;

  /// No description provided for @upload_from_files.
  ///
  /// In en, this message translates to:
  /// **'Upload from files'**
  String get upload_from_files;

  /// No description provided for @file_empty_error.
  ///
  /// In en, this message translates to:
  /// **'The selected PDF file is empty. Please choose a valid file.'**
  String get file_empty_error;

  /// No description provided for @no_result_for.
  ///
  /// In en, this message translates to:
  /// **'No results for \"{searchText}\"'**
  String no_result_for(Object searchText);

  /// No description provided for @no_search_result_message.
  ///
  /// In en, this message translates to:
  /// **'We couldn’t found any result related to your search. Try searching for something else.'**
  String get no_search_result_message;

  /// No description provided for @no_internet_connection.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection'**
  String get no_internet_connection;

  /// No description provided for @empty_wishlist_title.
  ///
  /// In en, this message translates to:
  /// **'Your Wishlist is empty!'**
  String get empty_wishlist_title;

  /// No description provided for @empty_wishlist_message.
  ///
  /// In en, this message translates to:
  /// **'You have not added any product to your wishlist. Explore products to add in your wishlist.'**
  String get empty_wishlist_message;

  /// No description provided for @wishlist.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishlist;

  /// No description provided for @empty_notifications_title.
  ///
  /// In en, this message translates to:
  /// **'No Notifications Yet'**
  String get empty_notifications_title;

  /// No description provided for @server_error_title.
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get server_error_title;

  /// No description provided for @server_error_description.
  ///
  /// In en, this message translates to:
  /// **'There is server error at the moment, please check back later'**
  String get server_error_description;

  /// No description provided for @try_again.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get try_again;

  /// No description provided for @server_error.
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get server_error;

  /// No description provided for @lost_connection.
  ///
  /// In en, this message translates to:
  /// **'You Lost Connection'**
  String get lost_connection;

  /// No description provided for @lost_connection_message.
  ///
  /// In en, this message translates to:
  /// **'Seems like you have lost internet connection'**
  String get lost_connection_message;

  /// No description provided for @under_maintenance.
  ///
  /// In en, this message translates to:
  /// **'App is Under Maintenance !'**
  String get under_maintenance;

  /// No description provided for @under_maintenance_message.
  ///
  /// In en, this message translates to:
  /// **'App is currently under maintenance. We will notify you once we are done. Try again later.'**
  String get under_maintenance_message;

  /// No description provided for @no_chats.
  ///
  /// In en, this message translates to:
  /// **'No Chats'**
  String get no_chats;

  /// No description provided for @empty_order_title.
  ///
  /// In en, this message translates to:
  /// **'No Orders Found'**
  String get empty_order_title;

  /// No description provided for @empty_order_message.
  ///
  /// In en, this message translates to:
  /// **'There is no single item here. Explore products to add in your cart.'**
  String get empty_order_message;

  /// No description provided for @empty_cards_list_title.
  ///
  /// In en, this message translates to:
  /// **'No Saved Card'**
  String get empty_cards_list_title;

  /// No description provided for @empty_cards_list_message.
  ///
  /// In en, this message translates to:
  /// **'There is no card available at the moment.'**
  String get empty_cards_list_message;

  /// No description provided for @unsupported_file_format_error.
  ///
  /// In en, this message translates to:
  /// **'The selected file is not a valid PDF. Please choose a proper PDF file to continue.'**
  String get unsupported_file_format_error;

  /// No description provided for @image_cannot_be_empty.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one image'**
  String get image_cannot_be_empty;

  /// No description provided for @notifications_not_available.
  ///
  /// In en, this message translates to:
  /// **'Notifications not available'**
  String get notifications_not_available;

  /// No description provided for @notifications_delete_successfully.
  ///
  /// In en, this message translates to:
  /// **'Notification Delete Successfully'**
  String get notifications_delete_successfully;

  /// No description provided for @internet_not_available.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection Found \nPlease check your inernet connection'**
  String get internet_not_available;

  /// No description provided for @opps_something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Opps Something Went Wrong'**
  String get opps_something_went_wrong;

  /// No description provided for @view_product_reviews.
  ///
  /// In en, this message translates to:
  /// **'View Product Reviews'**
  String get view_product_reviews;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @ratingWithCount.
  ///
  /// In en, this message translates to:
  /// **'{count} {count, plural, =1{Rating} other{Ratings}}'**
  String ratingWithCount(num count);

  /// No description provided for @write_a_review.
  ///
  /// In en, this message translates to:
  /// **'Write a Review'**
  String get write_a_review;

  /// No description provided for @star.
  ///
  /// In en, this message translates to:
  /// **'Star'**
  String get star;

  /// No description provided for @star_count.
  ///
  /// In en, this message translates to:
  /// **'{count} Star'**
  String star_count(Object count);

  /// No description provided for @no_reviews_found.
  ///
  /// In en, this message translates to:
  /// **'No reviews available for this product.'**
  String get no_reviews_found;

  /// No description provided for @add_photo_or_video.
  ///
  /// In en, this message translates to:
  /// **'Add a photo or video'**
  String get add_photo_or_video;

  /// No description provided for @write_your_review.
  ///
  /// In en, this message translates to:
  /// **'Write your review'**
  String get write_your_review;

  /// No description provided for @review_submited_message.
  ///
  /// In en, this message translates to:
  /// **'Your review has been submitted successfully.'**
  String get review_submited_message;

  /// No description provided for @notification_settings.
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get notification_settings;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get change_password;

  /// No description provided for @choose_app_theme.
  ///
  /// In en, this message translates to:
  /// **'Choose App Theme'**
  String get choose_app_theme;

  /// No description provided for @account_and_privacy.
  ///
  /// In en, this message translates to:
  /// **'Account & Privacy'**
  String get account_and_privacy;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account;

  /// No description provided for @delete_reason_do_not_need_anymore.
  ///
  /// In en, this message translates to:
  /// **'I don\'t need it anymore'**
  String get delete_reason_do_not_need_anymore;

  /// No description provided for @delete_reason_product_no_more_relevant.
  ///
  /// In en, this message translates to:
  /// **'Products are no more relevant to me'**
  String get delete_reason_product_no_more_relevant;

  /// No description provided for @delete_reason_dislike_app.
  ///
  /// In en, this message translates to:
  /// **'I don’t like to be on this app'**
  String get delete_reason_dislike_app;

  /// No description provided for @delete_reason_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get delete_reason_other;

  /// No description provided for @delete_reason_title.
  ///
  /// In en, this message translates to:
  /// **'Why are you deleting account?'**
  String get delete_reason_title;

  /// No description provided for @specify_reason.
  ///
  /// In en, this message translates to:
  /// **'Please specify your reason'**
  String get specify_reason;

  /// No description provided for @delete_warning_title.
  ///
  /// In en, this message translates to:
  /// **'Deleting account will do the following :'**
  String get delete_warning_title;

  /// No description provided for @delete_warning_products_chats.
  ///
  /// In en, this message translates to:
  /// **'Saved products, chats will be deleted'**
  String get delete_warning_products_chats;

  /// No description provided for @delete_warning_account_info.
  ///
  /// In en, this message translates to:
  /// **'Delete all of your account information'**
  String get delete_warning_account_info;

  /// No description provided for @account_deleted.
  ///
  /// In en, this message translates to:
  /// **'Account Deleted!'**
  String get account_deleted;

  /// No description provided for @something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get something_went_wrong;

  /// No description provided for @delete_account_failed.
  ///
  /// In en, this message translates to:
  /// **'Account deletion failed. Please try again.'**
  String get delete_account_failed;

  /// No description provided for @no_user_found.
  ///
  /// In en, this message translates to:
  /// **'No user found.'**
  String get no_user_found;

  /// No description provided for @reauth_required.
  ///
  /// In en, this message translates to:
  /// **'Please re-authenticate to delete your account.'**
  String get reauth_required;

  /// No description provided for @creating_new_account.
  ///
  /// In en, this message translates to:
  /// **'Creating new account?'**
  String get creating_new_account;

  /// No description provided for @delete_account_confirmation_message.
  ///
  /// In en, this message translates to:
  /// **'This action is irreversible. All your data will be permanently deleted. Are you sure you want to proceed?'**
  String get delete_account_confirmation_message;

  /// No description provided for @its_time_to_update.
  ///
  /// In en, this message translates to:
  /// **'It’s time to Update!'**
  String get its_time_to_update;

  /// No description provided for @update_required_description.
  ///
  /// In en, this message translates to:
  /// **'The version you are using is old, to continue using you need to update the latest version in order to experience new features.'**
  String get update_required_description;

  /// No description provided for @update_now.
  ///
  /// In en, this message translates to:
  /// **'Update Now'**
  String get update_now;

  /// No description provided for @skip_update.
  ///
  /// In en, this message translates to:
  /// **'Skip Update'**
  String get skip_update;

  /// No description provided for @platform_not_supported.
  ///
  /// In en, this message translates to:
  /// **'Platform not supported'**
  String get platform_not_supported;

  /// No description provided for @could_not_launch_store_link.
  ///
  /// In en, this message translates to:
  /// **'Could not launch store link'**
  String get could_not_launch_store_link;

  /// No description provided for @microphone_permission_permanently_denied.
  ///
  /// In en, this message translates to:
  /// **'Microphone permission is permanently denied. Please go to settings and enable it.'**
  String get microphone_permission_permanently_denied;

  /// No description provided for @firebase_error.
  ///
  /// In en, this message translates to:
  /// **'Firebase error'**
  String get firebase_error;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
