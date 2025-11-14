import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';
import 'package:skelter/constants/integration_test_keys.dart';
import 'package:skelter/initialize_app.dart';
import 'package:skelter/main.dart';

import '../../demo_product_response.dart';
import '../../mock_firebase_auth.dart';

class MockDio extends Mock implements Dio {}

class MockDioResponse<T> extends Mock implements Response<T> {}

void main() {
  final mockDio = MockDio();
  final mockFirebaseAuthService = MockFirebaseAuthService();
  setUpAll(() {
    final mockResponse = MockDioResponse<List<dynamic>>();

    when(() => mockResponse.statusCode).thenReturn(200);
    when(() => mockResponse.data).thenReturn(productsResponse);
    when(
      () => mockDio.get(
        any(),
        options: any(named: 'options'), // ignore the CacheOptions in test
      ),
    ).thenAnswer((_) async => mockResponse);
    when(() => mockDio.interceptors).thenReturn(Interceptors());
  });

  patrolTest(
    'open app, login with mobile number, verify products are displayed',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
    ($) async {
      final mockFirebaseAuth = MockFirebaseAuth();

      await initializeApp(firebaseAuth: mockFirebaseAuth, dio: mockDio);
      await $.pumpWidgetAndSettle(const MainApp());

      await $(keys.signInPage.mobileNoTextField).enterText('9999988888');
      await $(keys.signInPage.sendOTPButton).tap();
      await $.pumpAndSettle();
      expect(find.text('Invalid mobile number'), findsNothing);

      await $(keys.signInPage.otpTextField).waitUntilVisible();
      await $(keys.signInPage.otpTextField).enterText('123456');

      await $.pumpAndSettle();

      expect(find.text('Premium Wireless Headphones'), findsOneWidget);
      expect(find.text('Smart Fitness Watch'), findsOneWidget);
      expect(find.byKey(keys.homePage.productCardKey), findsExactly(2));
    },
  );

  patrolTest(
    'login with email and password test',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
    ($) async {
      await initializeApp(
        firebaseAuthService: mockFirebaseAuthService,
        dio: mockDio,
      );
      await $.pumpWidgetAndSettle(const MainApp());

      mockFirebaseAuthService.signInWithEmailShouldFail = false;
      mockFirebaseAuthService.signInWithEmailUserEmail = 'test@example.com';
      mockFirebaseAuthService.signInWithEmailUserVerified = true;

      await $(keys.signInPage.continueWithEmailButton).tap();
      await $.pumpAndSettle();

      expect(find.text('Login with email'), findsOneWidget);

      await $(keys.signInPage.emailTextField).enterText('test@example.com');
      await $(keys.signInPage.passwordTextField).enterText('password123');
      await $.pumpAndSettle();

      await $(keys.signInPage.loginWithEmailButton).tap();
      await $.pumpAndSettle();

      expect(find.text('Premium Wireless Headphones'), findsOneWidget);
      expect(find.text('Smart Fitness Watch'), findsOneWidget);
      expect(find.byKey(keys.homePage.productCardKey), findsExactly(2));

      await $(TablerIcons.user).tap();
      await $.pumpAndSettle();
      await $('Sign out').scrollTo().tap();
      await $.pumpAndSettle();

      expect(find.byKey(keys.signInPage.mobileNoTextField), findsOneWidget);

      mockFirebaseAuthService.signInWithEmailShouldFail = false;
      mockFirebaseAuthService.signInWithEmailUserEmail =
          'unverified@example.com';
      mockFirebaseAuthService.signInWithEmailUserVerified = false;

      await $(keys.signInPage.continueWithEmailButton).tap();
      await $.pumpAndSettle();

      await $(keys.signInPage.emailTextField)
          .enterText('unverified@example.com');
      await $(keys.signInPage.passwordTextField).enterText('password123');
      await $.pumpAndSettle();

      await $(keys.signInPage.loginWithEmailButton).tap();
      await $.pumpAndSettle();

      expect(find.text('Verify your email'), findsOneWidget);

      final NavigatorState navigator = $.tester.state(find.byType(Navigator));
      navigator.pop();
      navigator.pop();
      await $.pump();

      await $(keys.signInPage.continueWithEmailButton).tap();
      await $.pumpAndSettle();

      mockFirebaseAuthService.signInWithEmailShouldFail = true;
      mockFirebaseAuthService.signInWithEmailError =
          'Invalid email or password';

      await $(keys.signInPage.emailTextField).enterText('invalid@example.com');
      await $(keys.signInPage.passwordTextField).enterText('wrongpassword');
      await $.pumpAndSettle();

      await $(keys.signInPage.loginWithEmailButton).tap();
      await $.pumpAndSettle();

      expect(find.text('Invalid email or password'), findsOneWidget);
    },
  );

  patrolTest(
    'sign in with google test',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
    ($) async {
      await initializeApp(
        firebaseAuthService: mockFirebaseAuthService,
        dio: mockDio,
      );
      await $.pumpWidgetAndSettle(const MainApp());

      mockFirebaseAuthService.loginWithGoogleShouldFail = false;

      await $(keys.signInPage.continueWithGoogleButton).tap();
      await $.pumpAndSettle();

      expect(find.text('Premium Wireless Headphones'), findsOneWidget);
      expect(find.text('Smart Fitness Watch'), findsOneWidget);
      expect(find.byKey(keys.homePage.productCardKey), findsExactly(2));

      await $(TablerIcons.user).tap();
      await $.pumpAndSettle();
      await $('Sign out').scrollTo().tap();
      await $.pumpAndSettle();

      mockFirebaseAuthService.loginWithGoogleShouldFail = true;
      mockFirebaseAuthService.loginWithGoogleError = 'Google sign-in failed';

      await $(keys.signInPage.continueWithGoogleButton).tap();
      await $.pumpAndSettle();

      expect(find.text('Google sign-in failed'), findsOneWidget);
    },
  );
}
