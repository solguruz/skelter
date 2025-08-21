// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i33;
import 'package:flutter/material.dart' as _i34;
import 'package:flutter_skeleton/presentation/account_delete_success/account_delete_success_screen.dart'
    as _i1;
import 'package:flutter_skeleton/presentation/chat/chat_conversations.dart'
    as _i5;
import 'package:flutter_skeleton/presentation/chat/chat_screen.dart' as _i6;
import 'package:flutter_skeleton/presentation/chat/model/chat_model.dart'
    as _i36;
import 'package:flutter_skeleton/presentation/contact_us/contact_us_screen.dart'
    as _i8;
import 'package:flutter_skeleton/presentation/contact_us/contact_us_submitted_screen.dart'
    as _i9;
import 'package:flutter_skeleton/presentation/coupons/available_coupons.dart'
    as _i4;
import 'package:flutter_skeleton/presentation/delete_account/delete_account_screen.dart'
    as _i11;
import 'package:flutter_skeleton/presentation/empty_screens/empty_view_screens.dart'
    as _i13;
import 'package:flutter_skeleton/presentation/force_update/force_update_screen.dart'
    as _i14;
import 'package:flutter_skeleton/presentation/home/home_screen.dart' as _i16;
import 'package:flutter_skeleton/presentation/initial/initial_screen.dart'
    as _i17;
import 'package:flutter_skeleton/presentation/login/bloc/login_bloc.dart'
    as _i35;
import 'package:flutter_skeleton/presentation/login/screens/check_your_email/check_your_email_screen.dart'
    as _i7;
import 'package:flutter_skeleton/presentation/login/screens/forgot_password/forgot_password_screen.dart'
    as _i15;
import 'package:flutter_skeleton/presentation/login/screens/login_with_email/login_with_email_password_screen.dart'
    as _i18;
import 'package:flutter_skeleton/presentation/login/screens/login_with_phone_number/login_with_phone_number_screen.dart'
    as _i19;
import 'package:flutter_skeleton/presentation/login/screens/phone_num_otp_screen/phone_number_otp_screen.dart'
    as _i24;
import 'package:flutter_skeleton/presentation/my_orders/my_orders_screen.dart'
    as _i20;
import 'package:flutter_skeleton/presentation/no_internet/no_internet_screen.dart'
    as _i22;
import 'package:flutter_skeleton/presentation/notifications/notifications_screen.dart'
    as _i23;
import 'package:flutter_skeleton/presentation/saved_cards/saved_card_screen.dart'
    as _i26;
import 'package:flutter_skeleton/presentation/server_error/server_error_screen.dart'
    as _i27;
import 'package:flutter_skeleton/presentation/settings/settings_screen.dart'
    as _i28;
import 'package:flutter_skeleton/presentation/shipping_address/add_address.dart'
    as _i2;
import 'package:flutter_skeleton/presentation/shipping_address/edit_address.dart'
    as _i12;
import 'package:flutter_skeleton/presentation/signup/bloc/signup_bloc.dart'
    as _i37;
import 'package:flutter_skeleton/presentation/signup/screens/phone_num_verified_page/phone_number_verified_screen.dart'
    as _i25;
import 'package:flutter_skeleton/presentation/signup/screens/profile_picture/add_profile_picture_screen.dart'
    as _i3;
import 'package:flutter_skeleton/presentation/signup/screens/signup_with_email/create_your_password_screen.dart'
    as _i10;
import 'package:flutter_skeleton/presentation/signup/screens/signup_with_email/signup_with_email_password_screen.dart'
    as _i29;
import 'package:flutter_skeleton/presentation/under_maintainace/under_maintenance_screen.dart'
    as _i30;
import 'package:flutter_skeleton/presentation/verify_email/screens/verify_email_screen.dart'
    as _i31;
import 'package:flutter_skeleton/presentation/wishlist/wishlist_screen.dart'
    as _i32;
import 'package:flutter_skeleton/widgets/attachment_view.dart' as _i21;

