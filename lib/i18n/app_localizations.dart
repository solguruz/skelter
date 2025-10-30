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

  /// No description provided for @common_keys.
  ///
  /// In en, this message translates to:
  /// **'================ COMMON KEYS ================'**
  String get common_keys;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @opps_something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Opps Something Went Wrong'**
  String get opps_something_went_wrong;

  /// No description provided for @time_date_keys.
  ///
  /// In en, this message translates to:
  /// **'================ TIME & DATE KEYS ================'**
  String get time_date_keys;

  /// Indicates how many days ago
  ///
  /// In en, this message translates to:
  /// **'{count} days ago'**
  String daysAgo(int count);

  /// Indicates how many hours ago
  ///
  /// In en, this message translates to:
  /// **'{count} hrs ago'**
  String hoursAgo(int count);

  /// No description provided for @justNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get justNow;

  /// No description provided for @lastMonth.
  ///
  /// In en, this message translates to:
  /// **'Last month'**
  String get lastMonth;

  /// No description provided for @lastYear.
  ///
  /// In en, this message translates to:
  /// **'Last year'**
  String get lastYear;

  /// Indicates how many minutes ago
  ///
  /// In en, this message translates to:
  /// **'{count} min ago'**
  String minutesAgo(int count);

  /// Indicates how many months ago
  ///
  /// In en, this message translates to:
  /// **'{count} months ago'**
  String monthsAgo(int count);

  /// No description provided for @oneHourAgo.
  ///
  /// In en, this message translates to:
  /// **'1 hr ago'**
  String get oneHourAgo;

  /// No description provided for @oneMinuteAgo.
  ///
  /// In en, this message translates to:
  /// **'1 min ago'**
  String get oneMinuteAgo;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// Indicates how many years ago
  ///
  /// In en, this message translates to:
  /// **'{count} years ago'**
  String yearsAgo(int count);

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @login_keys.
  ///
  /// In en, this message translates to:
  /// **'================ LOGIN KEYS ================'**
  String get login_keys;

  /// No description provided for @ask_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get ask_forgot_password;

  /// No description provided for @check_your_email.
  ///
  /// In en, this message translates to:
  /// **'Check Your Email'**
  String get check_your_email;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @login_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get login_continue;

  /// No description provided for @continue_with_apple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continue_with_apple;

  /// No description provided for @continue_with_email.
  ///
  /// In en, this message translates to:
  /// **'Continue with Email'**
  String get continue_with_email;

  /// No description provided for @continue_with_google.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continue_with_google;

  /// No description provided for @continue_with_number.
  ///
  /// In en, this message translates to:
  /// **'Continue with Phone Number'**
  String get continue_with_number;

  /// No description provided for @enter_otp.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get enter_otp;

  /// No description provided for @enter_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get enter_phone_number;

  /// No description provided for @enter_your_registered_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Enter your registered phone number'**
  String get enter_your_registered_phone_number;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgot_password;

  /// No description provided for @invalid_mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Invalid mobile number'**
  String get invalid_mobile_number;

  /// Email where reset link has been sent
  ///
  /// In en, this message translates to:
  /// **'A reset link has been sent to {email}. Please check your inbox and click the link to reset the password.'**
  String link_send_info(String email);

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @login_with_email.
  ///
  /// In en, this message translates to:
  /// **'Login with email'**
  String get login_with_email;

  /// No description provided for @send_otp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get send_otp;

  /// No description provided for @send_reset_link.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get send_reset_link;

  /// No description provided for @sent_code_info.
  ///
  /// In en, this message translates to:
  /// **'We’ve sent a 6-digit code to'**
  String get sent_code_info;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get welcome_back;

  /// No description provided for @signup_keys.
  ///
  /// In en, this message translates to:
  /// **'================ SIGNUP KEYS ================'**
  String get signup_keys;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get already_have_account;

  /// No description provided for @back_to_login.
  ///
  /// In en, this message translates to:
  /// **'Back to login'**
  String get back_to_login;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirm_password;

  /// No description provided for @confirm_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter confirm password'**
  String get confirm_password_hint;

  /// No description provided for @change_email.
  ///
  /// In en, this message translates to:
  /// **' Change Email'**
  String get change_email;

  /// No description provided for @create_your_password.
  ///
  /// In en, this message translates to:
  /// **'Create your password'**
  String get create_your_password;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @email_cant_be_empty.
  ///
  /// In en, this message translates to:
  /// **'Email can’t be empty'**
  String get email_cant_be_empty;

  /// No description provided for @email_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get email_hint;

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

  /// No description provided for @enter_your_name.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enter_your_name;

  /// No description provided for @entered_wrong_email.
  ///
  /// In en, this message translates to:
  /// **'Entered the wrong email?'**
  String get entered_wrong_email;

  /// No description provided for @error_enter_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter confirm password'**
  String get error_enter_confirm_password;

  /// No description provided for @error_retrieving_email.
  ///
  /// In en, this message translates to:
  /// **'Error retrieving your email'**
  String get error_retrieving_email;

  /// No description provided for @error_retrieving_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Error retrieving your phone number'**
  String get error_retrieving_phone_number;

  /// No description provided for @invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalid_email;

  /// No description provided for @lets_get_started.
  ///
  /// In en, this message translates to:
  /// **'Let\'s get started'**
  String get lets_get_started;

  /// No description provided for @lets_get_started_info.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number, we will send you a verification code'**
  String get lets_get_started_info;

  /// Email where verification link has been sent
  ///
  /// In en, this message translates to:
  /// **'A verification link has been sent to {email}. Click the link to verify your account.'**
  String link_verify_info(String email);

  /// No description provided for @mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get mobile_number;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @name_cannot_be_empty.
  ///
  /// In en, this message translates to:
  /// **'Name can\'t be empty'**
  String get name_cannot_be_empty;

  /// No description provided for @no_account.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account? '**
  String get no_account;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @password_cant_be_empty.
  ///
  /// In en, this message translates to:
  /// **'Password can\'t be empty'**
  String get password_cant_be_empty;

  /// No description provided for @password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get password_hint;

  /// No description provided for @password_requirements.
  ///
  /// In en, this message translates to:
  /// **'Your password must have at least:'**
  String get password_requirements;

  /// No description provided for @password_requirements_length.
  ///
  /// In en, this message translates to:
  /// **'8 characters or more'**
  String get password_requirements_length;

  /// No description provided for @password_requirements_letter_number.
  ///
  /// In en, this message translates to:
  /// **'1 letter and number'**
  String get password_requirements_letter_number;

  /// No description provided for @password_requirements_special_char.
  ///
  /// In en, this message translates to:
  /// **'1 special character (Example: # ? ! \$ & @)'**
  String get password_requirements_special_char;

  /// No description provided for @password_strength.
  ///
  /// In en, this message translates to:
  /// **'Password strength:'**
  String get password_strength;

  /// No description provided for @passwords_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwords_do_not_match;

  /// No description provided for @phone_no_verified.
  ///
  /// In en, this message translates to:
  /// **'Phone number verified!'**
  String get phone_no_verified;

  /// No description provided for @phone_no_verified_info.
  ///
  /// In en, this message translates to:
  /// **'Your Phone number has been successfully verified. You can now complete your profile.'**
  String get phone_no_verified_info;

  /// No description provided for @poor.
  ///
  /// In en, this message translates to:
  /// **'Poor'**
  String get poor;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get sign_up;

  /// No description provided for @sign_up_with_apple.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Apple'**
  String get sign_up_with_apple;

  /// No description provided for @sign_up_with_email.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Email'**
  String get sign_up_with_email;

  /// No description provided for @sign_up_with_google.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get sign_up_with_google;

  /// No description provided for @strong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get strong;

  /// No description provided for @terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get terms_and_conditions;

  /// No description provided for @user_info_not_retrieved.
  ///
  /// In en, this message translates to:
  /// **'User information could not be retrieved.'**
  String get user_info_not_retrieved;

  /// No description provided for @weak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get weak;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @verify_email_keys.
  ///
  /// In en, this message translates to:
  /// **'================ VERIFY EMAIL KEYS ================'**
  String get verify_email_keys;

  /// No description provided for @resend_verification_email.
  ///
  /// In en, this message translates to:
  /// **'Resend Verification Email'**
  String get resend_verification_email;

  /// No description provided for @verify_your_email.
  ///
  /// In en, this message translates to:
  /// **'Verify your email'**
  String get verify_your_email;

  /// No description provided for @profile_keys.
  ///
  /// In en, this message translates to:
  /// **'================ PROFILE KEYS ================'**
  String get profile_keys;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @add_a_profile_picture.
  ///
  /// In en, this message translates to:
  /// **'Add a profile picture'**
  String get add_a_profile_picture;

  /// No description provided for @personal_details.
  ///
  /// In en, this message translates to:
  /// **'Personal Details'**
  String get personal_details;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @help_and_support.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get help_and_support;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @sign_out.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get sign_out;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @community.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get community;

  /// No description provided for @feedback_and_ratings.
  ///
  /// In en, this message translates to:
  /// **'Feedback & Ratings'**
  String get feedback_and_ratings;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @delete_account_keys.
  ///
  /// In en, this message translates to:
  /// **'================ DELETE ACCOUNT KEYS ================'**
  String get delete_account_keys;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account;

  /// No description provided for @delete_account_alert_title.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to Delete Account?'**
  String get delete_account_alert_title;

  /// No description provided for @delete_account_confirmation_message.
  ///
  /// In en, this message translates to:
  /// **'This action is irreversible. All your data will be permanently deleted. Are you sure you want to proceed?'**
  String get delete_account_confirmation_message;

  /// No description provided for @delete_reason_dislike_app.
  ///
  /// In en, this message translates to:
  /// **'I don’t like to be on this app'**
  String get delete_reason_dislike_app;

  /// No description provided for @delete_reason_do_not_need_anymore.
  ///
  /// In en, this message translates to:
  /// **'I don\'t need it anymore'**
  String get delete_reason_do_not_need_anymore;

  /// No description provided for @delete_reason_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get delete_reason_other;

  /// No description provided for @delete_reason_product_no_more_relevant.
  ///
  /// In en, this message translates to:
  /// **'Products are no more relevant to me'**
  String get delete_reason_product_no_more_relevant;

  /// No description provided for @delete_reason_title.
  ///
  /// In en, this message translates to:
  /// **'Why are you deleting account?'**
  String get delete_reason_title;

  /// No description provided for @delete_warning_account_info.
  ///
  /// In en, this message translates to:
  /// **'Delete all of your account information'**
  String get delete_warning_account_info;

  /// No description provided for @delete_warning_products_chats.
  ///
  /// In en, this message translates to:
  /// **'Saved products, chats will be deleted'**
  String get delete_warning_products_chats;

  /// No description provided for @delete_warning_title.
  ///
  /// In en, this message translates to:
  /// **'Deleting account will do the following :'**
  String get delete_warning_title;

  /// No description provided for @please_select_at_least_one_reason.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one reason'**
  String get please_select_at_least_one_reason;

  /// No description provided for @please_specify_your_reason.
  ///
  /// In en, this message translates to:
  /// **'Please specify your reason'**
  String get please_specify_your_reason;

  /// No description provided for @specify_reason.
  ///
  /// In en, this message translates to:
  /// **'Please specify your reason'**
  String get specify_reason;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @account_delete_success_keys.
  ///
  /// In en, this message translates to:
  /// **'================ ACCOUNT DELETE SUCCESS KEYS ================'**
  String get account_delete_success_keys;

  /// No description provided for @account_deleted.
  ///
  /// In en, this message translates to:
  /// **'Account Deleted!'**
  String get account_deleted;

  /// No description provided for @creating_new_account.
  ///
  /// In en, this message translates to:
  /// **'Creating new account?'**
  String get creating_new_account;

  /// No description provided for @shipping_address_keys.
  ///
  /// In en, this message translates to:
  /// **'================ SHIPPING ADDRESS KEYS ================'**
  String get shipping_address_keys;

  /// No description provided for @add_new_address.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get add_new_address;

  /// No description provided for @add_shipping_details.
  ///
  /// In en, this message translates to:
  /// **'Add Shipping Details'**
  String get add_shipping_details;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @deliver_to.
  ///
  /// In en, this message translates to:
  /// **'Deliver to'**
  String get deliver_to;

  /// No description provided for @enter_your_address.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Address'**
  String get enter_your_address;

  /// No description provided for @enter_zip_code.
  ///
  /// In en, this message translates to:
  /// **'Enter Zip Code'**
  String get enter_zip_code;

  /// No description provided for @select_address.
  ///
  /// In en, this message translates to:
  /// **'Select Address'**
  String get select_address;

  /// No description provided for @select_city.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get select_city;

  /// No description provided for @select_country.
  ///
  /// In en, this message translates to:
  /// **'Select Country'**
  String get select_country;

  /// No description provided for @select_state.
  ///
  /// In en, this message translates to:
  /// **'Select State'**
  String get select_state;

  /// No description provided for @set_as_default_address.
  ///
  /// In en, this message translates to:
  /// **'Set as Default Address'**
  String get set_as_default_address;

  /// No description provided for @shipping_address.
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get shipping_address;

  /// No description provided for @shipping_details.
  ///
  /// In en, this message translates to:
  /// **'Shipping Details'**
  String get shipping_details;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @use_current_location.
  ///
  /// In en, this message translates to:
  /// **'Use Current Location'**
  String get use_current_location;

  /// No description provided for @zip_code.
  ///
  /// In en, this message translates to:
  /// **'Zip Code'**
  String get zip_code;

  /// No description provided for @checkout_keys.
  ///
  /// In en, this message translates to:
  /// **'================ CHECKOUT KEYS ================'**
  String get checkout_keys;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

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

  /// No description provided for @cash_on_delivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery'**
  String get cash_on_delivery;

  /// No description provided for @confirm_and_pay.
  ///
  /// In en, this message translates to:
  /// **'Confirm and Pay'**
  String get confirm_and_pay;

  /// No description provided for @delivery_charges.
  ///
  /// In en, this message translates to:
  /// **'Delivery Charges'**
  String get delivery_charges;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @expected_delivery_by.
  ///
  /// In en, this message translates to:
  /// **'Expected Delivery by'**
  String get expected_delivery_by;

  /// No description provided for @order_review.
  ///
  /// In en, this message translates to:
  /// **'Order Review'**
  String get order_review;

  /// No description provided for @order_summary.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get order_summary;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// Total products count with correct plural form
  ///
  /// In en, this message translates to:
  /// **'Price({total_product, plural, =1{{total_product} item} other{{total_product} items}})'**
  String price_of_items(int total_product);

  /// No description provided for @select_and_review_order.
  ///
  /// In en, this message translates to:
  /// **'Select & Review Order'**
  String get select_and_review_order;

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

  /// No description provided for @shipping.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get shipping;

  /// No description provided for @total_amount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get total_amount;

  /// No description provided for @your_cart_is_empty.
  ///
  /// In en, this message translates to:
  /// **'Your Cart is Empty !'**
  String get your_cart_is_empty;

  /// No description provided for @coupons_keys.
  ///
  /// In en, this message translates to:
  /// **'================ COUPONS KEYS ================'**
  String get coupons_keys;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @apply_coupon.
  ///
  /// In en, this message translates to:
  /// **'Apply Coupon'**
  String get apply_coupon;

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

  /// No description provided for @search_by_name_or_code.
  ///
  /// In en, this message translates to:
  /// **'Search by name or code'**
  String get search_by_name_or_code;

  /// No description provided for @home_keys.
  ///
  /// In en, this message translates to:
  /// **'================ HOME KEYS ================'**
  String get home_keys;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @pro.
  ///
  /// In en, this message translates to:
  /// **'PRO'**
  String get pro;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @see_all.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get see_all;

  /// No description provided for @star.
  ///
  /// In en, this message translates to:
  /// **'Star'**
  String get star;

  /// No description provided for @top_products.
  ///
  /// In en, this message translates to:
  /// **'Top Products'**
  String get top_products;

  /// No description provided for @no_result_for.
  ///
  /// In en, this message translates to:
  /// **'No results for \"{searchText}\"'**
  String no_result_for(Object searchText);

  /// No description provided for @no_search_result_message.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t found any result related to your search. Try searching for something else.'**
  String get no_search_result_message;

  /// No description provided for @microphone_permission_permanently_denied.
  ///
  /// In en, this message translates to:
  /// **'Microphone permission is permanently denied. Please go to settings and enable it.'**
  String get microphone_permission_permanently_denied;

  /// No description provided for @wishlist_keys.
  ///
  /// In en, this message translates to:
  /// **'================ WISHLIST KEYS ================'**
  String get wishlist_keys;

  /// No description provided for @wishlist.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishlist;

  /// No description provided for @empty_wishlist_message.
  ///
  /// In en, this message translates to:
  /// **'You have not added any product to your wishlist. Explore products to add in your wishlist.'**
  String get empty_wishlist_message;

  /// No description provided for @empty_wishlist_title.
  ///
  /// In en, this message translates to:
  /// **'Your Wishlist is empty!'**
  String get empty_wishlist_title;

  /// No description provided for @chat_keys.
  ///
  /// In en, this message translates to:
  /// **'================ CHAT KEYS ================'**
  String get chat_keys;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get you;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// Error shown when user input exceeds maximum allowed length
  ///
  /// In en, this message translates to:
  /// **'Your message is too long (max {maxLength} characters)'**
  String messageTooLong(int maxLength);

  /// No description provided for @message_cannot_be_empty.
  ///
  /// In en, this message translates to:
  /// **'Message can\'t be empty'**
  String get message_cannot_be_empty;

  /// No description provided for @message_description.
  ///
  /// In en, this message translates to:
  /// **'Write description...'**
  String get message_description;

  /// No description provided for @no_chats.
  ///
  /// In en, this message translates to:
  /// **'No Chats'**
  String get no_chats;

  /// No description provided for @send_a_new_message.
  ///
  /// In en, this message translates to:
  /// **'Send a new message'**
  String get send_a_new_message;

  /// No description provided for @contact_us_keys.
  ///
  /// In en, this message translates to:
  /// **'================ CONTACT US KEYS ================'**
  String get contact_us_keys;

  /// No description provided for @attachment.
  ///
  /// In en, this message translates to:
  /// **'Attachments (Up to 5)'**
  String get attachment;

  /// No description provided for @alright.
  ///
  /// In en, this message translates to:
  /// **'Alright !'**
  String get alright;

  /// No description provided for @choose_a_file.
  ///
  /// In en, this message translates to:
  /// **'Choose a file or drag and drop here'**
  String get choose_a_file;

  /// No description provided for @contact_us.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contact_us;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @contact_us_message.
  ///
  /// In en, this message translates to:
  /// **'Let’s get connect if you have any queries. We are happy to help you anytime.'**
  String get contact_us_message;

  /// No description provided for @file_cannot_be_empty.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one file'**
  String get file_cannot_be_empty;

  /// No description provided for @file_empty_error.
  ///
  /// In en, this message translates to:
  /// **'The selected PDF file is empty. Please choose a valid file.'**
  String get file_empty_error;

  /// No description provided for @file_too_large_error.
  ///
  /// In en, this message translates to:
  /// **'One or more selected files exceed the 5MB limit.'**
  String get file_too_large_error;

  /// No description provided for @pick_file_error.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while picking files. Please try again.'**
  String get pick_file_error;

  /// No description provided for @pick_image_error.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while picking images. Please try again.'**
  String get pick_image_error;

  /// No description provided for @pick_pdf_error.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while picking PDFs. Please try again.'**
  String get pick_pdf_error;

  /// No description provided for @response_received.
  ///
  /// In en, this message translates to:
  /// **'We have received your response and will revert back to you as soon as possible.'**
  String get response_received;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @supported_format.
  ///
  /// In en, this message translates to:
  /// **'Supported JPG,PNG,PDF. Maximum file size 10mb'**
  String get supported_format;

  /// No description provided for @take_a_photo.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get take_a_photo;

  /// No description provided for @unsupported_file_format_error.
  ///
  /// In en, this message translates to:
  /// **'The selected file is not a valid PDF. Please choose a proper PDF file to continue.'**
  String get unsupported_file_format_error;

  /// No description provided for @upload_from_files.
  ///
  /// In en, this message translates to:
  /// **'Upload from files'**
  String get upload_from_files;

  /// No description provided for @upload_from_gallery.
  ///
  /// In en, this message translates to:
  /// **'Upload from gallery'**
  String get upload_from_gallery;

  /// No description provided for @notifications_keys.
  ///
  /// In en, this message translates to:
  /// **'================ NOTIFICATIONS KEYS ================'**
  String get notifications_keys;

  /// No description provided for @notifications_delete_successfully.
  ///
  /// In en, this message translates to:
  /// **'Notification Delete Successfully'**
  String get notifications_delete_successfully;

  /// No description provided for @empty_notifications_title.
  ///
  /// In en, this message translates to:
  /// **'No Notifications Yet'**
  String get empty_notifications_title;

  /// No description provided for @settings_keys.
  ///
  /// In en, this message translates to:
  /// **'================ SETTINGS KEYS ================'**
  String get settings_keys;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

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

  /// No description provided for @saved_cards_keys.
  ///
  /// In en, this message translates to:
  /// **'================ SAVED CARDS KEYS ================'**
  String get saved_cards_keys;

  /// No description provided for @empty_cards_list_message.
  ///
  /// In en, this message translates to:
  /// **'There is no card available at the moment.'**
  String get empty_cards_list_message;

  /// No description provided for @empty_cards_list_title.
  ///
  /// In en, this message translates to:
  /// **'No Saved Card'**
  String get empty_cards_list_title;

  /// No description provided for @explore_products.
  ///
  /// In en, this message translates to:
  /// **'Explore Products'**
  String get explore_products;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @empty_screens_keys.
  ///
  /// In en, this message translates to:
  /// **'================ EMPTY SCREENS KEYS ================'**
  String get empty_screens_keys;

  /// No description provided for @empty_cart_message.
  ///
  /// In en, this message translates to:
  /// **'There is no single item here. Explore products to add in your cart.'**
  String get empty_cart_message;

  /// No description provided for @empty_order_message.
  ///
  /// In en, this message translates to:
  /// **'There is no single item here. Explore products to add in your cart.'**
  String get empty_order_message;

  /// No description provided for @empty_order_title.
  ///
  /// In en, this message translates to:
  /// **'No Orders Found'**
  String get empty_order_title;

  /// No description provided for @force_update_keys.
  ///
  /// In en, this message translates to:
  /// **'================ FORCE UPDATE KEYS ================'**
  String get force_update_keys;

  /// No description provided for @could_not_launch_store_link.
  ///
  /// In en, this message translates to:
  /// **'Could not launch store link'**
  String get could_not_launch_store_link;

  /// No description provided for @its_time_to_update.
  ///
  /// In en, this message translates to:
  /// **'It’s time to Update!'**
  String get its_time_to_update;

  /// No description provided for @skip_update.
  ///
  /// In en, this message translates to:
  /// **'Skip Update'**
  String get skip_update;

  /// No description provided for @update_app.
  ///
  /// In en, this message translates to:
  /// **'Update App'**
  String get update_app;

  /// No description provided for @update_now.
  ///
  /// In en, this message translates to:
  /// **'Update Now'**
  String get update_now;

  /// No description provided for @update_required_description.
  ///
  /// In en, this message translates to:
  /// **'The version you are using is old, to continue using you need to update the latest version in order to experience new features.'**
  String get update_required_description;

  /// No description provided for @under_maintenance_keys.
  ///
  /// In en, this message translates to:
  /// **'================ UNDER MAINTENANCE KEYS ================'**
  String get under_maintenance_keys;

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

  /// No description provided for @no_internet_keys.
  ///
  /// In en, this message translates to:
  /// **'================ NO INTERNET KEYS ================'**
  String get no_internet_keys;

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

  /// No description provided for @no_internet_connection.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection'**
  String get no_internet_connection;

  /// No description provided for @server_error_keys.
  ///
  /// In en, this message translates to:
  /// **'================ SERVER ERROR KEYS ================'**
  String get server_error_keys;

  /// No description provided for @server_error.
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get server_error;

  /// No description provided for @server_error_description.
  ///
  /// In en, this message translates to:
  /// **'There is server error at the moment, please check back later'**
  String get server_error_description;

  /// No description provided for @server_error_title.
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get server_error_title;

  /// No description provided for @back_to_home.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get back_to_home;

  /// No description provided for @ssl_pinning_keys.
  ///
  /// In en, this message translates to:
  /// **'================ SSL PINNING KEYS ================'**
  String get ssl_pinning_keys;

  /// No description provided for @platform_not_supported.
  ///
  /// In en, this message translates to:
  /// **'Platform not supported'**
  String get platform_not_supported;

  /// No description provided for @secure_connection_failed_message.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t connect securely to our server. Please try again later, or check if app update available.'**
  String get secure_connection_failed_message;

  /// No description provided for @secure_connection_failed_title.
  ///
  /// In en, this message translates to:
  /// **'Secure Connection Failed!'**
  String get secure_connection_failed_title;

  /// No description provided for @try_again.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get try_again;

  /// No description provided for @product_detail_keys.
  ///
  /// In en, this message translates to:
  /// **'================ Product Detail Keys ================'**
  String get product_detail_keys;

  /// No description provided for @product_information.
  ///
  /// In en, this message translates to:
  /// **'Product Information'**
  String get product_information;

  /// No description provided for @add_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get add_to_cart;

  /// No description provided for @mark_favorite.
  ///
  /// In en, this message translates to:
  /// **'Mark Favorite'**
  String get mark_favorite;

  /// No description provided for @inclusive_of_taxes.
  ///
  /// In en, this message translates to:
  /// **'(incl. of all taxes)'**
  String get inclusive_of_taxes;

  /// No description provided for @product_photos.
  ///
  /// In en, this message translates to:
  /// **'Product Photos'**
  String get product_photos;

  /// No description provided for @view_product_reviews.
  ///
  /// In en, this message translates to:
  /// **'View Product Reviews'**
  String get view_product_reviews;
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
