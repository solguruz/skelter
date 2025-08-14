// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login_signup_signup => 'Sign up';

  @override
  String get login_signup_accountNotFoundSignupMessage =>
      'Account not found. Please sign up to create a new account.';

  @override
  String get login_signup_invalidEmailAddressErrorMessage =>
      'Please enter a valid email address';

  @override
  String get login_signup_sendPasswordResetLinkButton =>
      'Send password reset link';

  @override
  String get login_signup_needMoreHelp => 'Need more help?';

  @override
  String get login_signup_passwordResetLinkSentMessage =>
      'Password reset link sent!';

  @override
  String get login_signup_checkEmailInstructionsMessage =>
      'Please check your inbox and follow the\ninstructions in the email';

  @override
  String get login_signup_goBackToSignIn => 'Go back to Sign in';

  @override
  String get login_signup_cap_help => 'Help';

  @override
  String get login_signup_birthdayQuestionPrompt => 'When\'s your birthday?';

  @override
  String get login_signup_cap_birthdate => 'Birthdate';

  @override
  String get login_signup_passionsQuestionPrompt => 'What are your passions?';

  @override
  String get login_signup_interestsSelectionPrompt =>
      'Choose some interests to help us curate your feed and recommendations';

  @override
  String get login_signup_pronounsQuestionPrompt => 'What are your pronouns?';

  @override
  String get login_signup_cap_skip => 'Skip';

  @override
  String get login_signup_setUpYourProfile => 'Create your profile';

  @override
  String get login_signup_addAProfilePicture => 'Add a profile picture';

  @override
  String get login_signup_cap_save => 'Save';

  @override
  String get login_signup_realPhotoRecognitionPrompt =>
      'Help your friends recognize you by using a real photo of yourself';

  @override
  String get login_signup_emailVerificationRequired =>
      'Email Verification Required';

  @override
  String get login_signup_verificationEmailSentMessage =>
      'We\'ve sent you a verification email. Please verify your account.';

  @override
  String get login_signup_cap_submit => 'Submit';

  @override
  String get login_signup_forgotPassword => 'Forgot password?';

  @override
  String get login_signup_userAlreadyExists => 'User already exists';

  @override
  String get login_signup_usernameMinimumLengthErrorMessage =>
      'Username should at least be 5 characters';

  @override
  String get login_signup_tryAgainInFewSecondsMessage =>
      'Please try again in few seconds';

  @override
  String get login_signup_yourPassword => 'Your password';

  @override
  String get login_signup_cap_refresh => 'Refresh';

  @override
  String get login_signup_cap_resend => 'Resend';

  @override
  String get login_signup_continueWithGoogle => 'Sign in with Google';

  @override
  String get login_signup_continueWithApple => 'Sign in with Apple';

  @override
  String get login_signup_continueWithEmailOrPhone =>
      'Sign in with Email or Phone';

  @override
  String get login_signup_skipForNow => 'Skip for now';

  @override
  String get login_signup_enter_phone => 'Enter your phone number';

  @override
  String get login_signup_byContinuingYouAreAgreeingToUur =>
      'By continuing, you are agreeing to our ';

  @override
  String get login_signup_termsAndConditions => 'Terms and Conditions';

  @override
  String get login_signup_dataFeesDisclaimer =>
      ' and any data fees that may apply.';

  @override
  String get login_signup_noAccountFoundMessage =>
      'Looks like you don’t have an account.\nTry a different number or ';

  @override
  String get login_signup_DoNotHaveAnAccount => 'Don\'t have an account? ';

  @override
  String get login_signup_signIn => 'Sign in';

  @override
  String get login_signup_createAnAccount => 'Create an account';

  @override
  String get login_signup_createAccount => 'Create account';

  @override
  String get login_signup_cap_phone => 'Phone';

  @override
  String get login_signup_sendVerificationCode => 'Get OTP';

  @override
  String get login_signup_phone_label => '10-Digit Phone number';

  @override
  String get login_signup_cap_continue => 'Continue';

  @override
  String get login_signup_emailCanNotBeEmpty => 'Email can\'t be empty';

  @override
  String get login_signup_passwordCanNotBeEmpty => 'Password can\'t be empty';

  @override
  String get login_signup_enterNumberToProceedMessage =>
      'Please enter your number to sign proceed';

  @override
  String get login_signup_tooManyRequestsErrorMessage =>
      'Too many requests, please try again later.';

  @override
  String get login_signup_resendEmail => 'Resend email';

  @override
  String get login_signup_verificationCode => 'Verification Code';

  @override
  String get login_signup_accountVerificationInstruction =>
      'so we can verify your account';

  @override
  String get login_signup_emailVerificationSentMessage =>
      'We have sent you an email verification to:';

  @override
  String get login_signup_emailSentMessage => 'We have sent you an email';

  @override
  String get login_signup_weakPassword => 'Weak password';

  @override
  String get login_signup_emailAlreadyInUse => 'Email already in use';

  @override
  String get login_signup_invalidCredentials => 'Invalid Credentials';

  @override
  String get login_signup_resendCode => 'Resend code';

  @override
  String login_signup_resendCodeTime(Object timeLeft) {
    return 'Resend code (${timeLeft}s)';
  }

  @override
  String get login_signup_verificationCodeSent => 'Verification code sent';

  @override
  String login_signup_enterOtpSentTo(Object phoneNumber) {
    return 'Enter the 6 digit OTP sent to\n$phoneNumber';
  }

  @override
  String get login_signup_looksLikeThisIsTheWrongCode =>
      'Looks like this is the wrong code,\nPlease try again or get a new code';

  @override
  String get login_signup_signupWithPhoneOnly =>
      'New accounts are created only using phone number';

  @override
  String get login_signup_enterName => 'Please enter your Name';

  @override
  String get otp_errors_number_not_valid =>
      'The provided phone number is not valid.';

  @override
  String get otp_errors_too_many_requests =>
      'Too many requests. We have temporarily blocked attempts from this device. Please try again later.';

  @override
  String get otp_errors_the_sms_code_expired => 'The SMS code has expired.';

  @override
  String get otp_errors_invalid_verification_code =>
      'Invalid OTP code. Please try again.';

  @override
  String get otp_errors_phone_number_not_allowed =>
      'Phone numbers from this country are not allowed.';

  @override
  String get otp_errors_oops_something_went_wrong =>
      'Oops! Something went wrong.';

  @override
  String get otp_errors_network_request_failed =>
      'Network error! Please check your internet connection and try again.';

  @override
  String get login_signup_login_to_app => 'Login to App';

  @override
  String get login_signup_welcome_back => 'Welcome back!';

  @override
  String get login_signup_send_otp => 'Send OTP';

  @override
  String get login_signup_enter_your_registered_phone_number =>
      'Enter your registered phone number';

  @override
  String get login_signup_or => 'Or';

  @override
  String get login_signup_no_account => 'Don’t have an account? ';

  @override
  String get login_signup_sign_up => 'Sign up';

  @override
  String get login_signup_agreement_info =>
      'By continuing, you are acknowledge and accept our ';

  @override
  String get login_signup_terms_and_conditions => 'Terms and Conditions';

  @override
  String get login_signup_and => 'and';

  @override
  String get login_signup_privacy_policy => 'Privacy Policy';

  @override
  String get login_signup_continue_with_google => 'Continue with Google';

  @override
  String get login_signup_continue_with_apple => 'Continue with Apple';

  @override
  String get login_signup_continue_with_number => 'Continue with Phone Number';

  @override
  String get login_signup_continue_with_email => 'Continue with Email';

  @override
  String get login_signup_login_with_phone => 'Login with phone number';

  @override
  String get login_signup_mobile_number => 'Mobile number';

  @override
  String get login_signup_continue => 'Continue';

  @override
  String get login_signup_enter_phone_number => 'Enter phone number';

  @override
  String get login_signup_enter_otp => 'Enter OTP';

  @override
  String get login_signup_sent_code_info => 'We’ve sent a 6-digit code to';

  @override
  String get login_signup_error_invalid_otp => 'Invalid OTP. Please try again.';

  @override
  String get login_signup_verify => 'Verify';

  @override
  String get login_signup_resend => 'Resend';

  @override
  String get login_signup_login_with_email => 'Login with email';

  @override
  String get login_signup_email_hint => 'Enter email';

  @override
  String get login_signup_password => 'Password';

  @override
  String get login_signup_password_hint => 'Enter password';

  @override
  String get login_signup_ask_forgot_password => 'Forgot password?';

  @override
  String get login_signup_login => 'Login';

  @override
  String get login_signup_email_cant_be_empty => 'Email can\'t be empty';

  @override
  String get login_signup_invalid_email => 'Please enter a valid email address';

  @override
  String get login_signup_password_cant_be_empty => 'Password can\'t be empty';

  @override
  String get login_signup_send_reset_link => 'Send Reset Link';

  @override
  String get login_signup_forgot_password => 'Forgot password';

  @override
  String get login_signup_check_your_email => 'Check Your Email';

  @override
  String login_signup_link_send_info(String email) {
    return 'A reset link has been sent to $email. Please check your inbox and click the link to reset the password.';
  }

  @override
  String get login_signup_signup_already_have_account =>
      'Already have an account? ';

  @override
  String get login_signup_signup_lets_get_started => 'Let\'s get started';

  @override
  String get login_signup_signup_lets_get_started_info =>
      'Enter your phone number, we will send you a verification code';

  @override
  String get login_signup_next => 'Next';

  @override
  String get login_signup_Phone_no_verified => 'Phone number verified!';

  @override
  String get login_signup_Phone_no_verified_info =>
      'Your Phone number has been successfully verified. You can now complete your profile.';

  @override
  String get login_signup_checking => 'Checking';

  @override
  String get login_signup_error_phone_number_not_registered =>
      'Phone number is not registered, please sign up to continue';

  @override
  String get login_signup_phone_number_already_registered =>
      'Welcome back! We found your phone number in our records. Please continue with the login.';

  @override
  String get login_signup_add_profile_picture => 'Add a profile picture';

  @override
  String get login_signup_add => 'Add';

  @override
  String get login_signup_skip => 'Skip';

  @override
  String get login_signup_done => 'Done';

  @override
  String get login_signup_edit => 'Edit';

  @override
  String get login_signup_remove => 'Remove';

  @override
  String get login_signup_camera => 'Camera';

  @override
  String get login_signup_gallery => 'Gallery';

  @override
  String get login_signup_email => 'Email';

  @override
  String get login_signup_sign_up_with_email => 'Sign up with email';

  @override
  String get login_signup_create_your_password => 'Create your password';

  @override
  String get login_signup_password_requirements =>
      'Your password must have at least:';

  @override
  String get login_signup_password_requirements_length =>
      '8 characters or more';

  @override
  String get login_signup_password_requirements_letter_number =>
      '1 letter and number';

  @override
  String get login_signup_password_requirements_special_char =>
      '1 special character (Example: # ? ! \$ & @)';

  @override
  String get login_signup_password_strength => 'Password strength:';

  @override
  String get login_signup_confirm_password => 'Confirm password';

  @override
  String get login_signup_confirm_password_hint => 'Enter confirm password';

  @override
  String get login_signup_poor => 'Poor';

  @override
  String get login_signup_weak => 'Weak';

  @override
  String get login_signup_strong => 'Strong';

  @override
  String get login_signup_error_enter_confirm_password =>
      'Please enter confirm password';

  @override
  String get login_signup_passwords_do_not_match => 'Passwords do not match';

  @override
  String get login_signup_verify_your_email => 'Verify your email';

  @override
  String login_signup_link_verify_info(String email) {
    return 'A verification link has been sent to $email. Click the link to verify your account.';
  }

  @override
  String get login_signup_back_to_login => 'Back to login';

  @override
  String get login_signup_resend_verification_email =>
      'Resend Verification Email';

  @override
  String get login_signup_entered_wrong_email => 'Entered the wrong email?';

  @override
  String get login_signup_change_email => ' Change Email';

  @override
  String get login_signup_signup_with_google => 'Sign up with Google';

  @override
  String get login_signup_signup_with_apple => 'Sign up with Apple';

  @override
  String get login_signup_signup_with_email => 'Sign up with Email';

  @override
  String get login_signup_invalid_mobile_number => 'Invalid mobile number';

  @override
  String get login_signup_search_by_country => 'Search by name or code';

  @override
  String get login_signup_registration_complete => 'Registration complete!';

  @override
  String get login_signup_what_interest_you => 'What topics interest you?';

  @override
  String get login_signup_select_three_categories =>
      'Select at least 3 topics to personalize your feed.';

  @override
  String get login_signup_email_already_in_use =>
      'This email is already registered. Please log in or use a different email.';

  @override
  String get login_signup_error_retrieving_phone_number =>
      'Error retrieving your phone number';

  @override
  String get login_signup_error_retrieving_email =>
      'Error retrieving your email';

  @override
  String get login_signup_user_info_not_retrieved =>
      'User information could not be retrieved.';

  @override
  String get share_type_instagram => 'Instagram';

  @override
  String get share_type_x => 'X';

  @override
  String get share_type_facebook => 'Facebook';

  @override
  String get share_type_tiktok => 'Tiktok';

  @override
  String get share_type_snapchat => 'Snapchat';

  @override
  String get share_type_iMessage => 'iMessage';

  @override
  String get share_type_messages => 'Messages';

  @override
  String get share_type_whatsApp => 'WhatsApp';

  @override
  String get home => 'Home';

  @override
  String get search => 'Search';

  @override
  String get map => 'Map';

  @override
  String get notifications => 'Notifications';

  @override
  String get top_products => 'Top Products';

  @override
  String get see_all => 'See All';

  @override
  String get profile => 'Profile';

  @override
  String get pro => 'PRO';

  @override
  String get sign_out => 'Sign out';

  @override
  String get account => 'Account';

  @override
  String get activity => 'Activity';

  @override
  String get personal_details => 'Personal Details';

  @override
  String get history => 'History';

  @override
  String get community => 'Community';

  @override
  String get settings => 'Settings';

  @override
  String get feedback_and_ratings => 'Feedback & Ratings';

  @override
  String get support => 'Support';

  @override
  String get help_and_support => 'Help & Support';

  @override
  String get chat => 'Chat';

  @override
  String get faq => 'FAQ';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get send_a_new_message => 'Send a new message';

  @override
  String get you => 'You';

  @override
  String get cart => 'Cart';

  @override
  String get shipping => 'Shipping';

  @override
  String get payment => 'Payment';

  @override
  String get order_review => 'Order Review';

  @override
  String get cart_and_checkout => 'Cart Details';

  @override
  String get cart_items => 'Cart Items';

  @override
  String get your_cart_is_empty => 'Your Cart is Empty !';

  @override
  String get empty_cart_message =>
      'There is no single item here. Explore products to add in your cart.';

  @override
  String get explore_products => 'Explore Products';

  @override
  String get expected_delivery_by => 'Expected Delivery by';

  @override
  String get order_summary => 'Order Summary';

  @override
  String price_of_items(int total_product) {
    String _temp0 = intl.Intl.pluralLogic(
      total_product,
      locale: localeName,
      other: '$total_product items',
      one: '$total_product item',
    );
    return 'Price($_temp0)';
  }

  @override
  String get discount => 'Discount';

  @override
  String get delivery_charges => 'Delivery Charges';

  @override
  String get total_amount => 'Total Amount';

  @override
  String get add_shipping_details => 'Add Shipping Details';

  @override
  String get shipping_details => 'Shipping Details';

  @override
  String get shipping_address => 'Shipping Address';

  @override
  String get deliver_to => 'Deliver to';

  @override
  String get add => 'Add';

  @override
  String get add_new_address => 'Add New Address';

  @override
  String get select_address => 'Select Address';

  @override
  String get save => 'Save';

  @override
  String get use_current_location => 'Use Current Location';

  @override
  String get name => 'Name';

  @override
  String get enter_your_name => 'Enter Your Name';

  @override
  String get enter_your_mobile_number => 'Enter Your Mobile Number';

  @override
  String get mobile_number => 'Mobile Number';

  @override
  String get country => 'Country';

  @override
  String get select_country => 'Select Country';

  @override
  String get state => 'State';

  @override
  String get select_state => 'Select State';

  @override
  String get city => 'City';

  @override
  String get select_city => 'Select City';

  @override
  String get zip_code => 'Zip Code';

  @override
  String get enter_zip_code => 'Enter Zip Code';

  @override
  String get address => 'Address';

  @override
  String get enter_your_address => 'Enter Your Address';

  @override
  String get set_as_default_address => 'Set as Default Address';

  @override
  String get select_payment_method => 'Select Payment Method';

  @override
  String get selected_payment_method => 'Selected Payment Method';

  @override
  String get cash_on_delivery => 'Cash on Delivery';

  @override
  String get apply_coupon => 'Apply Coupon';

  @override
  String get apply => 'Apply';

  @override
  String get available_coupons => 'Available Coupons';

  @override
  String coupon_message(int coupon_count) {
    String _temp0 = intl.Intl.pluralLogic(
      coupon_count,
      locale: localeName,
      other: '$coupon_count Coupons Available',
      one: '$coupon_count Coupon Available',
      zero: 'No Coupon Available',
    );
    return '$_temp0';
  }

  @override
  String get select_and_review_order => 'Select & Review Order';

  @override
  String get confirm_and_pay => 'Confirm and Pay';

  @override
  String get product_already_scanned => 'Product already scanned. Continue?';

  @override
  String get previous_scan_will_be_overwritten =>
      'Previous scan will be overwritten.';

  @override
  String get cancel => 'Cancel';

  @override
  String get cart_checkout_continue => 'Continue';

  @override
  String get add_certificate => 'Add Certificate';

  @override
  String get add_certificate_description =>
      'Do You want to add lab tested certificate for this item?';

  @override
  String get proceed => 'Proceed';

  @override
  String get are_you_sure_want_to_delete =>
      'Are you sure you want to delete this item?';

  @override
  String get delete_product_from_cart_description =>
      'By deleting this, you will delete all relevent data connected to this';

  @override
  String get delete => 'Delete';

  @override
  String get contact_us => 'Contact Us';

  @override
  String get contact_us_message =>
      'Let’s get connect if you have any queries. We are happy to help you anytime.';

  @override
  String get email_id => 'Email Id';

  @override
  String get enter_your_email_id => 'Enter your email id';

  @override
  String get message => 'Message';

  @override
  String get message_description => 'Write description...';

  @override
  String get attachment => 'Attachments (Up to 5)';

  @override
  String get choose_a_file => 'Choose a file or drag and drop here';

  @override
  String get supported_format =>
      'Supported JPG,PNG,PDF. Maximum file size 10mb';

  @override
  String get submit => 'Submit';

  @override
  String get alright => 'Alright !';

  @override
  String get response_received =>
      'We have received your response and will revert back to you as soon as possible.';

  @override
  String get back_to_home => 'Back to Home';

  @override
  String get name_required => 'Please enter your name';

  @override
  String get name_cannot_be_empty => 'Name can\'t be empty';

  @override
  String get message_cannot_be_empty => 'Message can\'t be empty';

  @override
  String get pick_image_error =>
      'Something went wrong while picking images. Please try again.';

  @override
  String get pick_file_error =>
      'Something went wrong while picking files. Please try again.';

  @override
  String get file_too_large_error =>
      'One or more selected files exceed the 5MB limit.';

  @override
  String get file_cannot_be_empty => 'Please select at least one file';

  @override
  String get take_a_photo => 'Take a photo';

  @override
  String get upload_from_gallery => 'Upload from gallery';

  @override
  String get upload_from_files => 'Upload from files';

  @override
  String get file_empty_error =>
      'The selected PDF file is empty. Please choose a valid file.';

  @override
  String no_result_for(Object searchText) {
    return 'No results for \"$searchText\"';
  }

  @override
  String get no_search_result_message =>
      'We couldn’t found any result related to your search. Try searching for something else.';

  @override
  String get no_internet_connection => 'Please check your internet connection';

  @override
  String get empty_wishlist_title => 'Your Wishlist is empty!';

  @override
  String get empty_wishlist_message =>
      'You have not added any product to your wishlist. Explore products to add in your wishlist.';

  @override
  String get wishlist => 'Wishlist';

  @override
  String get empty_notifications_title => 'No Notifications Yet';

  @override
  String get server_error_title => 'Server Error';

  @override
  String get server_error_description =>
      'There is server error at the moment, please check back later';

  @override
  String get try_again => 'Try Again';

  @override
  String get server_error => 'Server Error';

  @override
  String get lost_connection => 'You Lost Connection';

  @override
  String get lost_connection_message =>
      'Seems like you have lost internet connection';

  @override
  String get under_maintenance => 'App is Under Maintenance !';

  @override
  String get under_maintenance_message =>
      'App is currently under maintenance. We will notify you once we are done. Try again later.';

  @override
  String get no_chats => 'No Chats';

  @override
  String get empty_order_title => 'No Orders Found';

  @override
  String get empty_order_message =>
      'There is no single item here. Explore products to add in your cart.';

  @override
  String get empty_cards_list_title => 'No Saved Card';

  @override
  String get empty_cards_list_message =>
      'There is no card available at the moment.';

  @override
  String get unsupported_file_format_error =>
      'The selected file is not a valid PDF. Please choose a proper PDF file to continue.';

  @override
  String get image_cannot_be_empty => 'Please select at least one image';

  @override
  String get notifications_not_available => 'Notifications not available';

  @override
  String get notifications_delete_successfully =>
      'Notification Delete Successfully';

  @override
  String get internet_not_available =>
      'No Internet Connection Found \nPlease check your inernet connection';

  @override
  String get opps_something_went_wrong => 'Opps Something Went Wrong';

  @override
  String get view_product_reviews => 'View Product Reviews';

  @override
  String get price => 'Price';

  @override
  String get reviews => 'Reviews';

  @override
  String get rating => 'Rating';

  @override
  String ratingWithCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ratings',
      one: 'Rating',
    );
    return '$count $_temp0';
  }

  @override
  String get write_a_review => 'Write a Review';

  @override
  String get star => 'Star';

  @override
  String star_count(Object count) {
    return '$count Star';
  }

  @override
  String get no_reviews_found => 'No reviews available for this product.';

  @override
  String get add_photo_or_video => 'Add a photo or video';

  @override
  String get write_your_review => 'Write your review';

  @override
  String get review_submited_message =>
      'Your review has been submitted successfully.';

  @override
  String get notification_settings => 'Notification Settings';

  @override
  String get change_password => 'Change Password';

  @override
  String get choose_app_theme => 'Choose App Theme';

  @override
  String get account_and_privacy => 'Account & Privacy';

  @override
  String get delete_account => 'Delete Account';

  @override
  String get delete_reason_do_not_need_anymore => 'I don\'t need it anymore';

  @override
  String get delete_reason_product_no_more_relevant =>
      'Products are no more relevant to me';

  @override
  String get delete_reason_dislike_app => 'I don’t like to be on this app';

  @override
  String get delete_reason_other => 'Other';

  @override
  String get delete_reason_title => 'Why are you deleting account?';

  @override
  String get specify_reason => 'Please specify your reason';

  @override
  String get delete_warning_title => 'Deleting account will do the following :';

  @override
  String get delete_warning_products_chats =>
      'Saved products, chats will be deleted';

  @override
  String get delete_warning_account_info =>
      'Delete all of your account information';

  @override
  String get account_deleted => 'Account Deleted!';

  @override
  String get something_went_wrong => 'Something went wrong. Please try again.';

  @override
  String get delete_account_failed =>
      'Account deletion failed. Please try again.';

  @override
  String get no_user_found => 'No user found.';

  @override
  String get reauth_required =>
      'Please re-authenticate to delete your account.';

  @override
  String get creating_new_account => 'Creating new account?';

  @override
  String get delete_account_confirmation_message =>
      'This action is irreversible. All your data will be permanently deleted. Are you sure you want to proceed?';

  @override
  String get its_time_to_update => 'It’s time to Update!';

  @override
  String get update_required_description =>
      'The version you are using is old, to continue using you need to update the latest version in order to experience new features.';

  @override
  String get update_now => 'Update Now';

  @override
  String get skip_update => 'Skip Update';

  @override
  String get platform_not_supported => 'Platform not supported';

  @override
  String get could_not_launch_store_link => 'Could not launch store link';

  @override
  String get microphone_permission_permanently_denied =>
      'Microphone permission is permanently denied. Please go to settings and enable it.';

  @override
  String get firebase_error => 'Firebase error';
}
