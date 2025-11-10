import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/presentation/login/bloc/login_state.dart';
import 'package:skelter/presentation/signup/bloc/signup_bloc.dart';
import 'package:skelter/presentation/signup/bloc/signup_event.dart';
import 'package:skelter/presentation/signup/bloc/signup_state.dart';
import 'package:skelter/presentation/signup/screens/profile_picture/add_profile_picture_screen.dart';
import 'package:skelter/presentation/signup/screens/profile_picture/widgets/add_skip_picture_button.dart';
import 'package:skelter/presentation/signup/screens/profile_picture/widgets/user_placeholder.dart';
import 'package:skelter/services/firebase_auth_services.dart';

import '../../../../integration_test/mock_firebase_auth.dart';
import '../../../flutter_test_config.dart';
import '../../../test_helpers.dart';

class MockLoginBloc extends MockBloc<LoginEvents, LoginState>
    implements LoginBloc {}

class MockSignupBloc extends MockBloc<SignupEvent, SignupState>
    implements SignupBloc {}

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
  group('Add Profile Picture Screen', () {
    testWidgets('Add Profile Picture Screen renders correctly with no picture',
        (tester) async {
      final loginBloc = MockLoginBloc();
      when(() => loginBloc.state).thenReturn(LoginState.test());

      final signupBloc = MockSignupBloc();
      when(() => signupBloc.state).thenReturn(SignupState.test());

      await tester.runWidgetTest(
        child: AddProfilePictureScreen(loginBloc: loginBloc),
        providers: [
          BlocProvider<SignupBloc>.value(
            value: signupBloc,
          ),
        ],
      );
      expect(find.byType(AddProfilePictureScreen), findsOneWidget);
      expect(find.byType(UserPlaceholder), findsOneWidget);
      expect(find.byType(AddSkipPictureButton), findsOneWidget);
    });
  });

  // Golden tests
  testExecutable(() {
    goldenTest(
      'Add Profile Picture Screen UI Test',
      fileName: 'profile_picture_screen',
      pumpBeforeTest: precacheImages,
      builder: () {
        final loginBlocNoPicture = MockLoginBloc();
        when(() => loginBlocNoPicture.state).thenReturn(LoginState.test());

        final signupBlocNoPicture = MockSignupBloc();
        when(() => signupBlocNoPicture.state).thenReturn(
          SignupState.test(
            isDoneProfilePicEditing: false,
          ),
        );

        final loginBlocWithPicture = MockLoginBloc();
        when(() => loginBlocWithPicture.state).thenReturn(LoginState.test());

        final signupBlocDoneEditing = MockSignupBloc();
        when(() => signupBlocDoneEditing.state).thenReturn(
          SignupState.test(
            isDoneProfilePicEditing: true,
            selectedProfilePicture: File(Assets.test.images.testImage.path),
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'default state',
              child: AddProfilePictureScreen(loginBloc: loginBlocNoPicture),
              providers: [
                BlocProvider<SignupBloc>.value(
                  value: signupBlocNoPicture,
                ),
              ],
            ),
            createTestScenario(
              name: 'done editing state',
              child: AddProfilePictureScreen(loginBloc: loginBlocWithPicture),
              providers: [
                BlocProvider<SignupBloc>.value(
                  value: signupBlocDoneEditing,
                ),
              ],
            ),
          ],
        );
      },
    );
  });
}