/// generated route for
/// [_i1.AccountDeleteSuccessScreen]
class AccountDeleteSuccessRoute extends _i33.PageRouteInfo<void> {
  const AccountDeleteSuccessRoute({List<_i33.PageRouteInfo>? children})
      : super(AccountDeleteSuccessRoute.name, initialChildren: children);

  static const String name = 'AccountDeleteSuccessRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountDeleteSuccessScreen();
    },
  );
}

/// generated route for
/// [_i2.AddAddressScreen]
class AddAddressRoute extends _i33.PageRouteInfo<void> {
  const AddAddressRoute({List<_i33.PageRouteInfo>? children})
      : super(AddAddressRoute.name, initialChildren: children);

  static const String name = 'AddAddressRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddAddressScreen();
    },
  );
}

/// generated route for
/// [_i3.AddProfilePictureScreen]
class AddProfilePictureRoute
    extends _i33.PageRouteInfo<AddProfilePictureRouteArgs> {
  AddProfilePictureRoute({
    _i34.Key? key,
    required _i35.LoginBloc loginBloc,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          AddProfilePictureRoute.name,
          args: AddProfilePictureRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'AddProfilePictureRoute';

  static _i33.PageInfo page = _i33.PageInfo(
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

  final _i34.Key? key;

  final _i35.LoginBloc loginBloc;

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
class AvailableCouponsRoute extends _i33.PageRouteInfo<void> {
  const AvailableCouponsRoute({List<_i33.PageRouteInfo>? children})
      : super(AvailableCouponsRoute.name, initialChildren: children);

  static const String name = 'AvailableCouponsRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i4.AvailableCouponsScreen();
    },
  );
}

/// generated route for
/// [_i5.ChatConversationScreen]
class ChatConversationRoute
    extends _i33.PageRouteInfo<ChatConversationRouteArgs> {
  ChatConversationRoute({
    _i34.Key? key,
    required _i36.ChatModel chatUser,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          ChatConversationRoute.name,
          args: ChatConversationRouteArgs(key: key, chatUser: chatUser),
          initialChildren: children,
        );

  static const String name = 'ChatConversationRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatConversationRouteArgs>();
      return _i5.ChatConversationScreen(key: args.key, chatUser: args.chatUser);
    },
  );
}

class ChatConversationRouteArgs {
  const ChatConversationRouteArgs({this.key, required this.chatUser});

  final _i34.Key? key;

  final _i36.ChatModel chatUser;

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
/// [_i6.ChatScreen]
class ChatRoute extends _i33.PageRouteInfo<void> {
  const ChatRoute({List<_i33.PageRouteInfo>? children})
      : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i6.ChatScreen();
    },
  );
}

/// generated route for
/// [_i7.CheckYourEmailScreen]
class CheckYourEmailRoute extends _i33.PageRouteInfo<CheckYourEmailRouteArgs> {
  CheckYourEmailRoute({
    _i34.Key? key,
    required _i35.LoginBloc loginBloc,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          CheckYourEmailRoute.name,
          args: CheckYourEmailRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'CheckYourEmailRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CheckYourEmailRouteArgs>();
      return _i7.CheckYourEmailScreen(key: args.key, loginBloc: args.loginBloc);
    },
  );
}

class CheckYourEmailRouteArgs {
  const CheckYourEmailRouteArgs({this.key, required this.loginBloc});

  final _i34.Key? key;

  final _i35.LoginBloc loginBloc;

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
/// [_i8.ContactUsScreen]
class ContactUsRoute extends _i33.PageRouteInfo<void> {
  const ContactUsRoute({List<_i33.PageRouteInfo>? children})
      : super(ContactUsRoute.name, initialChildren: children);

  static const String name = 'ContactUsRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i8.ContactUsScreen();
    },
  );
}

/// generated route for
/// [_i9.ContactUsSubmittedScreen]
class ContactUsSubmittedRoute extends _i33.PageRouteInfo<void> {
  const ContactUsSubmittedRoute({List<_i33.PageRouteInfo>? children})
      : super(ContactUsSubmittedRoute.name, initialChildren: children);

