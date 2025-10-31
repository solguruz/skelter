import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skelter/presentation/product_detail/widgets/mark_favorite_button.dart';
import '../../test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MarkFavoriteButton', () {
    testWidgets('MarkFavoriteButton', (tester) async {
      await tester.runWidgetTest(
        child: const Scaffold(
          body: Row(
            children: [
              MarkFavoriteButton(),
            ],
          ),
        ),
      );
      expect(find.byType(MarkFavoriteButton), findsOneWidget);
    });
  });
}
