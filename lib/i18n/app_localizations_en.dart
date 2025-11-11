// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get common_keys => '================ COMMON KEYS ================';

  @override
  String get add => 'Add';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get next => 'Next';

  @override
  String get or => 'Or';

  @override
  String get remove => 'Remove';

  @override
  String get search => 'Search';

  @override
  String get opps_something_went_wrong => 'Opps Something Went Wrong';

  @override
  String get time_date_keys =>
      '================ TIME & DATE KEYS ================';

  @override
  String daysAgo(int count) {
    return '$count days ago';
  }

  @override
  String hoursAgo(int count) {
    return '$count hrs ago';
  }

  @override
  String get justNow => 'Just now';

  @override
  String get lastMonth => 'Last month';

  @override
  String get lastYear => 'Last year';

  @override
  String minutesAgo(int count) {
    return '$count min ago';
  }

  @override
  String monthsAgo(int count) {
    return '$count months ago';
  }

  @override
  String get oneHourAgo => '1 hr ago';

  @override
  String get oneMinuteAgo => '1 min ago';

  @override
  String get today => 'Today';

  @override
  String yearsAgo(int count) {
    return '$count years ago';
  }

  @override
  String get yesterday => 'Yesterday';

  @override
  String get login_keys => '================ LOGIN KEYS ================';

  @override
  String get ask_forgot_password => 'Forgot password?';

  @override
  String get check_your_email => 'Check Your Email';

  @override
  String get resend => 'Resend';

  @override
  String get login_continue => 'Continue';

  @override
  String get continue_with_apple => 'Continue with Apple';

  @override
  String get continue_with_email => 'Continue with Email';

  @override
  String get continue_with_google => 'Continue with Google';

  @override
  String get continue_with_number => 'Continue with Phone Number';

  @override
  String get enter_otp => 'Enter OTP';

  @override
  String get enter_phone_number => 'Enter phone number';

  @override
  String get enter_your_registered_phone_number =>
      'Enter your registered phone number';

  @override
  String get forgot_password => 'Forgot password';

  @override
  String get invalid_mobile_number => 'Invalid mobile number';

  @override
  String link_send_info(String email) {
    return 'A reset link has been sent to $email. Please check your inbox and click the link to reset the password.';
  }

  @override
  String get login => 'Login';

  @override
  String get login_with_email => 'Login with email';

  @override
  String get send_otp => 'Send OTP';

  @override
  String get send_reset_link => 'Send Reset Link';

  @override
  String get sent_code_info => 'We’ve sent a 6-digit code to';

  @override
  String get welcome_back => 'Welcome back!';

  @override
  String get signup_keys => '================ SIGNUP KEYS ================';

  @override
  String get already_have_account => 'Already have an account? ';

  @override
  String get back_to_login => 'Back to login';

  @override
  String get confirm_password => 'Confirm password';

  @override
  String get confirm_password_hint => 'Enter confirm password';

  @override
  String get change_email => ' Change Email';

  @override
  String get create_your_password => 'Create your password';

  @override
  String get email => 'Email';

  @override
  String get email_cant_be_empty => 'Email can’t be empty';

  @override
  String get email_hint => 'Enter email';

  @override
  String get email_id => 'Email Id';

  @override
  String get enter_your_email_id => 'Enter your email id';

  @override
  String get enter_your_name => 'Enter your name';

  @override
  String get entered_wrong_email => 'Entered the wrong email?';

  @override
  String get error_enter_confirm_password => 'Please enter confirm password';

  @override
  String get error_retrieving_email => 'Error retrieving your email';

  @override
  String get error_retrieving_phone_number =>
      'Error retrieving your phone number';

  @override
  String get invalid_email => 'Please enter a valid email address';

  @override
  String get lets_get_started => 'Let\'s get started';

  @override
  String get lets_get_started_info =>
      'Enter your phone number, we will send you a verification code';

  @override
  String link_verify_info(String email) {
    return 'A verification link has been sent to $email. Click the link to verify your account.';
  }

  @override
  String get mobile_number => 'Mobile number';

  @override
  String get name => 'Name';

  @override
  String get name_cannot_be_empty => 'Name can\'t be empty';

  @override
  String get no_account => 'Don’t have an account? ';

  @override
  String get password => 'Password';

  @override
  String get password_cant_be_empty => 'Password can\'t be empty';

  @override
  String get password_hint => 'Enter password';

  @override
  String get password_requirements => 'Your password must have at least:';

  @override
  String get password_requirements_length => '8 characters or more';

  @override
  String get password_requirements_letter_number => '1 letter and number';

  @override
  String get password_requirements_special_char =>
      '1 special character (Example: # ? ! \$ & @)';

  @override
  String get password_strength => 'Password strength:';

  @override
  String get passwords_do_not_match => 'Passwords do not match';

  @override
  String get phone_no_verified => 'Phone number verified!';

  @override
  String get phone_no_verified_info =>
      'Your Phone number has been successfully verified. You can now complete your profile.';

  @override
  String get poor => 'Poor';

  @override
  String get sign_up => 'Sign up';

  @override
  String get sign_up_with_apple => 'Sign up with Apple';

  @override
  String get sign_up_with_email => 'Sign up with Email';

  @override
  String get sign_up_with_google => 'Sign up with Google';

  @override
  String get strong => 'Strong';

  @override
  String get terms_and_conditions => 'Terms and Conditions';

  @override
  String get user_info_not_retrieved =>
      'User information could not be retrieved.';

  @override
  String get weak => 'Weak';

  @override
  String get verify => 'Verify';

  @override
  String get verify_email_keys =>
      '================ VERIFY EMAIL KEYS ================';

  @override
  String get resend_verification_email => 'Resend Verification Email';

  @override
  String get verify_your_email => 'Verify your email';

  @override
  String get profile_keys => '================ PROFILE KEYS ================';

  @override
  String get account => 'Account';

  @override
  String get add_a_profile_picture => 'Add a profile picture';

  @override
  String get personal_details => 'Personal Details';

  @override
  String get profile => 'Profile';

  @override
  String get help_and_support => 'Help & Support';

  @override
  String get edit => 'Edit';

  @override
  String get sign_out => 'Sign out';

  @override
  String get skip => 'Skip';

  @override
  String get activity => 'Activity';

  @override
  String get history => 'History';

  @override
  String get done => 'Done';

  @override
  String get community => 'Community';

  @override
  String get feedback_and_ratings => 'Feedback & Ratings';

  @override
  String get notifications => 'Notifications';

  @override
  String get delete_account_keys =>
      '================ DELETE ACCOUNT KEYS ================';

  @override
  String get delete => 'Delete';

  @override
  String get delete_account => 'Delete Account';

  @override
  String get delete_account_alert_title =>
      'Are you sure you want to Delete Account?';

  @override
  String get delete_account_confirmation_message =>
      'This action is irreversible. All your data will be permanently deleted. Are you sure you want to proceed?';

  @override
  String get delete_reason_dislike_app => 'I don’t like to be on this app';

  @override
  String get delete_reason_do_not_need_anymore => 'I don\'t need it anymore';

  @override
  String get delete_reason_other => 'Other';

  @override
  String get delete_reason_product_no_more_relevant =>
      'Products are no more relevant to me';

  @override
  String get delete_reason_title => 'Why are you deleting account?';

  @override
  String get delete_warning_account_info =>
      'Delete all of your account information';

  @override
  String get delete_warning_products_chats =>
      'Saved products, chats will be deleted';

  @override
  String get delete_warning_title => 'Deleting account will do the following :';

  @override
  String get please_select_at_least_one_reason =>
      'Please select at least one reason';

  @override
  String get please_specify_your_reason => 'Please specify your reason';

  @override
  String get specify_reason => 'Please specify your reason';

  @override
  String get cancel => 'Cancel';

  @override
  String get account_delete_success_keys =>
      '================ ACCOUNT DELETE SUCCESS KEYS ================';

  @override
  String get account_deleted => 'Account Deleted!';

  @override
  String get creating_new_account => 'Creating new account?';

  @override
  String get shipping_address_keys =>
      '================ SHIPPING ADDRESS KEYS ================';

  @override
  String get add_new_address => 'Add New Address';

  @override
  String get add_shipping_details => 'Add Shipping Details';

  @override
  String get address => 'Address';

  @override
  String get city => 'City';

  @override
  String get country => 'Country';

  @override
  String get deliver_to => 'Deliver to';

  @override
  String get enter_your_address => 'Enter Your Address';

  @override
  String get enter_zip_code => 'Enter Zip Code';

  @override
  String get select_address => 'Select Address';

  @override
  String get select_city => 'Select City';

  @override
  String get select_country => 'Select Country';

  @override
  String get select_state => 'Select State';

  @override
  String get set_as_default_address => 'Set as Default Address';

  @override
  String get shipping_address => 'Shipping Address';

  @override
  String get shipping_details => 'Shipping Details';

  @override
  String get state => 'State';

  @override
  String get use_current_location => 'Use Current Location';

  @override
  String get zip_code => 'Zip Code';

  @override
  String get checkout_keys => '================ CHECKOUT KEYS ================';

  @override
  String get cart => 'Cart';

  @override
  String get cart_and_checkout => 'Cart Details';

  @override
  String get cart_items => 'Cart Items';

  @override
  String get cash_on_delivery => 'Cash on Delivery';

  @override
  String get confirm_and_pay => 'Confirm and Pay';

  @override
  String get delivery_charges => 'Delivery Charges';

  @override
  String get discount => 'Discount';

  @override
  String get expected_delivery_by => 'Expected Delivery by';

  @override
  String get order_review => 'Order Review';

  @override
  String get order_summary => 'Order Summary';

  @override
  String get payment => 'Payment';

  @override
  String get price => 'Price';

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
  String get select_and_review_order => 'Select & Review Order';

  @override
  String get select_payment_method => 'Select Payment Method';

  @override
  String get selected_payment_method => 'Selected Payment Method';

  @override
  String get shipping => 'Shipping';

  @override
  String get total_amount => 'Total Amount';

  @override
  String get your_cart_is_empty => 'Your Cart is Empty !';

  @override
  String get coupons_keys => '================ COUPONS KEYS ================';

  @override
  String get apply => 'Apply';

  @override
  String get apply_coupon => 'Apply Coupon';

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
  String get search_by_name_or_code => 'Search by name or code';

  @override
  String get home_keys => '================ HOME KEYS ================';

  @override
  String get home => 'Home';

  @override
  String get pro => 'PRO';

  @override
  String get rating => 'Rating';

  @override
  String get reviews => 'Reviews';

  @override
  String get see_all => 'See All';

  @override
  String get star => 'Star';

  @override
  String get top_products => 'Top Products';

  @override
  String no_result_for(Object searchText) {
    return 'No results for \"$searchText\"';
  }

  @override
  String get no_search_result_message =>
      'We couldn\'t found any result related to your search. Try searching for something else.';

  @override
  String get microphone_permission_permanently_denied =>
      'Microphone permission is permanently denied. Please go to settings and enable it.';

  @override
  String get wishlist_keys => '================ WISHLIST KEYS ================';

  @override
  String get wishlist => 'Wishlist';

  @override
  String get empty_wishlist_message =>
      'You have not added any product to your wishlist. Explore products to add in your wishlist.';

  @override
  String get empty_wishlist_title => 'Your Wishlist is empty!';

  @override
  String get chat_keys => '================ CHAT KEYS ================';

  @override
  String get chat => 'Chat';

  @override
  String get you => 'You';

  @override
  String get message => 'Message';

  @override
  String messageTooLong(int maxLength) {
    return 'Your message is too long (max $maxLength characters)';
  }

  @override
  String get message_cannot_be_empty => 'Message can\'t be empty';

  @override
  String get message_description => 'Write description...';

  @override
  String get no_chats => 'No Chats';

  @override
  String get send_a_new_message => 'Send a new message';

  @override
  String get contact_us_keys =>
      '================ CONTACT US KEYS ================';

  @override
  String get attachment => 'Attachments (Up to 5)';

  @override
  String get alright => 'Alright !';

  @override
  String get choose_a_file => 'Choose a file or drag and drop here';

  @override
  String get contact_us => 'Contact Us';

  @override
  String get submit => 'Submit';

  @override
  String get contact_us_message =>
      'Let’s get connect if you have any queries. We are happy to help you anytime.';

  @override
  String get file_cannot_be_empty => 'Please select at least one file';

  @override
  String get file_empty_error =>
      'The selected PDF file is empty. Please choose a valid file.';

  @override
  String get file_too_large_error =>
      'One or more selected files exceed the 5MB limit.';

  @override
  String get pick_file_error =>
      'Something went wrong while picking files. Please try again.';

  @override
  String get pick_image_error =>
      'Something went wrong while picking images. Please try again.';

  @override
  String get pick_pdf_error =>
      'Something went wrong while picking PDFs. Please try again.';

  @override
  String get response_received =>
      'We have received your response and will revert back to you as soon as possible.';

  @override
  String get support => 'Support';

  @override
  String get supported_format =>
      'Supported JPG,PNG,PDF. Maximum file size 10mb';

  @override
  String get take_a_photo => 'Take a photo';

  @override
  String get unsupported_file_format_error =>
      'The selected file is not a valid PDF. Please choose a proper PDF file to continue.';

  @override
  String get upload_from_files => 'Upload from files';

  @override
  String get upload_from_gallery => 'Upload from gallery';

  @override
  String get notifications_keys =>
      '================ NOTIFICATIONS KEYS ================';

  @override
  String get notifications_delete_successfully =>
      'Notification Delete Successfully';

  @override
  String get empty_notifications_title => 'No Notifications Yet';

  @override
  String get settings_keys => '================ SETTINGS KEYS ================';

  @override
  String get settings => 'Settings';

  @override
  String get notification_settings => 'Notification Settings';

  @override
  String get change_password => 'Change Password';

  @override
  String get choose_app_theme => 'Choose App Theme';

  @override
  String get account_and_privacy => 'Account & Privacy';

  @override
  String get saved_cards_keys =>
      '================ SAVED CARDS KEYS ================';

  @override
  String get empty_cards_list_message =>
      'There is no card available at the moment.';

  @override
  String get empty_cards_list_title => 'No Saved Card';

  @override
  String get explore_products => 'Explore Products';

  @override
  String get save => 'Save';

  @override
  String get empty_screens_keys =>
      '================ EMPTY SCREENS KEYS ================';

  @override
  String get empty_cart_message =>
      'There is no single item here. Explore products to add in your cart.';

  @override
  String get empty_order_message =>
      'There is no single item here. Explore products to add in your cart.';

  @override
  String get empty_order_title => 'No Orders Found';

  @override
  String get force_update_keys =>
      '================ FORCE UPDATE KEYS ================';

  @override
  String get could_not_launch_store_link => 'Could not launch store link';

  @override
  String get its_time_to_update => 'It’s time to Update!';

  @override
  String get skip_update => 'Skip Update';

  @override
  String get update_app => 'Update App';

  @override
  String get update_now => 'Update Now';

  @override
  String get update_required_description =>
      'The version you are using is old, to continue using you need to update the latest version in order to experience new features.';

  @override
  String get under_maintenance_keys =>
      '================ UNDER MAINTENANCE KEYS ================';

  @override
  String get under_maintenance => 'App is Under Maintenance !';

  @override
  String get under_maintenance_message =>
      'App is currently under maintenance. We will notify you once we are done. Try again later.';

  @override
  String get no_internet_keys =>
      '================ NO INTERNET KEYS ================';

  @override
  String get lost_connection => 'You Lost Connection';

  @override
  String get lost_connection_message =>
      'Seems like you have lost internet connection';

  @override
  String get no_internet_connection => 'Please check your internet connection';

  @override
  String get server_error_keys =>
      '================ SERVER ERROR KEYS ================';

  @override
  String get server_error => 'Server Error';

  @override
  String get server_error_description =>
      'There is server error at the moment, please check back later';

  @override
  String get server_error_title => 'Server Error';

  @override
  String get back_to_home => 'Back to Home';

  @override
  String get ssl_pinning_keys =>
      '================ SSL PINNING KEYS ================';

  @override
  String get platform_not_supported => 'Platform not supported';

  @override
  String get secure_connection_failed_message =>
      'We couldn\'t connect securely to our server. Please try again later, or check if app update available.';

  @override
  String get secure_connection_failed_title => 'Secure Connection Failed!';

  @override
  String get try_again => 'Try Again';

  @override
  String get product_detail_keys =>
      '================ Product Detail Keys ================';

  @override
  String get product_information => 'Product Information';

  @override
  String get add_to_cart => 'Add to cart';

  @override
  String get mark_favorite => 'Mark Favorite';

  @override
  String get inclusive_of_taxes => '(incl. of all taxes)';

  @override
  String get product_photos => 'Product Photos';

  @override
  String get view_product_reviews => 'View Product Reviews';

  @override
  String get no_product_detail_found => 'No Product Detail Found!';

  @override
  String get product_details => 'Product Details';
}
