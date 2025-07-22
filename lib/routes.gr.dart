// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i34;
import 'package:flutter/material.dart' as _i35;
import 'package:flutter_skeleton/presentation/account_delete_success/account_delete_success_screen.dart'
    as _i1;
import 'package:flutter_skeleton/presentation/chat/chat_conversations.dart'
    as _i5;
import 'package:flutter_skeleton/presentation/chat/chat_screen.dart' as _i6;
import 'package:flutter_skeleton/presentation/chat/model/chat_model.dart'
    as _i37;
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
import 'package:flutter_skeleton/presentation/home/home_screen.dart' as _i15;
import 'package:flutter_skeleton/presentation/initial/initial_screen.dart'
    as _i16;
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart'
    as _i36;
import 'package:flutter_skeleton/presentation/login_signup/login/login_screen.dart'
    as _i17;
import 'package:flutter_skeleton/presentation/login_signup/login/screens/check_your_email/check_your_email_screen.dart'
    as _i7;
import 'package:flutter_skeleton/presentation/login_signup/login/screens/forgot_password/forgot_password_screen.dart'
    as _i14;
import 'package:flutter_skeleton/presentation/login_signup/login/screens/login_with_email/login_with_email_password_screen.dart'
    as _i18;
import 'package:flutter_skeleton/presentation/login_signup/login/screens/login_with_phone_number/login_with_phone_number_screen.dart'
    as _i19;
import 'package:flutter_skeleton/presentation/login_signup/login/screens/phone_num_otp_screen/phone_number_otp_screen.dart'
    as _i24;
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/phone_num_verified_page/phone_number_verified_screen.dart'
    as _i25;
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/profile_picture/add_profile_picture_screen.dart'
    as _i3;
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/signup_with_email/create_your_password_screen.dart'
    as _i10;
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/signup_with_email/signup_with_email_password_screen.dart'
    as _i30;
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/verify_email_screen/verify_email_screen.dart'
    as _i32;
import 'package:flutter_skeleton/presentation/login_signup/signup/signup_screen.dart'
    as _i29;
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
import 'package:flutter_skeleton/presentation/under_maintainace/under_maintenance_screen.dart'
    as _i31;
import 'package:flutter_skeleton/presentation/wishlist/wishlist_screen.dart'
    as _i33;
import 'package:flutter_skeleton/widgets/attachment_view.dart' as _i21;

/// generated route for
/// [_i1.AccountDeleteSuccessScreen]
class AccountDeleteSuccessRoute extends _i34.PageRouteInfo<void> {
  const AccountDeleteSuccessRoute({List<_i34.PageRouteInfo>? children})
    : super(AccountDeleteSuccessRoute.name, initialChildren: children);

  static const String name = 'AccountDeleteSuccessRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountDeleteSuccessScreen();
    },
  );
}

/// generated route for
/// [_i2.AddAddressScreen]
class AddAddressRoute extends _i34.PageRouteInfo<void> {
  const AddAddressRoute({List<_i34.PageRouteInfo>? children})
    : super(AddAddressRoute.name, initialChildren: children);

  static const String name = 'AddAddressRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddAddressScreen();
    },
  );
}

/// generated route for
/// [_i3.AddProfilePictureScreen]
class AddProfilePictureRoute
    extends _i34.PageRouteInfo<AddProfilePictureRouteArgs> {
  AddProfilePictureRoute({
    _i35.Key? key,
    required _i36.LoginBloc loginBloc,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         AddProfilePictureRoute.name,
         args: AddProfilePictureRouteArgs(key: key, loginBloc: loginBloc),
         initialChildren: children,
       );

  static const String name = 'AddProfilePictureRoute';

  static _i34.PageInfo page = _i34.PageInfo(
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

  final _i35.Key? key;

  final _i36.LoginBloc loginBloc;

  @override
  String toString() {
    return 'AddProfilePictureRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i4.AvailableCouponsScreen]
class AvailableCouponsRoute extends _i34.PageRouteInfo<void> {
  const AvailableCouponsRoute({List<_i34.PageRouteInfo>? children})
    : super(AvailableCouponsRoute.name, initialChildren: children);

  static const String name = 'AvailableCouponsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i4.AvailableCouponsScreen();
    },
  );
}

/// generated route for
/// [_i5.ChatConversationScreen]
class ChatConversationRoute
    extends _i34.PageRouteInfo<ChatConversationRouteArgs> {
  ChatConversationRoute({
    _i35.Key? key,
    required _i37.ChatModel chatUser,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         ChatConversationRoute.name,
         args: ChatConversationRouteArgs(key: key, chatUser: chatUser),
         initialChildren: children,
       );

  static const String name = 'ChatConversationRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatConversationRouteArgs>();
      return _i5.ChatConversationScreen(key: args.key, chatUser: args.chatUser);
    },
  );
}

class ChatConversationRouteArgs {
  const ChatConversationRouteArgs({this.key, required this.chatUser});

  final _i35.Key? key;

  final _i37.ChatModel chatUser;

  @override
  String toString() {
    return 'ChatConversationRouteArgs{key: $key, chatUser: $chatUser}';
  }
}

/// generated route for
/// [_i6.ChatScreen]
class ChatRoute extends _i34.PageRouteInfo<void> {
  const ChatRoute({List<_i34.PageRouteInfo>? children})
    : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i6.ChatScreen();
    },
  );
}

