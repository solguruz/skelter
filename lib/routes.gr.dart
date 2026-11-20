// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:typed_data' as _i49;

import 'package:auto_route/auto_route.dart' as _i44;
import 'package:flutter/material.dart' as _i45;
import 'package:skelter/presentation/account_delete_success/account_delete_success_screen.dart'
    as _i1;
import 'package:skelter/presentation/biometric_auth/biometric_auth_screen.dart'
    as _i5;
import 'package:skelter/presentation/change_theme/change_theme_screen.dart'
    as _i6;
import 'package:skelter/presentation/chat/chat_conversations.dart' as _i7;
import 'package:skelter/presentation/chat/chat_screen.dart' as _i8;
import 'package:skelter/presentation/chat/model/chat_model.dart' as _i47;
import 'package:skelter/presentation/checkout/invoice_preview_screen.dart'
    as _i23;
import 'package:skelter/presentation/contact_us/contact_us_screen.dart' as _i10;
import 'package:skelter/presentation/contact_us/contact_us_submitted_screen.dart'
    as _i11;
import 'package:skelter/presentation/coupons/available_coupons.dart' as _i4;
import 'package:skelter/presentation/delete_account/delete_account_screen.dart'
    as _i13;
import 'package:skelter/presentation/empty_saved_cards/empty_saved_card_screen.dart'
    as _i16;
import 'package:skelter/presentation/empty_screens/empty_view_screens.dart'
    as _i17;
import 'package:skelter/presentation/feedback/screens/feedback_screen.dart'
    as _i18;
import 'package:skelter/presentation/force_update/force_update_screen.dart'
    as _i19;
import 'package:skelter/presentation/home/home_screen.dart' as _i21;
import 'package:skelter/presentation/initial/initial_screen.dart' as _i22;
import 'package:skelter/presentation/login/bloc/login_bloc.dart' as _i46;
import 'package:skelter/presentation/login/screens/check_your_email/check_your_email_screen.dart'
    as _i9;
import 'package:skelter/presentation/login/screens/forgot_password/forgot_password_screen.dart'
    as _i20;
import 'package:skelter/presentation/login/screens/login_with_email/login_with_email_password_screen.dart'
    as _i24;
import 'package:skelter/presentation/login/screens/login_with_phone_number/login_with_phone_number_screen.dart'
    as _i25;
import 'package:skelter/presentation/login/screens/phone_num_otp_screen/phone_number_otp_screen.dart'
    as _i32;
import 'package:skelter/presentation/manage_subscription/manage_subscription.dart'
    as _i26;
import 'package:skelter/presentation/my_orders/my_orders_screen.dart' as _i27;
import 'package:skelter/presentation/my_orders/widgets/empty_orders_view.dart'
    as _i15;
import 'package:skelter/presentation/no_internet/no_internet_screen.dart'
    as _i29;
import 'package:skelter/presentation/notifications/notifications_screen.dart'
    as _i30;
import 'package:skelter/presentation/order_detail/order_detail_screen.dart'
    as _i31;
import 'package:skelter/presentation/product_detail/product_detail_screen.dart'
    as _i34;
import 'package:skelter/presentation/reminder/reminder_screen.dart' as _i35;
import 'package:skelter/presentation/server_error/server_error_screen.dart'
    as _i36;
import 'package:skelter/presentation/settings/settings_screen.dart' as _i37;
import 'package:skelter/presentation/shipping_address/add_address.dart' as _i2;
import 'package:skelter/presentation/shipping_address/edit_address.dart'
    as _i14;
import 'package:skelter/presentation/signup/bloc/signup_bloc.dart' as _i48;
import 'package:skelter/presentation/signup/screens/phone_num_verified_page/phone_number_verified_screen.dart'
    as _i33;
import 'package:skelter/presentation/signup/screens/profile_picture/add_profile_picture_screen.dart'
    as _i3;
import 'package:skelter/presentation/signup/screens/signup_with_email/create_your_password_screen.dart'
    as _i12;
import 'package:skelter/presentation/signup/screens/signup_with_email/signup_with_email_password_screen.dart'
    as _i38;
import 'package:skelter/presentation/ssl_pinning/ssl_connection_failed_screen.dart'
    as _i39;
import 'package:skelter/presentation/subscription/subscription_screen.dart'
    as _i40;