  static const String name = 'ContactUsSubmittedRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i9.ContactUsSubmittedScreen();
    },
  );
}

/// generated route for
/// [_i10.CreateYourPasswordScreen]
class CreateYourPasswordRoute
    extends _i33.PageRouteInfo<CreateYourPasswordRouteArgs> {
  CreateYourPasswordRoute({
    _i34.Key? key,
    required _i37.SignupBloc signupBloc,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          CreateYourPasswordRoute.name,
          args: CreateYourPasswordRouteArgs(key: key, signupBloc: signupBloc),
          initialChildren: children,
        );

  static const String name = 'CreateYourPasswordRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateYourPasswordRouteArgs>();
      return _i10.CreateYourPasswordScreen(
        key: args.key,
        signupBloc: args.signupBloc,
      );
    },
  );
}

class CreateYourPasswordRouteArgs {
  const CreateYourPasswordRouteArgs({this.key, required this.signupBloc});

  final _i34.Key? key;

  final _i37.SignupBloc signupBloc;

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
/// [_i11.DeleteAccountScreen]
class DeleteAccountRoute extends _i33.PageRouteInfo<void> {
  const DeleteAccountRoute({List<_i33.PageRouteInfo>? children})
      : super(DeleteAccountRoute.name, initialChildren: children);

  static const String name = 'DeleteAccountRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i11.DeleteAccountScreen();
    },
  );
}

/// generated route for
/// [_i12.EditAddressScreen]
class EditAddressRoute extends _i33.PageRouteInfo<void> {
  const EditAddressRoute({List<_i33.PageRouteInfo>? children})
      : super(EditAddressRoute.name, initialChildren: children);

  static const String name = 'EditAddressRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i12.EditAddressScreen();
    },
  );
}

/// generated route for
/// [_i13.EmptyViewsScreen]
class EmptyViewsRoute extends _i33.PageRouteInfo<void> {
  const EmptyViewsRoute({List<_i33.PageRouteInfo>? children})
      : super(EmptyViewsRoute.name, initialChildren: children);

  static const String name = 'EmptyViewsRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i13.EmptyViewsScreen();
    },
  );
}

/// generated route for
/// [_i14.ForceUpdateScreen]
class ForceUpdateRoute extends _i33.PageRouteInfo<ForceUpdateRouteArgs> {
  ForceUpdateRoute({
    _i34.Key? key,
    required bool isMandatoryUpdate,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          ForceUpdateRoute.name,
          args: ForceUpdateRouteArgs(
            key: key,
            isMandatoryUpdate: isMandatoryUpdate,
          ),
          initialChildren: children,
        );

  static const String name = 'ForceUpdateRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForceUpdateRouteArgs>();
      return _i14.ForceUpdateScreen(
        key: args.key,
        isMandatoryUpdate: args.isMandatoryUpdate,
      );
    },
  );
}

class ForceUpdateRouteArgs {
  const ForceUpdateRouteArgs({this.key, required this.isMandatoryUpdate});

