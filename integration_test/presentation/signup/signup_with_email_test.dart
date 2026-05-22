import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/constants/integration_test_keys.dart';
import 'package:skelter/initialize_app.dart';
import 'package:skelter/main.dart';

import '../../demo_product_response.dart';
import '../../mock_firebase_auth.dart';

class MockDio extends Mock implements Dio {}

class MockDioResponse<T> extends Mock implements Response<T> {}

void main() {
  final mockDio = MockDio();
  final mockFirebaseAuth = MockFirebaseAuth();

  setUpAll(() {
    final mockResponse = MockDioResponse<List<dynamic>>();

    when(() => mockResponse.statusCode).thenReturn(200);
    when(() => mockResponse.data).thenReturn(productsResponse);
    when(
      () => mockDio.get(any(), options: any(named: 'options')),
    ).thenAnswer((_) async => mockResponse);
    when(() => mockDio.interceptors).thenReturn(Interceptors());
  });

  patrolTest(
    'sign up with email test',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
    ($) async {
      await initializeApp(firebaseAuth: mockFirebaseAuth, dio: mockDio);
      await $.pumpWidgetAndSettle(const MainApp());

      // SCENARIO 1: Successful signup with email verification
      final newUser = MockUser(email: 'newuser@example.com');

      when(
        () => mockFirebaseAuth.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async {
        mockFirebaseAuth.setMockUser(newUser);
        return MockUserCredential(newUser);
      });

      await $('Sign up').tap();
      await $.pumpAndSettle();

      await $(keys.signupPage.signupWithEmailButton).tap();
      await $.pumpAndSettle();

      expect(find.text('Sign up with Email'), findsOneWidget);

      await $(
        keys.signupPage.signupEmailTextField,
      ).enterText('newuser@example.com');
      await Future.delayed(const Duration(milliseconds: 500));
      await $.pump();
      await $(keys.signupPage.signupEmailNextButton).tap();
      await $.pump();

      expect(find.text('Create your password'), findsOneWidget);

      await $(
        keys.signupPage.signupPasswordTextField,
      ).enterText('StrongPass123!');
      await $.pump();

      await $(
        keys.signupPage.signupConfirmPasswordTextField,
      ).enterText('StrongPass123!');

      await Future.delayed(const Duration(milliseconds: 600));
      await $.pump();

      await $(keys.signupPage.signupPasswordNextButton).tap();
      await $.pumpAndSettle();

      expect(find.text('Verify your email'), findsOneWidget);

      newUser.setEmailVerified(isEmailVerified: true);
      await $.pump(const Duration(seconds: 6));
      await $.pumpAndSettle();

      expect(find.text('Premium Wireless Headphones'), findsOneWidget);
      expect(find.text('Smart Fitness Watch'), findsOneWidget);
      expect(find.byKey(keys.homePage.productCardKey), findsExactly(2));

      await $(TablerIcons.user).tap();
      await $.pumpAndSettle();
      await $('Sign out').scrollTo().tap();
      await $.pumpAndSettle();

      // SCENARIO 2: Email already in use error
      when(
        () => mockFirebaseAuth.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: kFirebaseAuthSessionEmailAlreadyInUse,
          message: 'Email already in use, please login to continue.',
        ),
      );

      await $('Sign up').tap();
      await $.pumpAndSettle();

      await $(keys.signupPage.signupWithEmailButton).tap();
      await $.pumpAndSettle();

      await $(
        keys.signupPage.signupEmailTextField,
      ).enterText('existing@example.com');

      await $.pump(const Duration(milliseconds: 600));

      await $(keys.signupPage.signupEmailNextButton).tap();
      await $.pumpAndSettle(timeout: const Duration(seconds: 2));

      await $(
        keys.signupPage.signupPasswordTextField,
      ).enterText('StrongPass123!');
      await $.pump();

      await $(
        keys.signupPage.signupConfirmPasswordTextField,
      ).enterText('StrongPass123!');
      await Future.delayed(const Duration(milliseconds: 600));
      await $.pump();

      // Ensure UI is settled and button is enabled
      await $.pump(const Duration(milliseconds: 600));

      await $(
        keys.signupPage.signupPasswordNextButton,
      ).tap(settlePolicy: SettlePolicy.noSettle);

      // Wait for error to be processed and displayed
      await $(
        find.text('Email already in use, please login to continue.'),
      ).waitUntilVisible();
      expect(
        find.text('Email already in use, please login to continue.'),
        findsOneWidget,
      );

      await Future.delayed(const Duration(milliseconds: 600));
      await $.pump();

      final NavigatorState navigator = $.tester.state(find.byType(Navigator));
      navigator.pop();
      await $.pump();

      // SCENARIO 3: Invalid email validation
      await $(keys.signupPage.signupEmailTextField).enterText('invalidemail');
      await Future.delayed(const Duration(milliseconds: 500));

      await $.pump(const Duration(milliseconds: 500));
      await $(keys.signupPage.signupEmailNextButton).tap();
      await $.pump(const Duration(milliseconds: 500));
      expect(find.text('Please enter a valid email address'), findsOneWidget);
    },
  );
}