import 'package:skelter/presentation/under_maintainace/under_maintenance_screen.dart'
    as _i41;
import 'package:skelter/presentation/verify_email/screens/verify_email_screen.dart'
    as _i42;
import 'package:skelter/presentation/wishlist/wishlist_screen.dart' as _i43;
import 'package:skelter/widgets/attachment_view.dart' as _i28;

/// generated route for
/// [_i1.AccountDeleteSuccessScreen]
class AccountDeleteSuccessRoute extends _i44.PageRouteInfo<void> {
  const AccountDeleteSuccessRoute({List<_i44.PageRouteInfo>? children})
    : super(AccountDeleteSuccessRoute.name, initialChildren: children);

  static const String name = 'AccountDeleteSuccessRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountDeleteSuccessScreen();
    },
  );
}

/// generated route for
/// [_i2.AddAddressScreen]
class AddAddressRoute extends _i44.PageRouteInfo<void> {
  const AddAddressRoute({List<_i44.PageRouteInfo>? children})
    : super(AddAddressRoute.name, initialChildren: children);

  static const String name = 'AddAddressRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddAddressScreen();
    },
  );
}

/// generated route for
/// [_i3.AddProfilePictureScreen]
class AddProfilePictureRoute
    extends _i44.PageRouteInfo<AddProfilePictureRouteArgs> {
  AddProfilePictureRoute({
    _i45.Key? key,
    required _i46.LoginBloc loginBloc,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         AddProfilePictureRoute.name,
         args: AddProfilePictureRouteArgs(key: key, loginBloc: loginBloc),
         initialChildren: children,
       );

  static const String name = 'AddProfilePictureRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddProfilePictureRouteArgs>();
      return _i3.AddProfilePictureScreen(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class AddProfilePictureRouteArgs {
  const AddProfilePictureRouteArgs({this.key, required this.loginBloc});

  final _i45.Key? key;

  final _i46.LoginBloc loginBloc;

  @override
  String toString() {
    return 'AddProfilePictureRouteArgs{key: $key, loginBloc: $loginBloc}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AddProfilePictureRouteArgs) return false;
    return key == other.key && loginBloc == other.loginBloc;
  }

  @override
  int get hashCode => key.hashCode ^ loginBloc.hashCode;
}

/// generated route for
/// [_i4.AvailableCouponsScreen]
class AvailableCouponsRoute extends _i44.PageRouteInfo<void> {
  const AvailableCouponsRoute({List<_i44.PageRouteInfo>? children})
    : super(AvailableCouponsRoute.name, initialChildren: children);

  static const String name = 'AvailableCouponsRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i4.AvailableCouponsScreen();
    },
  );
}

/// generated route for
/// [_i5.BiometricAuthScreen]
class BiometricAuthRoute extends _i44.PageRouteInfo<void> {
  const BiometricAuthRoute({List<_i44.PageRouteInfo>? children})
    : super(BiometricAuthRoute.name, initialChildren: children);

  static const String name = 'BiometricAuthRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i5.BiometricAuthScreen();
    },
  );
}

/// generated route for
/// [_i6.ChangeThemeScreen]
class ChangeThemeRoute extends _i44.PageRouteInfo<void> {
  const ChangeThemeRoute({List<_i44.PageRouteInfo>? children})
    : super(ChangeThemeRoute.name, initialChildren: children);

  static const String name = 'ChangeThemeRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i6.ChangeThemeScreen();
    },
  );
}

/// generated route for
/// [_i7.ChatConversationScreen]
class ChatConversationRoute
    extends _i44.PageRouteInfo<ChatConversationRouteArgs> {
  ChatConversationRoute({
    _i45.Key? key,
    required _i47.ChatModel chatUser,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         ChatConversationRoute.name,
         args: ChatConversationRouteArgs(key: key, chatUser: chatUser),
         initialChildren: children,
       );

  static const String name = 'ChatConversationRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatConversationRouteArgs>();
      return _i7.ChatConversationScreen(key: args.key, chatUser: args.chatUser);
    },
  );
}

class ChatConversationRouteArgs {
  const ChatConversationRouteArgs({this.key, required this.chatUser});

  final _i45.Key? key;

  final _i47.ChatModel chatUser;

