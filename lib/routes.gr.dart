// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:flutter_skeleton/presentation/chat/chat_conversations.dart'
    as _i2;
import 'package:flutter_skeleton/presentation/chat/chat_page.dart' as _i3;
import 'package:flutter_skeleton/presentation/chat/model/chat_model.dart'
    as _i22;
import 'package:flutter_skeleton/presentation/contact_us/contact_us_page.dart'
    as _i5;
import 'package:flutter_skeleton/presentation/contact_us/contact_us_submitted_page.dart'
    as _i6;
import 'package:flutter_skeleton/presentation/home/home_page.dart' as _i9;
import 'package:flutter_skeleton/presentation/initial/initial_page.dart'
    as _i10;
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart'
    as _i21;
import 'package:flutter_skeleton/presentation/login_signup/login/login_page.dart'
    as _i11;
import 'package:flutter_skeleton/presentation/login_signup/login/pages/check_your_email/check_your_email_page.dart'
    as _i4;
import 'package:flutter_skeleton/presentation/login_signup/login/pages/forgot_password/forgot_password_page.dart'
    as _i8;
import 'package:flutter_skeleton/presentation/login_signup/login/pages/login_with_email/login_with_email_pass_page.dart'
    as _i12;
import 'package:flutter_skeleton/presentation/login_signup/login/pages/login_with_phone_number/login_with_phone_num_page.dart'
    as _i13;
import 'package:flutter_skeleton/presentation/login_signup/login/pages/phone_num_otp_page/phone_num_otp_page.dart'
    as _i14;
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/phone_num_verified_page/phone_num_verified_page.dart'
    as _i15;
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/profile_picture/add_profile_picture_page.dart'
    as _i1;
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/signup_with_email/create_your_password_page.dart'
    as _i7;
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/signup_with_email/signup_with_email_pass_page.dart'
    as _i17;
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/verify_email_page/verify_email_page.dart'
    as _i18;
import 'package:flutter_skeleton/presentation/login_signup/signup/signup_page.dart'
    as _i16;

