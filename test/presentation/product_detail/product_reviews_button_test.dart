import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skelter/presentation/product_detail/widgets/product_reviews_button.dart';
import '../../test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ProductReviewsButton', () {
    testWidgets('ProductReviewsButton', (tester) async {
      await tester.runWidgetTest(
        child: const Scaffold(
          body: ProductReviewsButton(),
        ),
      );
      expect(find.byType(ProductReviewsButton), findsOneWidget);
    });
  });
}
