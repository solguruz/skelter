import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/presentation/login/bloc/login_state.dart';
import 'package:skelter/presentation/login/screens/check_your_email/check_your_email_screen.dart';
import 'package:skelter/presentation/login/screens/check_your_email/widgets/continue_login_button.dart';
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
  group('Check Your Email Screen', () {
    testWidgets('Check Your Email Screen renders correctly', (tester) async {
      final loginBloc = MockLoginBloc();
      when(() => loginBloc.state).thenReturn(
        LoginState.test(
          emailPasswordLoginState: EmailPasswordLoginState.test(
            email: 'test@example.com',
          ),
        ),
      );

      await tester.runWidgetTest(
        child: CheckYourEmailScreen(loginBloc: loginBloc),
      );
      expect(find.byType(CheckYourEmailScreen), findsOneWidget);
      expect(find.byType(ContinueLoginButton), findsOneWidget);
    });
  });

  // Golden tests
  testExecutable(() {
    goldenTest(
      'Check Your Email Screen UI Test',
      fileName: 'check_your_email_screen',
      builder: () {
        final loginBlocWithEmail = MockLoginBloc();
        when(() => loginBlocWithEmail.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(
              email: 'test@example.com',
            ),
          ),
        );

        final loginBlocWithLongEmail = MockLoginBloc();
        when(() => loginBlocWithLongEmail.state).thenReturn(
          LoginState.test(
            emailPasswordLoginState: EmailPasswordLoginState.test(
              email: 'long.email.address.for.testing.'
                  'purposes@example-longdomain.com',
            ),
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'default email state',
              child: CheckYourEmailScreen(loginBloc: loginBlocWithEmail),
            ),
            createTestScenario(
              name: 'long email state',
              child: CheckYourEmailScreen(loginBloc: loginBlocWithLongEmail),
            ),
          ],
        );
      },
    );
  });
}
