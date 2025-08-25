import 'package:flutter/foundation.dart';

class LoginPageKeys {
  final mobileNoTextField = const Key('mobileNoTextField');
  final otpTextField = const Key('otpTextField');
  final sendOTPButton = const Key('sendOTPButton');
}

class HomePageKeys {
  final prodcutCardKey = const Key('productCardKey');
}

class Keys {
  final signInPage = LoginPageKeys();
  final homePage = HomePageKeys();
}

final keys = Keys();
