import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/presentation/login/bloc/login_state.dart';
import 'package:skelter/presentation/signup/screens/phone_num_verified_page/phone_number_verified_screen.dart';
import 'package:skelter/presentation/signup/screens/phone_num_verified_page/widgets/next_button.dart';
import 'package:skelter/services/firebase_auth_services.dart';

import '../../../../integration_test/mock_firebase_auth.dart';
import '../../../flutter_test_config.dart';
import '../../../test_helpers.dart';

class MockLoginBloc extends MockBloc<LoginEvents, LoginState>
    implements LoginBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    final mockAuthService = MockFirebaseAuthService();
    if (sl.isRegistered<FirebaseAuthService>()) {
      sl.unregister<FirebaseAuthService>();
    }
    sl.registerLazySingleton<FirebaseAuthService>(() => mockAuthService);
  });

  // Widget tests
  group('Phone Number Verified Screen', () {
    testWidgets('Phone Number Verified Screen renders correctly',
        (tester) async {
      final loginBloc = MockLoginBloc();
      when(() => loginBloc.state).thenReturn(LoginState.test());

      await tester.runWidgetTest(
        child: PhoneNumberVerifiedScreen(loginBloc: loginBloc),
      );
      expect(find.byType(PhoneNumberVerifiedScreen), findsOneWidget);
      expect(find.byType(NextButton), findsOneWidget);
    });
  });

  // Golden tests
  testExecutable(() {
    goldenTest(
      'Phone Number Verified Screen UI Test',
      fileName: 'phone_num_verified_screen',
      pumpBeforeTest: precacheImages,
      builder: () {
        final loginBloc = MockLoginBloc();
        when(() => loginBloc.state).thenReturn(
          LoginState.test(
            phoneNumberLoginState: PhoneNumberLoginState.test(
              phoneNumber: '9876543210',
              countryCode: '+91',
            ),
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'default state',
              child: PhoneNumberVerifiedScreen(loginBloc: loginBloc),
            ),
          ],
        );
      },
    );
  });
}