  @override
  String toString() {
    return 'ChatConversationRouteArgs{key: $key, chatUser: $chatUser}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChatConversationRouteArgs) return false;
    return key == other.key && chatUser == other.chatUser;
  }

  @override
  int get hashCode => key.hashCode ^ chatUser.hashCode;
}

/// generated route for
/// [_i8.ChatScreen]
class ChatRoute extends _i44.PageRouteInfo<void> {
  const ChatRoute({List<_i44.PageRouteInfo>? children})
    : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i8.ChatScreen();
    },
  );
}

/// generated route for
/// [_i9.CheckYourEmailScreen]
class CheckYourEmailRoute extends _i44.PageRouteInfo<CheckYourEmailRouteArgs> {
  CheckYourEmailRoute({
    _i45.Key? key,
    required _i46.LoginBloc loginBloc,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         CheckYourEmailRoute.name,
         args: CheckYourEmailRouteArgs(key: key, loginBloc: loginBloc),
         initialChildren: children,
       );

  static const String name = 'CheckYourEmailRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CheckYourEmailRouteArgs>();
      return _i9.CheckYourEmailScreen(key: args.key, loginBloc: args.loginBloc);
    },
  );
}

class CheckYourEmailRouteArgs {
  const CheckYourEmailRouteArgs({this.key, required this.loginBloc});

  final _i45.Key? key;

  final _i46.LoginBloc loginBloc;

  @override
  String toString() {
    return 'CheckYourEmailRouteArgs{key: $key, loginBloc: $loginBloc}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CheckYourEmailRouteArgs) return false;
    return key == other.key && loginBloc == other.loginBloc;
  }

  @override
  int get hashCode => key.hashCode ^ loginBloc.hashCode;
}

/// generated route for
/// [_i10.ContactUsScreen]
class ContactUsRoute extends _i44.PageRouteInfo<void> {
  const ContactUsRoute({List<_i44.PageRouteInfo>? children})
    : super(ContactUsRoute.name, initialChildren: children);

  static const String name = 'ContactUsRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i10.ContactUsScreen();
    },
  );
}

/// generated route for
/// [_i11.ContactUsSubmittedScreen]
class ContactUsSubmittedRoute extends _i44.PageRouteInfo<void> {
  const ContactUsSubmittedRoute({List<_i44.PageRouteInfo>? children})
    : super(ContactUsSubmittedRoute.name, initialChildren: children);

  static const String name = 'ContactUsSubmittedRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i11.ContactUsSubmittedScreen();
    },
  );
}

/// generated route for
/// [_i12.CreateYourPasswordScreen]
class CreateYourPasswordRoute
    extends _i44.PageRouteInfo<CreateYourPasswordRouteArgs> {
  CreateYourPasswordRoute({
    _i45.Key? key,
    required _i48.SignupBloc signupBloc,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         CreateYourPasswordRoute.name,
         args: CreateYourPasswordRouteArgs(key: key, signupBloc: signupBloc),
         initialChildren: children,
       );

  static const String name = 'CreateYourPasswordRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateYourPasswordRouteArgs>();
      return _i12.CreateYourPasswordScreen(
        key: args.key,
        signupBloc: args.signupBloc,
      );
    },
  );
}

class CreateYourPasswordRouteArgs {
  const CreateYourPasswordRouteArgs({this.key, required this.signupBloc});

  final _i45.Key? key;

  final _i48.SignupBloc signupBloc;

  @override
  String toString() {
    return 'CreateYourPasswordRouteArgs{key: $key, signupBloc: $signupBloc}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateYourPasswordRouteArgs) return false;
    return key == other.key && signupBloc == other.signupBloc;
  }

  @override
  int get hashCode => key.hashCode ^ signupBloc.hashCode;
}

/// generated route for
/// [_i13.DeleteAccountScreen]
class DeleteAccountRoute extends _i44.PageRouteInfo<void> {
  const DeleteAccountRoute({List<_i44.PageRouteInfo>? children})
    : super(DeleteAccountRoute.name, initialChildren: children);

  static const String name = 'DeleteAccountRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i13.DeleteAccountScreen();
    },
  );
}

