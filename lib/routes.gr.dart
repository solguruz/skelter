// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i31;
import 'package:flutter/material.dart' as _i32;
import 'package:flutter_skeleton/presentation/chat/chat_conversations.dart'
    as _i4;
import 'package:flutter_skeleton/presentation/chat/chat_page.dart' as _i5;
import 'package:flutter_skeleton/presentation/chat/model/chat_model.dart'
    as _i34;
import 'package:flutter_skeleton/presentation/contact_us/contact_us_page.dart'
    as _i7;
import 'package:flutter_skeleton/presentation/contact_us/contact_us_submitted_page.dart'
    as _i8;
import 'package:flutter_skeleton/presentation/coupons/available_coupons.dart'
    as _i3;
import 'package:flutter_skeleton/presentation/empty_screens/empty_screens_page.dart'
    as _i11;
import 'package:flutter_skeleton/presentation/home/home_page.dart' as _i13;
import 'package:flutter_skeleton/presentation/initial/initial_page.dart'
    as _i14;
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart'
    as _i33;
import 'package:flutter_skeleton/presentation/login_signup/login/login_page.dart'
    as _i15;
import 'package:flutter_skeleton/presentation/login_signup/login/pages/check_your_email/check_your_email_page.dart'
    as _i6;
import 'package:flutter_skeleton/presentation/login_signup/login/pages/forgot_password/forgot_password_page.dart'
    as _i12;
import 'package:flutter_skeleton/presentation/login_signup/login/pages/login_with_email/login_with_email_pass_page.dart'
    as _i16;
import 'package:flutter_skeleton/presentation/login_signup/login/pages/login_with_phone_number/login_with_phone_num_page.dart'
    as _i17;
import 'package:flutter_skeleton/presentation/login_signup/login/pages/phone_num_otp_page/phone_num_otp_page.dart'
    as _i22;
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/phone_num_verified_page/phone_num_verified_page.dart'
    as _i23;
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/profile_picture/add_profile_picture_page.dart'
    as _i2;
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/signup_with_email/create_your_password_page.dart'
    as _i9;
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/signup_with_email/signup_with_email_pass_page.dart'
    as _i27;
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/verify_email_page/verify_email_page.dart'
    as _i29;
import 'package:flutter_skeleton/presentation/login_signup/signup/signup_page.dart'
    as _i26;
import 'package:flutter_skeleton/presentation/my_orders/my_orders_page.dart'
    as _i18;
import 'package:flutter_skeleton/presentation/no_internet/no_internet_page.dart'
    as _i20;
import 'package:flutter_skeleton/presentation/notifications/notifications_page.dart'
    as _i21;
import 'package:flutter_skeleton/presentation/saved_cards/saved_card_page.dart'
    as _i24;
import 'package:flutter_skeleton/presentation/server_error/server_error_page.dart'
    as _i25;
import 'package:flutter_skeleton/presentation/shipping_address/add_address.dart'
    as _i1;
import 'package:flutter_skeleton/presentation/shipping_address/edit_address.dart'
    as _i10;
import 'package:flutter_skeleton/presentation/under_maintainace/under_maintenance_page.dart'
    as _i28;
import 'package:flutter_skeleton/presentation/wishlist/wishlist_page.dart'
    as _i30;
import 'package:flutter_skeleton/widgets/attachment_view.dart' as _i19;

/// generated route for
/// [_i1.AddAddressPage]
class AddAddressRoute extends _i31.PageRouteInfo<void> {
  const AddAddressRoute({List<_i31.PageRouteInfo>? children})
      : super(AddAddressRoute.name, initialChildren: children);

  static const String name = 'AddAddressRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddAddressPage();
    },
  );
}

