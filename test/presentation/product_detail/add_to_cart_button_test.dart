import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skelter/presentation/product_detail/widgets/add_to_cart_button.dart';
import '../../test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AddToCartButton', () {
    testWidgets('AddToCartButton', (tester) async {
      await tester.runWidgetTest(
        child: const Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                AddToCartButton(),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(AddToCartButton), findsOneWidget);
    });
  });
}
