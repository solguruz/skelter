import 'package:flutter_test/flutter_test.dart';

import 'presentation/login/login_screen_test.dart' as login;
import 'presentation/profile/profile_screen_test.dart' as profile;

void main() {
  group('Login Tests', login.main);
  group('Profile Tests', profile.main);
}