  final _i34.Key? key;

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
/// [_i15.ForgotPasswordV2Screen]
class ForgotPasswordV2Route
    extends _i33.PageRouteInfo<ForgotPasswordV2RouteArgs> {
  ForgotPasswordV2Route({
    _i34.Key? key,
    required _i35.LoginBloc loginBloc,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordV2Route.name,
          args: ForgotPasswordV2RouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordV2Route';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordV2RouteArgs>();
      return _i15.ForgotPasswordV2Screen(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class ForgotPasswordV2RouteArgs {
  const ForgotPasswordV2RouteArgs({this.key, required this.loginBloc});

  final _i34.Key? key;

  final _i35.LoginBloc loginBloc;

  @override
  String toString() {
    return 'ForgotPasswordV2RouteArgs{key: $key, loginBloc: $loginBloc}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ForgotPasswordV2RouteArgs) return false;
    return key == other.key && loginBloc == other.loginBloc;
  }

  @override
  int get hashCode => key.hashCode ^ loginBloc.hashCode;
}

/// generated route for
/// [_i16.HomeScreen]
class HomeRoute extends _i33.PageRouteInfo<void> {
  const HomeRoute({List<_i33.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i16.HomeScreen();
    },
  );
}

/// generated route for
/// [_i17.InitialScreen]
class InitialRoute extends _i33.PageRouteInfo<void> {
  const InitialRoute({List<_i33.PageRouteInfo>? children})
      : super(InitialRoute.name, initialChildren: children);

  static const String name = 'InitialRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i17.InitialScreen();
    },
  );
}

/// generated route for
/// [_i18.LoginWithEmailPasswordScreen]
class LoginWithEmailPasswordRoute
    extends _i33.PageRouteInfo<LoginWithEmailPasswordRouteArgs> {
  LoginWithEmailPasswordRoute({
    _i34.Key? key,
    required _i35.LoginBloc loginBloc,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          LoginWithEmailPasswordRoute.name,
          args: LoginWithEmailPasswordRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'LoginWithEmailPasswordRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginWithEmailPasswordRouteArgs>();
      return _i18.LoginWithEmailPasswordScreen(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class LoginWithEmailPasswordRouteArgs {
  const LoginWithEmailPasswordRouteArgs({this.key, required this.loginBloc});

  final _i34.Key? key;

  final _i35.LoginBloc loginBloc;

  @override
  String toString() {
    return 'LoginWithEmailPasswordRouteArgs{key: $key, loginBloc: $loginBloc}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginWithEmailPasswordRouteArgs) return false;
    return key == other.key && loginBloc == other.loginBloc;
  }

  @override
  int get hashCode => key.hashCode ^ loginBloc.hashCode;
}

/// generated route for
/// [_i19.LoginWithPhoneNumberScreen]
class LoginWithPhoneNumberRoute
    extends _i33.PageRouteInfo<LoginWithPhoneNumberRouteArgs> {
  LoginWithPhoneNumberRoute({
    _i34.Key? key,
    bool isFromDeleteAccount = false,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          LoginWithPhoneNumberRoute.name,
          args: LoginWithPhoneNumberRouteArgs(
            key: key,
            isFromDeleteAccount: isFromDeleteAccount,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginWithPhoneNumberRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginWithPhoneNumberRouteArgs>(
        orElse: () => const LoginWithPhoneNumberRouteArgs(),
      );
      return _i19.LoginWithPhoneNumberScreen(
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

  final _i34.Key? key;

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
/// [_i20.MyOrdersScreen]
class MyOrdersRoute extends _i33.PageRouteInfo<void> {
  const MyOrdersRoute({List<_i33.PageRouteInfo>? children})
      : super(MyOrdersRoute.name, initialChildren: children);

  static const String name = 'MyOrdersRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i20.MyOrdersScreen();
    },
  );
}

/// generated route for
/// [_i21.NetworkImageScreen]
class NetworkImageRoute extends _i33.PageRouteInfo<NetworkImageRouteArgs> {
  NetworkImageRoute({
    _i34.Key? key,
    required String link,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          NetworkImageRoute.name,
          args: NetworkImageRouteArgs(key: key, link: link),
          initialChildren: children,
        );

  static const String name = 'NetworkImageRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NetworkImageRouteArgs>();
      return _i21.NetworkImageScreen(key: args.key, link: args.link);
    },
  );
}

class NetworkImageRouteArgs {
  const NetworkImageRouteArgs({this.key, required this.link});

  final _i34.Key? key;

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
/// [_i22.NoInternetScreen]
class NoInternetRoute extends _i33.PageRouteInfo<void> {
  const NoInternetRoute({List<_i33.PageRouteInfo>? children})
      : super(NoInternetRoute.name, initialChildren: children);

  static const String name = 'NoInternetRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i22.NoInternetScreen();
    },
  );
}

/// generated route for
/// [_i23.NotificationsScreen]
class NotificationsRoute extends _i33.PageRouteInfo<void> {
  const NotificationsRoute({List<_i33.PageRouteInfo>? children})
      : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i23.NotificationsScreen();
    },
  );
}

/// generated route for
/// [_i24.PhoneNumberOTPScreen]
class PhoneNumberOTPRoute extends _i33.PageRouteInfo<PhoneNumberOTPRouteArgs> {
  PhoneNumberOTPRoute({
    _i34.Key? key,
    required _i35.LoginBloc loginBloc,
    bool isFromDeleteAccount = false,
    List<_i33.PageRouteInfo>? children,
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

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhoneNumberOTPRouteArgs>();
      return _i24.PhoneNumberOTPScreen(
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

  final _i34.Key? key;

  final _i35.LoginBloc loginBloc;

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
/// [_i25.PhoneNumberVerifiedScreen]
class PhoneNumberVerifiedRoute
    extends _i33.PageRouteInfo<PhoneNumberVerifiedRouteArgs> {
  PhoneNumberVerifiedRoute({
    _i34.Key? key,
    required _i35.LoginBloc loginBloc,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          PhoneNumberVerifiedRoute.name,
          args: PhoneNumberVerifiedRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'PhoneNumberVerifiedRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhoneNumberVerifiedRouteArgs>();
      return _i25.PhoneNumberVerifiedScreen(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class PhoneNumberVerifiedRouteArgs {
  const PhoneNumberVerifiedRouteArgs({this.key, required this.loginBloc});

  final _i34.Key? key;

  final _i35.LoginBloc loginBloc;

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
/// [_i26.SavedCardScreen]
class SavedCardRoute extends _i33.PageRouteInfo<void> {
  const SavedCardRoute({List<_i33.PageRouteInfo>? children})
      : super(SavedCardRoute.name, initialChildren: children);

  static const String name = 'SavedCardRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i26.SavedCardScreen();
    },
  );
}

/// generated route for
/// [_i27.ServerErrorScreen]
class ServerErrorRoute extends _i33.PageRouteInfo<void> {
  const ServerErrorRoute({List<_i33.PageRouteInfo>? children})
      : super(ServerErrorRoute.name, initialChildren: children);

  static const String name = 'ServerErrorRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i27.ServerErrorScreen();
    },
  );
}

/// generated route for
/// [_i28.SettingsScreen]
class SettingsRoute extends _i33.PageRouteInfo<void> {
  const SettingsRoute({List<_i33.PageRouteInfo>? children})
      : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i28.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i29.SignupWithEmailPasswordScreen]
class SignupWithEmailPasswordRoute extends _i33.PageRouteInfo<void> {
  const SignupWithEmailPasswordRoute({List<_i33.PageRouteInfo>? children})
      : super(SignupWithEmailPasswordRoute.name, initialChildren: children);

  static const String name = 'SignupWithEmailPasswordRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i29.SignupWithEmailPasswordScreen();
    },
  );
}

/// generated route for
/// [_i30.UnderMaintenanceScreen]
class UnderMaintenanceRoute extends _i33.PageRouteInfo<void> {
  const UnderMaintenanceRoute({List<_i33.PageRouteInfo>? children})
      : super(UnderMaintenanceRoute.name, initialChildren: children);

  static const String name = 'UnderMaintenanceRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i30.UnderMaintenanceScreen();
    },
  );
}

/// generated route for
/// [_i31.VerifyEmailScreen]
class VerifyEmailRoute extends _i33.PageRouteInfo<VerifyEmailRouteArgs> {
  VerifyEmailRoute({
    _i34.Key? key,
    required String email,
    bool isSignUp = false,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          VerifyEmailRoute.name,
          args:
              VerifyEmailRouteArgs(key: key, email: email, isSignUp: isSignUp),
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyEmailRouteArgs>();
      return _i31.VerifyEmailScreen(
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

  final _i34.Key? key;

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
/// [_i32.WishlistScreen]
class WishlistRoute extends _i33.PageRouteInfo<void> {
  const WishlistRoute({List<_i33.PageRouteInfo>? children})
      : super(WishlistRoute.name, initialChildren: children);

  static const String name = 'WishlistRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i32.WishlistScreen();
    },
  );
}