/// generated route for
/// [_i14.EditAddressScreen]
class EditAddressRoute extends _i44.PageRouteInfo<void> {
  const EditAddressRoute({List<_i44.PageRouteInfo>? children})
    : super(EditAddressRoute.name, initialChildren: children);

  static const String name = 'EditAddressRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i14.EditAddressScreen();
    },
  );
}

/// generated route for
/// [_i15.EmptyOrdersViewScreen]
class EmptyOrdersViewRoute extends _i44.PageRouteInfo<void> {
  const EmptyOrdersViewRoute({List<_i44.PageRouteInfo>? children})
    : super(EmptyOrdersViewRoute.name, initialChildren: children);

  static const String name = 'EmptyOrdersViewRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i15.EmptyOrdersViewScreen();
    },
  );
}

/// generated route for
/// [_i16.EmptySavedCardScreen]
class EmptySavedCardRoute extends _i44.PageRouteInfo<void> {
  const EmptySavedCardRoute({List<_i44.PageRouteInfo>? children})
    : super(EmptySavedCardRoute.name, initialChildren: children);

  static const String name = 'EmptySavedCardRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i16.EmptySavedCardScreen();
    },
  );
}

/// generated route for
/// [_i17.EmptyViewsScreen]
class EmptyViewsRoute extends _i44.PageRouteInfo<void> {
  const EmptyViewsRoute({List<_i44.PageRouteInfo>? children})
    : super(EmptyViewsRoute.name, initialChildren: children);

  static const String name = 'EmptyViewsRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i17.EmptyViewsScreen();
    },
  );
}

/// generated route for
/// [_i18.FeedbackScreen]
class FeedbackRoute extends _i44.PageRouteInfo<void> {
  const FeedbackRoute({List<_i44.PageRouteInfo>? children})
    : super(FeedbackRoute.name, initialChildren: children);

  static const String name = 'FeedbackRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i18.FeedbackScreen();
    },
  );
}

/// generated route for
/// [_i19.ForceUpdateScreen]
class ForceUpdateRoute extends _i44.PageRouteInfo<ForceUpdateRouteArgs> {
  ForceUpdateRoute({
    _i45.Key? key,
    required bool isMandatoryUpdate,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         ForceUpdateRoute.name,
         args: ForceUpdateRouteArgs(
           key: key,
           isMandatoryUpdate: isMandatoryUpdate,
         ),
         initialChildren: children,
       );

  static const String name = 'ForceUpdateRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForceUpdateRouteArgs>();
      return _i19.ForceUpdateScreen(
        key: args.key,
        isMandatoryUpdate: args.isMandatoryUpdate,
      );
    },
  );
}

class ForceUpdateRouteArgs {
  const ForceUpdateRouteArgs({this.key, required this.isMandatoryUpdate});

  final _i45.Key? key;

  final bool isMandatoryUpdate;

  @override
  String toString() {
    return 'ForceUpdateRouteArgs{key: $key, isMandatoryUpdate: $isMandatoryUpdate}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ForceUpdateRouteArgs) return false;
    return key == other.key && isMandatoryUpdate == other.isMandatoryUpdate;
  }

  @override
  int get hashCode => key.hashCode ^ isMandatoryUpdate.hashCode;
}

/// generated route for
/// [_i20.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i44.PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({
    _i45.Key? key,
    required _i46.LoginBloc loginBloc,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         ForgotPasswordRoute.name,
         args: ForgotPasswordRouteArgs(key: key, loginBloc: loginBloc),
         initialChildren: children,
       );

  static const String name = 'ForgotPasswordRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordRouteArgs>();
      return _i20.ForgotPasswordScreen(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({this.key, required this.loginBloc});

  final _i45.Key? key;

  final _i46.LoginBloc loginBloc;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key, loginBloc: $loginBloc}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ForgotPasswordRouteArgs) return false;
    return key == other.key && loginBloc == other.loginBloc;
  }

  @override
  int get hashCode => key.hashCode ^ loginBloc.hashCode;
}

/// generated route for
/// [_i21.HomeScreen]
class HomeRoute extends _i44.PageRouteInfo<void> {
  const HomeRoute({List<_i44.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i21.HomeScreen();
    },
  );
}

/// generated route for
/// [_i22.InitialScreen]
class InitialRoute extends _i44.PageRouteInfo<void> {
  const InitialRoute({List<_i44.PageRouteInfo>? children})
    : super(InitialRoute.name, initialChildren: children);

