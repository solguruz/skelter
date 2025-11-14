import 'package:flutter/foundation.dart';

class LoginPageKeys {
  final mobileNoTextField = const Key('mobileNoTextField');
  final otpTextField = const Key('otpTextField');
  final sendOTPButton = const Key('sendOTPButton');
  final emailTextField = const Key('emailTextField');
  final passwordTextField = const Key('passwordTextField');
  final loginWithEmailButton = const Key('loginWithEmailButton');
  final continueWithEmailButton = const Key('continueWithEmailButton');
  final continueWithGoogleButton = const Key('continueWithGoogleButton');
}

class HomePageKeys {
  final productCardKey = const Key('productCardKey');
}

class Keys {
  final signInPage = LoginPageKeys();
  final homePage = HomePageKeys();
}

final keys = Keys();