/// generated route for
/// [_i1.AddProfilePicturePage]
class AddProfilePictureRoute
    extends _i19.PageRouteInfo<AddProfilePictureRouteArgs> {
  AddProfilePictureRoute({
    _i20.Key? key,
    required _i21.LoginBloc loginBloc,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          AddProfilePictureRoute.name,
          args: AddProfilePictureRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'AddProfilePictureRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddProfilePictureRouteArgs>();
      return _i1.AddProfilePicturePage(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class AddProfilePictureRouteArgs {
  const AddProfilePictureRouteArgs({this.key, required this.loginBloc});

  final _i20.Key? key;

  final _i21.LoginBloc loginBloc;

  @override
  String toString() {
    return 'AddProfilePictureRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i2.ChatConversationPage]
class ChatConversationRoute
    extends _i19.PageRouteInfo<ChatConversationRouteArgs> {
  ChatConversationRoute({
    _i20.Key? key,
    required _i22.ChatModel chatUser,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          ChatConversationRoute.name,
          args: ChatConversationRouteArgs(key: key, chatUser: chatUser),
          initialChildren: children,
        );

  static const String name = 'ChatConversationRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatConversationRouteArgs>();
      return _i2.ChatConversationPage(key: args.key, chatUser: args.chatUser);
    },
  );
}

class ChatConversationRouteArgs {
  const ChatConversationRouteArgs({this.key, required this.chatUser});

  final _i20.Key? key;

  final _i22.ChatModel chatUser;

  @override
  String toString() {
    return 'ChatConversationRouteArgs{key: $key, chatUser: $chatUser}';
  }
}

/// generated route for
/// [_i3.ChatPage]
class ChatRoute extends _i19.PageRouteInfo<void> {
  const ChatRoute({List<_i19.PageRouteInfo>? children})
      : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChatPage();
    },
  );
}

/// generated route for
/// [_i4.CheckYourEmailPage]
class CheckYourEmailRoute extends _i19.PageRouteInfo<CheckYourEmailRouteArgs> {
  CheckYourEmailRoute({
    _i20.Key? key,
    required _i21.LoginBloc loginBloc,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          CheckYourEmailRoute.name,
          args: CheckYourEmailRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'CheckYourEmailRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CheckYourEmailRouteArgs>();
      return _i4.CheckYourEmailPage(key: args.key, loginBloc: args.loginBloc);
    },
  );
}

class CheckYourEmailRouteArgs {
  const CheckYourEmailRouteArgs({this.key, required this.loginBloc});

  final _i20.Key? key;

  final _i21.LoginBloc loginBloc;

  @override
  String toString() {
    return 'CheckYourEmailRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i5.ContactUsPage]
class ContactUsRoute extends _i19.PageRouteInfo<void> {
  const ContactUsRoute({List<_i19.PageRouteInfo>? children})
      : super(ContactUsRoute.name, initialChildren: children);

  static const String name = 'ContactUsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i5.ContactUsPage();
    },
  );
}

/// generated route for
/// [_i6.ContactUsSubmittedPage]
class ContactUsSubmittedRoute extends _i19.PageRouteInfo<void> {
  const ContactUsSubmittedRoute({List<_i19.PageRouteInfo>? children})
      : super(ContactUsSubmittedRoute.name, initialChildren: children);

  static const String name = 'ContactUsSubmittedRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i6.ContactUsSubmittedPage();
    },
  );
}

/// generated route for
/// [_i7.CreateYourPasswordPage]
class CreateYourPasswordRoute
    extends _i19.PageRouteInfo<CreateYourPasswordRouteArgs> {
  CreateYourPasswordRoute({
    _i20.Key? key,
    required _i21.LoginBloc loginBloc,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          CreateYourPasswordRoute.name,
          args: CreateYourPasswordRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'CreateYourPasswordRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateYourPasswordRouteArgs>();
      return _i7.CreateYourPasswordPage(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class CreateYourPasswordRouteArgs {
  const CreateYourPasswordRouteArgs({this.key, required this.loginBloc});

  final _i20.Key? key;

  final _i21.LoginBloc loginBloc;

  @override
  String toString() {
    return 'CreateYourPasswordRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i8.ForgotPasswordV2Page]
class ForgotPasswordV2Route
    extends _i19.PageRouteInfo<ForgotPasswordV2RouteArgs> {
  ForgotPasswordV2Route({
    _i20.Key? key,
    required _i21.LoginBloc loginBloc,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordV2Route.name,
          args: ForgotPasswordV2RouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordV2Route';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordV2RouteArgs>();
      return _i8.ForgotPasswordV2Page(key: args.key, loginBloc: args.loginBloc);
    },
  );
}

class ForgotPasswordV2RouteArgs {
  const ForgotPasswordV2RouteArgs({this.key, required this.loginBloc});

  final _i20.Key? key;

  final _i21.LoginBloc loginBloc;

  @override
  String toString() {
    return 'ForgotPasswordV2RouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i9.HomePage]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute({List<_i19.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i9.HomePage();
    },
  );
}

/// generated route for
/// [_i10.InitialPage]
class InitialRoute extends _i19.PageRouteInfo<void> {
  const InitialRoute({List<_i19.PageRouteInfo>? children})
      : super(InitialRoute.name, initialChildren: children);

  static const String name = 'InitialRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i10.InitialPage();
    },
  );
}

/// generated route for
/// [_i11.LoginPage]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute({List<_i19.PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i11.LoginPage();
    },
  );
}

/// generated route for
/// [_i12.LoginWithEmailPasswordPage]
class LoginWithEmailPasswordRoute
    extends _i19.PageRouteInfo<LoginWithEmailPasswordRouteArgs> {
  LoginWithEmailPasswordRoute({
    _i20.Key? key,
    required _i21.LoginBloc loginBloc,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          LoginWithEmailPasswordRoute.name,
          args: LoginWithEmailPasswordRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'LoginWithEmailPasswordRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginWithEmailPasswordRouteArgs>();
      return _i12.LoginWithEmailPasswordPage(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class LoginWithEmailPasswordRouteArgs {
  const LoginWithEmailPasswordRouteArgs({this.key, required this.loginBloc});

  final _i20.Key? key;

  final _i21.LoginBloc loginBloc;

  @override
  String toString() {
    return 'LoginWithEmailPasswordRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i13.LoginWithPhoneNumberPage]
class LoginWithPhoneNumberRoute extends _i19.PageRouteInfo<void> {
  const LoginWithPhoneNumberRoute({List<_i19.PageRouteInfo>? children})
      : super(LoginWithPhoneNumberRoute.name, initialChildren: children);

  static const String name = 'LoginWithPhoneNumberRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i13.LoginWithPhoneNumberPage();
    },
  );
}

/// generated route for
/// [_i14.PhoneNumberOTPPage]
class PhoneNumberOTPRoute extends _i19.PageRouteInfo<PhoneNumberOTPRouteArgs> {
  PhoneNumberOTPRoute({
    _i20.Key? key,
    required _i21.LoginBloc loginBloc,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          PhoneNumberOTPRoute.name,
          args: PhoneNumberOTPRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'PhoneNumberOTPRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhoneNumberOTPRouteArgs>();
      return _i14.PhoneNumberOTPPage(key: args.key, loginBloc: args.loginBloc);
    },
  );
}

class PhoneNumberOTPRouteArgs {
  const PhoneNumberOTPRouteArgs({this.key, required this.loginBloc});

  final _i20.Key? key;

  final _i21.LoginBloc loginBloc;

  @override
  String toString() {
    return 'PhoneNumberOTPRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i15.PhoneNumberVerifiedPage]
class PhoneNumberVerifiedRoute
    extends _i19.PageRouteInfo<PhoneNumberVerifiedRouteArgs> {
  PhoneNumberVerifiedRoute({
    _i20.Key? key,
    required _i21.LoginBloc loginBloc,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          PhoneNumberVerifiedRoute.name,
          args: PhoneNumberVerifiedRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'PhoneNumberVerifiedRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhoneNumberVerifiedRouteArgs>();
      return _i15.PhoneNumberVerifiedPage(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class PhoneNumberVerifiedRouteArgs {
  const PhoneNumberVerifiedRouteArgs({this.key, required this.loginBloc});

  final _i20.Key? key;

  final _i21.LoginBloc loginBloc;

  @override
  String toString() {
    return 'PhoneNumberVerifiedRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i16.SignUpPage]
class SignUpRoute extends _i19.PageRouteInfo<void> {
  const SignUpRoute({List<_i19.PageRouteInfo>? children})
      : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i16.SignUpPage();
    },
  );
}

/// generated route for
/// [_i17.SignupWithEmailPasswordPage]
class SignupWithEmailPasswordRoute
    extends _i19.PageRouteInfo<SignupWithEmailPasswordRouteArgs> {
  SignupWithEmailPasswordRoute({
    _i20.Key? key,
    required _i21.LoginBloc loginBloc,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          SignupWithEmailPasswordRoute.name,
          args:
              SignupWithEmailPasswordRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'SignupWithEmailPasswordRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignupWithEmailPasswordRouteArgs>();
      return _i17.SignupWithEmailPasswordPage(
        key: args.key,
        loginBloc: args.loginBloc,
      );
    },
  );
}

class SignupWithEmailPasswordRouteArgs {
  const SignupWithEmailPasswordRouteArgs({this.key, required this.loginBloc});

  final _i20.Key? key;

  final _i21.LoginBloc loginBloc;

  @override
  String toString() {
    return 'SignupWithEmailPasswordRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}

/// generated route for
/// [_i18.VerifyEmailPage]
class VerifyEmailRoute extends _i19.PageRouteInfo<VerifyEmailRouteArgs> {
  VerifyEmailRoute({
    _i20.Key? key,
    required _i21.LoginBloc loginBloc,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          VerifyEmailRoute.name,
          args: VerifyEmailRouteArgs(key: key, loginBloc: loginBloc),
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyEmailRouteArgs>();
      return _i18.VerifyEmailPage(key: args.key, loginBloc: args.loginBloc);
    },
  );
}

class VerifyEmailRouteArgs {
  const VerifyEmailRouteArgs({this.key, required this.loginBloc});

  final _i20.Key? key;

  final _i21.LoginBloc loginBloc;

  @override
  String toString() {
    return 'VerifyEmailRouteArgs{key: $key, loginBloc: $loginBloc}';
  }
}