  static const String name = 'InitialRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i22.InitialScreen();
    },
  );
}

/// generated route for
/// [_i23.InvoicePreviewScreen]
class InvoicePreviewRoute extends _i44.PageRouteInfo<InvoicePreviewRouteArgs> {
  InvoicePreviewRoute({
    required _i49.Uint8List pdfBytes,
    required String fileName,
    _i45.Key? key,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         InvoicePreviewRoute.name,
         args: InvoicePreviewRouteArgs(
           pdfBytes: pdfBytes,
           fileName: fileName,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'InvoicePreviewRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InvoicePreviewRouteArgs>();
      return _i23.InvoicePreviewScreen(
        pdfBytes: args.pdfBytes,
        fileName: args.fileName,
        key: args.key,
      );
    },
  );
}

class InvoicePreviewRouteArgs {
  const InvoicePreviewRouteArgs({
    required this.pdfBytes,
    required this.fileName,
    this.key,
  });

  final _i49.Uint8List pdfBytes;

  final String fileName;

  final _i45.Key? key;

  @override
  String toString() {
    return 'InvoicePreviewRouteArgs{pdfBytes: $pdfBytes, fileName: $fileName, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! InvoicePreviewRouteArgs) return false;
    return pdfBytes == other.pdfBytes &&
        fileName == other.fileName &&
        key == other.key;
  }

  @override
  int get hashCode => pdfBytes.hashCode ^ fileName.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i24.LoginWithEmailPasswordScreen]
class LoginWithEmailPasswordRoute
    extends _i44.PageRouteInfo<LoginWithEmailPasswordRouteArgs> {
  LoginWithEmailPasswordRoute({
    _i45.Key? key,
    required _i46.LoginBloc loginBloc,
    bool isFromDeleteAccount = false,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         LoginWithEmailPasswordRoute.name,
         args: LoginWithEmailPasswordRouteArgs(
           key: key,
           loginBloc: loginBloc,
           isFromDeleteAccount: isFromDeleteAccount,
         ),
         initialChildren: children,
       );

  static const String name = 'LoginWithEmailPasswordRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginWithEmailPasswordRouteArgs>();
      return _i24.LoginWithEmailPasswordScreen(
        key: args.key,
        loginBloc: args.loginBloc,
        isFromDeleteAccount: args.isFromDeleteAccount,
      );
    },
  );
}

class LoginWithEmailPasswordRouteArgs {
  const LoginWithEmailPasswordRouteArgs({
    this.key,
    required this.loginBloc,
    this.isFromDeleteAccount = false,
  });

  final _i45.Key? key;

  final _i46.LoginBloc loginBloc;

  final bool isFromDeleteAccount;

  @override
  String toString() {
    return 'LoginWithEmailPasswordRouteArgs{key: $key, loginBloc: $loginBloc, isFromDeleteAccount: $isFromDeleteAccount}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginWithEmailPasswordRouteArgs) return false;
    return key == other.key &&
        loginBloc == other.loginBloc &&
        isFromDeleteAccount == other.isFromDeleteAccount;
  }

  @override
  int get hashCode =>
      key.hashCode ^ loginBloc.hashCode ^ isFromDeleteAccount.hashCode;
}

/// generated route for
/// [_i25.LoginWithPhoneNumberScreen]
class LoginWithPhoneNumberRoute
    extends _i44.PageRouteInfo<LoginWithPhoneNumberRouteArgs> {
  LoginWithPhoneNumberRoute({
    _i45.Key? key,
    bool isFromDeleteAccount = false,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         LoginWithPhoneNumberRoute.name,
         args: LoginWithPhoneNumberRouteArgs(
           key: key,
           isFromDeleteAccount: isFromDeleteAccount,
         ),
         initialChildren: children,
       );

  static const String name = 'LoginWithPhoneNumberRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginWithPhoneNumberRouteArgs>(
        orElse: () => const LoginWithPhoneNumberRouteArgs(),
      );
      return _i25.LoginWithPhoneNumberScreen(
        key: args.key,
        isFromDeleteAccount: args.isFromDeleteAccount,
      );
    },
  );
}

