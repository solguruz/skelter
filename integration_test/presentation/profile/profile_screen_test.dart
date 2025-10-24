import 'package:dio/dio.dart';
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

  setUpAll(() {
    final mockResponse = MockDioResponse<List<dynamic>>();

    when(() => mockResponse.statusCode).thenReturn(200);
    when(() => mockResponse.data).thenReturn(productsResponse);
    when(
      () => mockDio.get(
        any(),
        options: any(named: 'options', that: isA<Options>()),
      ),
    ).thenAnswer((_) async => mockResponse);
    when(() => mockDio.interceptors).thenReturn(Interceptors());
  });

  patrolTest(
    'profile screen end to end test',
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

      await $(TablerIcons.user).tap();
      await $.pumpAndSettle();

      await $('Sign out').scrollTo().tap();
    },
  );
}
