import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skelter/presentation/product_detail/widgets/reviews_button.dart';
import '../../test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ReviewsButton', () {
    testWidgets('ReviewsButton', (tester) async {
      await tester.runWidgetTest(
        child: const Scaffold(
          body: ReviewsButton(),
        ),
      );
      expect(find.byType(ReviewsButton), findsOneWidget);
    });
  });
}