/// generated route for
/// [_i2.AddProfilePicturePage]
class AddProfilePictureRoute
    extends _i31.PageRouteInfo<AddProfilePictureRouteArgs> {
  AddProfilePictureRoute({
    _i32.Key? key,
    required _i33.LoginBloc loginBloc,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          AddProfilePictureRoute.name,
          args: AddProfilePictureRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'AddProfilePictureRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddProfilePictureRouteArgs>();
      return _i2.AddProfilePicturePage(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class AddProfilePictureRouteArgs {
  const AddProfilePictureRouteArgs({this.key, required this.loginBloc});

  final _i32.Key? key;

  final _i33.LoginBloc loginBloc;

  @override
  String toString() {
    return 'AddProfilePictureRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i3.AvailableCouponsPage]
class AvailableCouponsRoute extends _i31.PageRouteInfo<void> {
  const AvailableCouponsRoute({List<_i31.PageRouteInfo>? children})
      : super(AvailableCouponsRoute.name, initialChildren: children);

  static const String name = 'AvailableCouponsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i3.AvailableCouponsPage();
    },
  );
}

/// generated route for
/// [_i4.ChatConversationPage]
class ChatConversationRoute
    extends _i31.PageRouteInfo<ChatConversationRouteArgs> {
  ChatConversationRoute({
    _i32.Key? key,
    required _i34.ChatModel chatUser,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          ChatConversationRoute.name,
          args: ChatConversationRouteArgs(key: key, chatUser: chatUser),
          initialChildren: children,
        );

  static const String name = 'ChatConversationRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatConversationRouteArgs>();
      return _i4.ChatConversationPage(key: args.key, chatUser: args.chatUser);
    },
  );
}

class ChatConversationRouteArgs {
  const ChatConversationRouteArgs({this.key, required this.chatUser});

  final _i32.Key? key;

  final _i34.ChatModel chatUser;

  @override
  String toString() {
    return 'ChatConversationRouteArgs{key: $key, chatUser: $chatUser}';
  }
}

/// generated route for
/// [_i5.ChatPage]
class ChatRoute extends _i31.PageRouteInfo<void> {
  const ChatRoute({List<_i31.PageRouteInfo>? children})
      : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i5.ChatPage();
    },
  );
}

/// generated route for
/// [_i6.CheckYourEmailPage]
class CheckYourEmailRoute extends _i31.PageRouteInfo<CheckYourEmailRouteArgs> {
  CheckYourEmailRoute({
    _i32.Key? key,
    required _i33.LoginBloc loginBloc,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          CheckYourEmailRoute.name,
          args: CheckYourEmailRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'CheckYourEmailRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CheckYourEmailRouteArgs>();
      return _i6.CheckYourEmailPage(key: args.key, loginBloc: args.loginBloc);
    },
  );
}

class CheckYourEmailRouteArgs {
  const CheckYourEmailRouteArgs({this.key, required this.loginBloc});

  final _i32.Key? key;

  final _i33.LoginBloc loginBloc;

  @override
  String toString() {
    return 'CheckYourEmailRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i7.ContactUsPage]
class ContactUsRoute extends _i31.PageRouteInfo<void> {
  const ContactUsRoute({List<_i31.PageRouteInfo>? children})
      : super(ContactUsRoute.name, initialChildren: children);

  static const String name = 'ContactUsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i7.ContactUsPage();
    },
  );
}

/// generated route for
/// [_i8.ContactUsSubmittedPage]
class ContactUsSubmittedRoute extends _i31.PageRouteInfo<void> {
  const ContactUsSubmittedRoute({List<_i31.PageRouteInfo>? children})
      : super(ContactUsSubmittedRoute.name, initialChildren: children);

  static const String name = 'ContactUsSubmittedRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i8.ContactUsSubmittedPage();
    },
  );
}