class LoginWithPhoneNumberRouteArgs {
  const LoginWithPhoneNumberRouteArgs({
    this.key,
    this.isFromDeleteAccount = false,
  });

  final _i45.Key? key;

  final bool isFromDeleteAccount;

  @override
  String toString() {
    return 'LoginWithPhoneNumberRouteArgs{key: $key, isFromDeleteAccount: $isFromDeleteAccount}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginWithPhoneNumberRouteArgs) return false;
    return key == other.key && isFromDeleteAccount == other.isFromDeleteAccount;
  }

  @override
  int get hashCode => key.hashCode ^ isFromDeleteAccount.hashCode;
}

/// generated route for
/// [_i26.ManageSubscriptionScreen]
class ManageSubscriptionRoute extends _i44.PageRouteInfo<void> {
  const ManageSubscriptionRoute({List<_i44.PageRouteInfo>? children})
    : super(ManageSubscriptionRoute.name, initialChildren: children);

  static const String name = 'ManageSubscriptionRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i26.ManageSubscriptionScreen();
    },
  );
}

/// generated route for
/// [_i27.MyOrdersScreen]
class MyOrdersRoute extends _i44.PageRouteInfo<void> {
  const MyOrdersRoute({List<_i44.PageRouteInfo>? children})
    : super(MyOrdersRoute.name, initialChildren: children);

  static const String name = 'MyOrdersRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i27.MyOrdersScreen();
    },
  );
}

/// generated route for
/// [_i28.NetworkImageScreen]
class NetworkImageRoute extends _i44.PageRouteInfo<NetworkImageRouteArgs> {
  NetworkImageRoute({
    _i45.Key? key,
    required String link,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         NetworkImageRoute.name,
         args: NetworkImageRouteArgs(key: key, link: link),
         initialChildren: children,
       );

  static const String name = 'NetworkImageRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NetworkImageRouteArgs>();
      return _i28.NetworkImageScreen(key: args.key, link: args.link);
    },
  );
}

class NetworkImageRouteArgs {
  const NetworkImageRouteArgs({this.key, required this.link});

  final _i45.Key? key;

  final String link;

  @override
  String toString() {
    return 'NetworkImageRouteArgs{key: $key, link: $link}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NetworkImageRouteArgs) return false;
    return key == other.key && link == other.link;
  }

  @override
  int get hashCode => key.hashCode ^ link.hashCode;
}

/// generated route for
/// [_i29.NoInternetScreen]
class NoInternetRoute extends _i44.PageRouteInfo<void> {
  const NoInternetRoute({List<_i44.PageRouteInfo>? children})
    : super(NoInternetRoute.name, initialChildren: children);

  static const String name = 'NoInternetRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i29.NoInternetScreen();
    },
  );
}

/// generated route for
/// [_i30.NotificationsScreen]
class NotificationsRoute extends _i44.PageRouteInfo<void> {
  const NotificationsRoute({List<_i44.PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i30.NotificationsScreen();
    },
  );
}

/// generated route for
/// [_i31.OrderDetailScreen]
class OrderDetailRoute extends _i44.PageRouteInfo<OrderDetailRouteArgs> {
  OrderDetailRoute({
    _i45.Key? key,
    required String productId,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         OrderDetailRoute.name,
         args: OrderDetailRouteArgs(key: key, productId: productId),
         initialChildren: children,
       );

  static const String name = 'OrderDetailRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderDetailRouteArgs>();
      return _i31.OrderDetailScreen(key: args.key, productId: args.productId);
    },
  );
}

class OrderDetailRouteArgs {
  const OrderDetailRouteArgs({this.key, required this.productId});

  final _i45.Key? key;

  final String productId;

  @override
  String toString() {
    return 'OrderDetailRouteArgs{key: $key, productId: $productId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrderDetailRouteArgs) return false;
    return key == other.key && productId == other.productId;
  }

  @override
  int get hashCode => key.hashCode ^ productId.hashCode;
}