/// generated route for
/// [_i7.CheckYourEmailScreen]
class CheckYourEmailRoute extends _i34.PageRouteInfo<CheckYourEmailRouteArgs> {
  CheckYourEmailRoute({
    _i35.Key? key,
    required _i36.LoginBloc loginBloc,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         CheckYourEmailRoute.name,
         args: CheckYourEmailRouteArgs(key: key, loginBloc: loginBloc),
         initialChildren: children,
       );

  static const String name = 'CheckYourEmailRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CheckYourEmailRouteArgs>();
      return _i7.CheckYourEmailScreen(key: args.key, loginBloc: args.loginBloc);
    },
  );
}

class CheckYourEmailRouteArgs {
  const CheckYourEmailRouteArgs({this.key, required this.loginBloc});

  final _i35.Key? key;

  final _i36.LoginBloc loginBloc;

  @override
  String toString() {
    return 'CheckYourEmailRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i8.ContactUsScreen]
class ContactUsRoute extends _i34.PageRouteInfo<void> {
  const ContactUsRoute({List<_i34.PageRouteInfo>? children})
    : super(ContactUsRoute.name, initialChildren: children);

  static const String name = 'ContactUsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i8.ContactUsScreen();
    },
  );
}

/// generated route for
/// [_i9.ContactUsSubmittedScreen]
class ContactUsSubmittedRoute extends _i34.PageRouteInfo<void> {
  const ContactUsSubmittedRoute({List<_i34.PageRouteInfo>? children})
    : super(ContactUsSubmittedRoute.name, initialChildren: children);

  static const String name = 'ContactUsSubmittedRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i9.ContactUsSubmittedScreen();
    },
  );
}

/// generated route for
/// [_i10.CreateYourPasswordScreen]
class CreateYourPasswordRoute
    extends _i34.PageRouteInfo<CreateYourPasswordRouteArgs> {
  CreateYourPasswordRoute({
    _i35.Key? key,
    required _i36.LoginBloc loginBloc,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         CreateYourPasswordRoute.name,
         args: CreateYourPasswordRouteArgs(key: key, loginBloc: loginBloc),
         initialChildren: children,
       );

  static const String name = 'CreateYourPasswordRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateYourPasswordRouteArgs>();
      return _i10.CreateYourPasswordScreen(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class CreateYourPasswordRouteArgs {
  const CreateYourPasswordRouteArgs({this.key, required this.loginBloc});

  final _i35.Key? key;

  final _i36.LoginBloc loginBloc;

  @override
  String toString() {
    return 'CreateYourPasswordRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i11.DeleteAccountScreen]
class DeleteAccountRoute extends _i34.PageRouteInfo<void> {
  const DeleteAccountRoute({List<_i34.PageRouteInfo>? children})
    : super(DeleteAccountRoute.name, initialChildren: children);

  static const String name = 'DeleteAccountRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i11.DeleteAccountScreen();
    },
  );
}

/// generated route for
/// [_i12.EditAddressScreen]
class EditAddressRoute extends _i34.PageRouteInfo<void> {
  const EditAddressRoute({List<_i34.PageRouteInfo>? children})
    : super(EditAddressRoute.name, initialChildren: children);

  static const String name = 'EditAddressRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i12.EditAddressScreen();
    },
  );
}

/// generated route for
/// [_i13.EmptyViewsScreen]
class EmptyViewsRoute extends _i34.PageRouteInfo<void> {
  const EmptyViewsRoute({List<_i34.PageRouteInfo>? children})
    : super(EmptyViewsRoute.name, initialChildren: children);

  static const String name = 'EmptyViewsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i13.EmptyViewsScreen();
    },
  );
}