/// generated route for
/// [_i9.CreateYourPasswordPage]
class CreateYourPasswordRoute
    extends _i31.PageRouteInfo<CreateYourPasswordRouteArgs> {
  CreateYourPasswordRoute({
    _i32.Key? key,
    required _i33.LoginBloc loginBloc,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          CreateYourPasswordRoute.name,
          args: CreateYourPasswordRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'CreateYourPasswordRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateYourPasswordRouteArgs>();
      return _i9.CreateYourPasswordPage(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class CreateYourPasswordRouteArgs {
  const CreateYourPasswordRouteArgs({this.key, required this.loginBloc});

  final _i32.Key? key;

  final _i33.LoginBloc loginBloc;

  @override
  String toString() {
    return 'CreateYourPasswordRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i10.EditAddressPage]
class EditAddressRoute extends _i31.PageRouteInfo<void> {
  const EditAddressRoute({List<_i31.PageRouteInfo>? children})
      : super(EditAddressRoute.name, initialChildren: children);

  static const String name = 'EditAddressRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i10.EditAddressPage();
    },
  );
}

/// generated route for
/// [_i11.EmptyViewsPage]
class EmptyViewsRoute extends _i31.PageRouteInfo<void> {
  const EmptyViewsRoute({List<_i31.PageRouteInfo>? children})
      : super(EmptyViewsRoute.name, initialChildren: children);

  static const String name = 'EmptyViewsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i11.EmptyViewsPage();
    },
  );
}

/// generated route for
/// [_i12.ForgotPasswordV2Page]
class ForgotPasswordV2Route
    extends _i31.PageRouteInfo<ForgotPasswordV2RouteArgs> {
  ForgotPasswordV2Route({
    _i32.Key? key,
    required _i33.LoginBloc loginBloc,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordV2Route.name,
          args: ForgotPasswordV2RouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordV2Route';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordV2RouteArgs>();
      return _i12.ForgotPasswordV2Page(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class ForgotPasswordV2RouteArgs {
  const ForgotPasswordV2RouteArgs({this.key, required this.loginBloc});

  final _i32.Key? key;

  final _i33.LoginBloc loginBloc;

  @override
  String toString() {
    return 'ForgotPasswordV2RouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i13.HomePage]
class HomeRoute extends _i31.PageRouteInfo<void> {
  const HomeRoute({List<_i31.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i13.HomePage();
    },
  );
}

/// generated route for
/// [_i14.InitialPage]
class InitialRoute extends _i31.PageRouteInfo<void> {
  const InitialRoute({List<_i31.PageRouteInfo>? children})
      : super(InitialRoute.name, initialChildren: children);

  static const String name = 'InitialRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i14.InitialPage();
    },
  );
}

/// generated route for
/// [_i15.LoginPage]
class LoginRoute extends _i31.PageRouteInfo<void> {
  const LoginRoute({List<_i31.PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i15.LoginPage();
    },
  );
}

/// generated route for
/// [_i16.LoginWithEmailPasswordPage]
class LoginWithEmailPasswordRoute
    extends _i31.PageRouteInfo<LoginWithEmailPasswordRouteArgs> {
  LoginWithEmailPasswordRoute({
    _i32.Key? key,
    required _i33.LoginBloc loginBloc,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          LoginWithEmailPasswordRoute.name,
          args: LoginWithEmailPasswordRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'LoginWithEmailPasswordRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginWithEmailPasswordRouteArgs>();
      return _i16.LoginWithEmailPasswordPage(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class LoginWithEmailPasswordRouteArgs {
  const LoginWithEmailPasswordRouteArgs({this.key, required this.loginBloc});

  final _i32.Key? key;

  final _i33.LoginBloc loginBloc;

  @override
  String toString() {
    return 'LoginWithEmailPasswordRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i17.LoginWithPhoneNumberPage]
class LoginWithPhoneNumberRoute extends _i31.PageRouteInfo<void> {
  const LoginWithPhoneNumberRoute({List<_i31.PageRouteInfo>? children})
      : super(LoginWithPhoneNumberRoute.name, initialChildren: children);

  static const String name = 'LoginWithPhoneNumberRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i17.LoginWithPhoneNumberPage();
    },
  );
}

/// generated route for
/// [_i18.MyOrdersPage]
class MyOrdersRoute extends _i31.PageRouteInfo<void> {
  const MyOrdersRoute({List<_i31.PageRouteInfo>? children})
      : super(MyOrdersRoute.name, initialChildren: children);

  static const String name = 'MyOrdersRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i18.MyOrdersPage();
    },
  );
}

/// generated route for
/// [_i19.NetworkImagePage]
class NetworkImageRoute extends _i31.PageRouteInfo<NetworkImageRouteArgs> {
  NetworkImageRoute({
    _i32.Key? key,
    required String link,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          NetworkImageRoute.name,
          args: NetworkImageRouteArgs(key: key, link: link),
          initialChildren: children,
        );

  static const String name = 'NetworkImageRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NetworkImageRouteArgs>();
      return _i19.NetworkImagePage(key: args.key, link: args.link);
    },
  );
}

class NetworkImageRouteArgs {
  const NetworkImageRouteArgs({this.key, required this.link});

  final _i32.Key? key;

  final String link;

  @override
  String toString() {
    return 'NetworkImageRouteArgs{key: $key, link: $link}';
  }
}

/// generated route for
/// [_i20.NoInternetPage]
class NoInternetRoute extends _i31.PageRouteInfo<void> {
  const NoInternetRoute({List<_i31.PageRouteInfo>? children})
      : super(NoInternetRoute.name, initialChildren: children);

  static const String name = 'NoInternetRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i20.NoInternetPage();
    },
  );
}

/// generated route for
/// [_i21.NotificationsPage]
class NotificationsRoute extends _i31.PageRouteInfo<void> {
  const NotificationsRoute({List<_i31.PageRouteInfo>? children})
      : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i21.NotificationsPage();
    },
  );
}

/// generated route for
/// [_i22.PhoneNumberOTPPage]
class PhoneNumberOTPRoute extends _i31.PageRouteInfo<PhoneNumberOTPRouteArgs> {
  PhoneNumberOTPRoute({
    _i32.Key? key,
    required _i33.LoginBloc loginBloc,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          PhoneNumberOTPRoute.name,
          args: PhoneNumberOTPRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'PhoneNumberOTPRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhoneNumberOTPRouteArgs>();
      return _i22.PhoneNumberOTPPage(key: args.key, loginBloc: args.loginBloc);
    },
  );
}

class PhoneNumberOTPRouteArgs {
  const PhoneNumberOTPRouteArgs({this.key, required this.loginBloc});

  final _i32.Key? key;

  final _i33.LoginBloc loginBloc;

  @override
  String toString() {
    return 'PhoneNumberOTPRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i23.PhoneNumberVerifiedPage]
class PhoneNumberVerifiedRoute
    extends _i31.PageRouteInfo<PhoneNumberVerifiedRouteArgs> {
  PhoneNumberVerifiedRoute({
    _i32.Key? key,
    required _i33.LoginBloc loginBloc,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          PhoneNumberVerifiedRoute.name,
          args: PhoneNumberVerifiedRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'PhoneNumberVerifiedRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhoneNumberVerifiedRouteArgs>();
      return _i23.PhoneNumberVerifiedPage(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class PhoneNumberVerifiedRouteArgs {
  const PhoneNumberVerifiedRouteArgs({this.key, required this.loginBloc});

  final _i32.Key? key;

  final _i33.LoginBloc loginBloc;

  @override
  String toString() {
    return 'PhoneNumberVerifiedRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i24.SavedCardPage]
class SavedCardRoute extends _i31.PageRouteInfo<void> {
  const SavedCardRoute({List<_i31.PageRouteInfo>? children})
      : super(SavedCardRoute.name, initialChildren: children);

  static const String name = 'SavedCardRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i24.SavedCardPage();
    },
  );
}

/// generated route for
/// [_i25.ServerErrorPage]
class ServerErrorRoute extends _i31.PageRouteInfo<void> {
  const ServerErrorRoute({List<_i31.PageRouteInfo>? children})
      : super(ServerErrorRoute.name, initialChildren: children);

  static const String name = 'ServerErrorRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i25.ServerErrorPage();
    },
  );
}

/// generated route for
/// [_i26.SignUpPage]
class SignUpRoute extends _i31.PageRouteInfo<void> {
  const SignUpRoute({List<_i31.PageRouteInfo>? children})
      : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i26.SignUpPage();
    },
  );
}

/// generated route for
/// [_i27.SignupWithEmailPasswordPage]
class SignupWithEmailPasswordRoute
    extends _i31.PageRouteInfo<SignupWithEmailPasswordRouteArgs> {
  SignupWithEmailPasswordRoute({
    _i32.Key? key,
    required _i33.LoginBloc loginBloc,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          SignupWithEmailPasswordRoute.name,
          args:
              SignupWithEmailPasswordRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'SignupWithEmailPasswordRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignupWithEmailPasswordRouteArgs>();
      return _i27.SignupWithEmailPasswordPage(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class SignupWithEmailPasswordRouteArgs {
  const SignupWithEmailPasswordRouteArgs({this.key, required this.loginBloc});

  final _i32.Key? key;

  final _i33.LoginBloc loginBloc;

  @override
  String toString() {
    return 'SignupWithEmailPasswordRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i28.UnderMaintenancePage]
class UnderMaintenanceRoute extends _i31.PageRouteInfo<void> {
  const UnderMaintenanceRoute({List<_i31.PageRouteInfo>? children})
      : super(UnderMaintenanceRoute.name, initialChildren: children);

  static const String name = 'UnderMaintenanceRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i28.UnderMaintenancePage();
    },
  );
}

/// generated route for
/// [_i29.VerifyEmailPage]
class VerifyEmailRoute extends _i31.PageRouteInfo<VerifyEmailRouteArgs> {
  VerifyEmailRoute({
    _i32.Key? key,
    required _i33.LoginBloc loginBloc,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          VerifyEmailRoute.name,
          args: VerifyEmailRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyEmailRouteArgs>();
      return _i29.VerifyEmailPage(key: args.key, loginBloc: args.loginBloc);
    },
  );
}

class VerifyEmailRouteArgs {
  const VerifyEmailRouteArgs({this.key, required this.loginBloc});

  final _i32.Key? key;

  final _i33.LoginBloc loginBloc;

  @override
  String toString() {
    return 'VerifyEmailRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i30.WishlistPage]
class WishlistRoute extends _i31.PageRouteInfo<void> {
  const WishlistRoute({List<_i31.PageRouteInfo>? children})
      : super(WishlistRoute.name, initialChildren: children);

  static const String name = 'WishlistRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i30.WishlistPage();
    },
  );
}