/// generated route for
/// [_i32.PhoneNumberOTPScreen]
class PhoneNumberOTPRoute extends _i44.PageRouteInfo<PhoneNumberOTPRouteArgs> {
  PhoneNumberOTPRoute({
    _i45.Key? key,
    required _i46.LoginBloc loginBloc,
    bool isFromDeleteAccount = false,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         PhoneNumberOTPRoute.name,
         args: PhoneNumberOTPRouteArgs(
           key: key,
           loginBloc: loginBloc,
           isFromDeleteAccount: isFromDeleteAccount,
         ),
         initialChildren: children,
       );

  static const String name = 'PhoneNumberOTPRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhoneNumberOTPRouteArgs>();
      return _i32.PhoneNumberOTPScreen(
        key: args.key,
        loginBloc: args.loginBloc,
        isFromDeleteAccount: args.isFromDeleteAccount,
      );
    },
  );
}

class PhoneNumberOTPRouteArgs {
  const PhoneNumberOTPRouteArgs({
    this.key,
    required this.loginBloc,
    this.isFromDeleteAccount = false,
  });

  final _i45.Key? key;

  final _i46.LoginBloc loginBloc;

  final bool isFromDeleteAccount;

  @override
  String toString() {
    return 'PhoneNumberOTPRouteArgs{key: $key, loginBloc: $loginBloc, isFromDeleteAccount: $isFromDeleteAccount}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PhoneNumberOTPRouteArgs) return false;
    return key == other.key &&
        loginBloc == other.loginBloc &&
        isFromDeleteAccount == other.isFromDeleteAccount;
  }

  @override
  int get hashCode =>
      key.hashCode ^ loginBloc.hashCode ^ isFromDeleteAccount.hashCode;
}

/// generated route for
/// [_i33.PhoneNumberVerifiedScreen]
class PhoneNumberVerifiedRoute
    extends _i44.PageRouteInfo<PhoneNumberVerifiedRouteArgs> {
  PhoneNumberVerifiedRoute({
    _i45.Key? key,
    required _i46.LoginBloc loginBloc,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         PhoneNumberVerifiedRoute.name,
         args: PhoneNumberVerifiedRouteArgs(key: key, loginBloc: loginBloc),
         initialChildren: children,
       );

  static const String name = 'PhoneNumberVerifiedRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhoneNumberVerifiedRouteArgs>();
      return _i33.PhoneNumberVerifiedScreen(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class PhoneNumberVerifiedRouteArgs {
  const PhoneNumberVerifiedRouteArgs({this.key, required this.loginBloc});

  final _i45.Key? key;

  final _i46.LoginBloc loginBloc;

  @override
  String toString() {
    return 'PhoneNumberVerifiedRouteArgs{key: $key, loginBloc: $loginBloc}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PhoneNumberVerifiedRouteArgs) return false;
    return key == other.key && loginBloc == other.loginBloc;
  }

  @override
  int get hashCode => key.hashCode ^ loginBloc.hashCode;
}

/// generated route for
/// [_i34.ProductDetailScreen]
class ProductDetailRoute extends _i44.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i45.Key? key,
    required String productId,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         ProductDetailRoute.name,
         args: ProductDetailRouteArgs(key: key, productId: productId),
         initialChildren: children,
       );

  static const String name = 'ProductDetailRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailRouteArgs>();
      return _i34.ProductDetailScreen(key: args.key, productId: args.productId);
    },
  );
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({this.key, required this.productId});

  final _i45.Key? key;

  final String productId;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, productId: $productId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailRouteArgs) return false;
    return key == other.key && productId == other.productId;
  }

  @override
  int get hashCode => key.hashCode ^ productId.hashCode;
}

/// generated route for
/// [_i35.ReminderScreen]
class ReminderRoute extends _i44.PageRouteInfo<void> {
  const ReminderRoute({List<_i44.PageRouteInfo>? children})
    : super(ReminderRoute.name, initialChildren: children);

  static const String name = 'ReminderRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i35.ReminderScreen();
    },
  );
}

/// generated route for
/// [_i36.ServerErrorScreen]
class ServerErrorRoute extends _i44.PageRouteInfo<void> {
  const ServerErrorRoute({List<_i44.PageRouteInfo>? children})
    : super(ServerErrorRoute.name, initialChildren: children);

  static const String name = 'ServerErrorRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i36.ServerErrorScreen();
    },
  );
}