/// generated route for
/// [_i14.ForgotPasswordV2Screen]
class ForgotPasswordV2Route
    extends _i34.PageRouteInfo<ForgotPasswordV2RouteArgs> {
  ForgotPasswordV2Route({
    _i35.Key? key,
    required _i36.LoginBloc loginBloc,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         ForgotPasswordV2Route.name,
         args: ForgotPasswordV2RouteArgs(key: key, loginBloc: loginBloc),
         initialChildren: children,
       );

  static const String name = 'ForgotPasswordV2Route';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordV2RouteArgs>();
      return _i14.ForgotPasswordV2Screen(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class ForgotPasswordV2RouteArgs {
  const ForgotPasswordV2RouteArgs({this.key, required this.loginBloc});

  final _i35.Key? key;

  final _i36.LoginBloc loginBloc;

  @override
  String toString() {
    return 'ForgotPasswordV2RouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i15.HomeScreen]
class HomeRoute extends _i34.PageRouteInfo<void> {
  const HomeRoute({List<_i34.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i15.HomeScreen();
    },
  );
}

/// generated route for
/// [_i16.InitialScreen]
class InitialRoute extends _i34.PageRouteInfo<void> {
  const InitialRoute({List<_i34.PageRouteInfo>? children})
    : super(InitialRoute.name, initialChildren: children);

  static const String name = 'InitialRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i16.InitialScreen();
    },
  );
}

/// generated route for
/// [_i17.LoginScreen]
class LoginRoute extends _i34.PageRouteInfo<void> {
  const LoginRoute({List<_i34.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i17.LoginScreen();
    },
  );
}

/// generated route for
/// [_i18.LoginWithEmailPasswordScreen]
class LoginWithEmailPasswordRoute
    extends _i34.PageRouteInfo<LoginWithEmailPasswordRouteArgs> {
  LoginWithEmailPasswordRoute({
    _i35.Key? key,
    required _i36.LoginBloc loginBloc,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         LoginWithEmailPasswordRoute.name,
         args: LoginWithEmailPasswordRouteArgs(key: key, loginBloc: loginBloc),
         initialChildren: children,
       );

  static const String name = 'LoginWithEmailPasswordRoute';

  static _i34.PageInfo page = _i34.PageInfo(
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

  final _i35.Key? key;

  final _i36.LoginBloc loginBloc;

  @override
  String toString() {
    return 'LoginWithEmailPasswordRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i19.LoginWithPhoneNumberScreen]
class LoginWithPhoneNumberRoute extends _i34.PageRouteInfo<void> {
  const LoginWithPhoneNumberRoute({List<_i34.PageRouteInfo>? children})
    : super(LoginWithPhoneNumberRoute.name, initialChildren: children);

  static const String name = 'LoginWithPhoneNumberRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i19.LoginWithPhoneNumberScreen();
    },
  );
}

/// generated route for
/// [_i20.MyOrdersScreen]
class MyOrdersRoute extends _i34.PageRouteInfo<void> {
  const MyOrdersRoute({List<_i34.PageRouteInfo>? children})
    : super(MyOrdersRoute.name, initialChildren: children);

  static const String name = 'MyOrdersRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i20.MyOrdersScreen();
    },
  );
}

/// generated route for
/// [_i21.NetworkImageScreen]
class NetworkImageRoute extends _i34.PageRouteInfo<NetworkImageRouteArgs> {
  NetworkImageRoute({
    _i35.Key? key,
    required String link,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         NetworkImageRoute.name,
         args: NetworkImageRouteArgs(key: key, link: link),
         initialChildren: children,
       );

  static const String name = 'NetworkImageRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NetworkImageRouteArgs>();
      return _i21.NetworkImageScreen(key: args.key, link: args.link);
    },
  );
}

class NetworkImageRouteArgs {
  const NetworkImageRouteArgs({this.key, required this.link});

  final _i35.Key? key;

  final String link;

  @override
  String toString() {
    return 'NetworkImageRouteArgs{key: $key, link: $link}';
  }
}

/// generated route for
/// [_i22.NoInternetScreen]
class NoInternetRoute extends _i34.PageRouteInfo<void> {
  const NoInternetRoute({List<_i34.PageRouteInfo>? children})
    : super(NoInternetRoute.name, initialChildren: children);

  static const String name = 'NoInternetRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i22.NoInternetScreen();
    },
  );
}

/// generated route for
/// [_i23.NotificationsScreen]
class NotificationsRoute extends _i34.PageRouteInfo<void> {
  const NotificationsRoute({List<_i34.PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i23.NotificationsScreen();
    },
  );
}

