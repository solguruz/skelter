import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/presentation/wishlist/wishlist_screen.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('WishlistScreen Widget Test', () {
    testWidgets('renders correctly', (tester) async {
      await tester.runWidgetTest(child: const WishlistScreen());

      expect(find.byType(WishlistScreen), findsOneWidget);
    });
  });

  testExecutable(() {
    group('Wishlist Screen UI Golden Tests', () {
      goldenTest(
        'WishlistScreen',
        fileName: 'wishlist_screen',
        pumpBeforeTest: precacheImages,
        builder: () {
          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'WishlistScreen Light Theme',
                child: const WishlistScreen(),
              ),
              createTestScenario(
                name: 'WishlistScreen Dark Theme',
                child: const WishlistScreen(),
                theme: AppThemeEnum.DarkTheme,
              ),
            ],
          );
        },
      );
    });
  });
}