/// generated route for
/// [_i37.SettingsScreen]
class SettingsRoute extends _i44.PageRouteInfo<void> {
  const SettingsRoute({List<_i44.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i37.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i38.SignupWithEmailPasswordScreen]
class SignupWithEmailPasswordRoute
    extends _i44.PageRouteInfo<SignupWithEmailPasswordRouteArgs> {
  SignupWithEmailPasswordRoute({
    _i45.Key? key,
    _i48.SignupBloc? signupBloc,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         SignupWithEmailPasswordRoute.name,
         args: SignupWithEmailPasswordRouteArgs(
           key: key,
           signupBloc: signupBloc,
         ),
         initialChildren: children,
       );

  static const String name = 'SignupWithEmailPasswordRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignupWithEmailPasswordRouteArgs>(
        orElse: () => const SignupWithEmailPasswordRouteArgs(),
      );
      return _i38.SignupWithEmailPasswordScreen(
        key: args.key,
        signupBloc: args.signupBloc,
      );
    },
  );
}

class SignupWithEmailPasswordRouteArgs {
  const SignupWithEmailPasswordRouteArgs({this.key, this.signupBloc});

  final _i45.Key? key;

  final _i48.SignupBloc? signupBloc;

  @override
  String toString() {
    return 'SignupWithEmailPasswordRouteArgs{key: $key, signupBloc: $signupBloc}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignupWithEmailPasswordRouteArgs) return false;
    return key == other.key && signupBloc == other.signupBloc;
  }

  @override
  int get hashCode => key.hashCode ^ signupBloc.hashCode;
}

/// generated route for
/// [_i39.SslConnectionFailedScreen]
class SslConnectionFailedRoute extends _i44.PageRouteInfo<void> {
  const SslConnectionFailedRoute({List<_i44.PageRouteInfo>? children})
    : super(SslConnectionFailedRoute.name, initialChildren: children);

  static const String name = 'SslConnectionFailedRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i39.SslConnectionFailedScreen();
    },
  );
}

/// generated route for
/// [_i40.SubscriptionScreen]
class SubscriptionRoute extends _i44.PageRouteInfo<void> {
  const SubscriptionRoute({List<_i44.PageRouteInfo>? children})
    : super(SubscriptionRoute.name, initialChildren: children);

  static const String name = 'SubscriptionRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i40.SubscriptionScreen();
    },
  );
}

/// generated route for
/// [_i41.UnderMaintenanceScreen]
class UnderMaintenanceRoute extends _i44.PageRouteInfo<void> {
  const UnderMaintenanceRoute({List<_i44.PageRouteInfo>? children})
    : super(UnderMaintenanceRoute.name, initialChildren: children);

  static const String name = 'UnderMaintenanceRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i41.UnderMaintenanceScreen();
    },
  );
}

/// generated route for
/// [_i42.VerifyEmailScreen]
class VerifyEmailRoute extends _i44.PageRouteInfo<VerifyEmailRouteArgs> {
  VerifyEmailRoute({
    _i45.Key? key,
    required String email,
    bool isSignUp = false,
    List<_i44.PageRouteInfo>? children,
  }) : super(
         VerifyEmailRoute.name,
         args: VerifyEmailRouteArgs(key: key, email: email, isSignUp: isSignUp),
         initialChildren: children,
       );

  static const String name = 'VerifyEmailRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyEmailRouteArgs>();
      return _i42.VerifyEmailScreen(
        key: args.key,
        email: args.email,
        isSignUp: args.isSignUp,
      );
    },
  );
}

class VerifyEmailRouteArgs {
  const VerifyEmailRouteArgs({
    this.key,
    required this.email,
    this.isSignUp = false,
  });

  final _i45.Key? key;

  final String email;

  final bool isSignUp;

  @override
  String toString() {
    return 'VerifyEmailRouteArgs{key: $key, email: $email, isSignUp: $isSignUp}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VerifyEmailRouteArgs) return false;
    return key == other.key &&
        email == other.email &&
        isSignUp == other.isSignUp;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode ^ isSignUp.hashCode;
}

/// generated route for
/// [_i43.WishlistScreen]
class WishlistRoute extends _i44.PageRouteInfo<void> {
  const WishlistRoute({List<_i44.PageRouteInfo>? children})
    : super(WishlistRoute.name, initialChildren: children);

  static const String name = 'WishlistRoute';

  static _i44.PageInfo page = _i44.PageInfo(
    name,
    builder: (data) {
      return const _i43.WishlistScreen();
    },
  );
}