/// generated route for
/// [_i24.PhoneNumberOTPScreen]
class PhoneNumberOTPRoute extends _i34.PageRouteInfo<PhoneNumberOTPRouteArgs> {
  PhoneNumberOTPRoute({
    _i35.Key? key,
    required _i36.LoginBloc loginBloc,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         PhoneNumberOTPRoute.name,
         args: PhoneNumberOTPRouteArgs(key: key, loginBloc: loginBloc),
         initialChildren: children,
       );

  static const String name = 'PhoneNumberOTPRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhoneNumberOTPRouteArgs>();
      return _i24.PhoneNumberOTPScreen(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class PhoneNumberOTPRouteArgs {
  const PhoneNumberOTPRouteArgs({this.key, required this.loginBloc});

  final _i35.Key? key;

  final _i36.LoginBloc loginBloc;

  @override
  String toString() {
    return 'PhoneNumberOTPRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i25.PhoneNumberVerifiedScreen]
class PhoneNumberVerifiedRoute
    extends _i34.PageRouteInfo<PhoneNumberVerifiedRouteArgs> {
  PhoneNumberVerifiedRoute({
    _i35.Key? key,
    required _i36.LoginBloc loginBloc,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         PhoneNumberVerifiedRoute.name,
         args: PhoneNumberVerifiedRouteArgs(key: key, loginBloc: loginBloc),
         initialChildren: children,
       );

  static const String name = 'PhoneNumberVerifiedRoute';

  static _i34.PageInfo page = _i34.PageInfo(
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

  final _i35.Key? key;

  final _i36.LoginBloc loginBloc;

  @override
  String toString() {
    return 'PhoneNumberVerifiedRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i26.SavedCardScreen]
class SavedCardRoute extends _i34.PageRouteInfo<void> {
  const SavedCardRoute({List<_i34.PageRouteInfo>? children})
    : super(SavedCardRoute.name, initialChildren: children);

  static const String name = 'SavedCardRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i26.SavedCardScreen();
    },
  );
}

/// generated route for
/// [_i27.ServerErrorScreen]
class ServerErrorRoute extends _i34.PageRouteInfo<void> {
  const ServerErrorRoute({List<_i34.PageRouteInfo>? children})
    : super(ServerErrorRoute.name, initialChildren: children);

  static const String name = 'ServerErrorRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i27.ServerErrorScreen();
    },
  );
}

/// generated route for
/// [_i28.SettingsScreen]
class SettingsRoute extends _i34.PageRouteInfo<void> {
  const SettingsRoute({List<_i34.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i28.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i29.SignUpScreen]
class SignUpRoute extends _i34.PageRouteInfo<void> {
  const SignUpRoute({List<_i34.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i29.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i30.SignupWithEmailPasswordScreen]
class SignupWithEmailPasswordRoute
    extends _i34.PageRouteInfo<SignupWithEmailPasswordRouteArgs> {
  SignupWithEmailPasswordRoute({
    _i35.Key? key,
    required _i36.LoginBloc loginBloc,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         SignupWithEmailPasswordRoute.name,
         args: SignupWithEmailPasswordRouteArgs(key: key, loginBloc: loginBloc),
         initialChildren: children,
       );

  static const String name = 'SignupWithEmailPasswordRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignupWithEmailPasswordRouteArgs>();
      return _i30.SignupWithEmailPasswordScreen(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class SignupWithEmailPasswordRouteArgs {
  const SignupWithEmailPasswordRouteArgs({this.key, required this.loginBloc});

  final _i35.Key? key;

  final _i36.LoginBloc loginBloc;

  @override
  String toString() {
    return 'SignupWithEmailPasswordRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i31.UnderMaintenanceScreen]
class UnderMaintenanceRoute extends _i34.PageRouteInfo<void> {
  const UnderMaintenanceRoute({List<_i34.PageRouteInfo>? children})
    : super(UnderMaintenanceRoute.name, initialChildren: children);

  static const String name = 'UnderMaintenanceRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i31.UnderMaintenanceScreen();
    },
  );
}

/// generated route for
/// [_i32.VerifyEmailScreen]
class VerifyEmailRoute extends _i34.PageRouteInfo<VerifyEmailRouteArgs> {
  VerifyEmailRoute({
    _i35.Key? key,
    required _i36.LoginBloc loginBloc,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         VerifyEmailRoute.name,
         args: VerifyEmailRouteArgs(key: key, loginBloc: loginBloc),
         initialChildren: children,
       );

  static const String name = 'VerifyEmailRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyEmailRouteArgs>();
      return _i32.VerifyEmailScreen(key: args.key, loginBloc: args.loginBloc);
    },
  );
}

class VerifyEmailRouteArgs {
  const VerifyEmailRouteArgs({this.key, required this.loginBloc});

  final _i35.Key? key;

  final _i36.LoginBloc loginBloc;

  @override
  String toString() {
    return 'VerifyEmailRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i33.WishlistScreen]
class WishlistRoute extends _i34.PageRouteInfo<void> {
  const WishlistRoute({List<_i34.PageRouteInfo>? children})
    : super(WishlistRoute.name, initialChildren: children);

  static const String name = 'WishlistRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i33.WishlistScreen();
    },
  );
}
