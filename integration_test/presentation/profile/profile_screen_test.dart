import 'package:dio/dio.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';
import 'package:skelter/main.dart';

class MockDio extends Mock implements Dio {}

class MockDioResponse<T> extends Mock implements Response<T> {}

void main() {
  patrolTest(
    'profile screen end to end test',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
    ($) async {
      await $.pumpWidgetAndSettle(const MainApp());
      await $.pumpAndSettle();
      await $(TablerIcons.user).tap();
      await $.pumpAndSettle();
      await $('Sign out').scrollTo().tap();
    },
  );
}
