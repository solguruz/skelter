import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/core/services/app_tour_service.dart';
import 'package:skelter/i18n/app_localizations.dart';

void main() {
  testWidgets('shows the tour steps without Material errors', (tester) async {
    final searchBarKey = GlobalKey();
    final bottomNavKey = GlobalKey();

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Builder(
            builder: (context) => Column(
              children: [
                SizedBox(key: searchBarKey, height: 50, width: 200),
                const Spacer(),
                TextButton(
                  onPressed: () => AppTourService.showTour(
                    context: context,
                    searchBarKey: searchBarKey,
                    bottomNavKey: bottomNavKey,
                  ),
                  child: const Text('start'),
                ),
                SizedBox(key: bottomNavKey, height: 50, width: 200),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('start'));
    // The tour's focus light pulses forever, so pump frames for a fixed time.
    for (var i = 0; i < 20; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }

    expect(tester.takeException(), isNull);
    expect(find.text('Next'), findsOneWidget);

    AppTourService.dismissTour();
    await tester.pump(const Duration(seconds: 1));
  });
}
