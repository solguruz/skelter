import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

void main() {
  group('BuildContext Extensions', () {
    late Widget testWidget;

    setUp(() {
      testWidget = MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () => context.showSnackBar('Test message'),
                    child: const Text('Show Snackbar'),
                  ),
                  ElevatedButton(
                    onPressed: () => context.hideSnackBar(),
                    child: const Text('Hide Snackbar'),
                  ),
                ],
              );
            },
          ),
        ),
      );
    });

    testWidgets('showSnackBar displays with default parameters',
        (tester) async {
      await tester.pumpWidget(testWidget);

      await tester.tap(find.text('Show Snackbar'));
      await tester.pump();

      expect(find.text('Test message'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);

      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBar.backgroundColor, AppColors.snackBarBGColor);
      expect(snackBar.duration, const Duration(milliseconds: 3000));
    });

    testWidgets('showSnackBar with error styling', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => context.showSnackBar(
                  'Error message',
                  isDisplayingError: true,
                ),
                child: const Text('Show Error'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Error'));
      await tester.pump();

      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBar.backgroundColor, AppColors.snackBarErrorColor);
    });

    testWidgets('showSnackBar with custom duration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => context.showSnackBar(
                  'Custom duration',
                  millis: 5000,
                ),
                child: const Text('Show Snackbar'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Snackbar'));
      await tester.pump();

      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBar.duration, const Duration(milliseconds: 5000));
    });

    testWidgets('showSnackBar with leading widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => context.showSnackBar(
                  'Leading widget',
                  leading: const Icon(Icons.info),
                ),
                child: const Text('Show Snackbar'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Snackbar'));
      await tester.pump();

      expect(find.byType(Icon), findsOneWidget);
      expect(find.text('Leading widget'), findsOneWidget);
    });

    testWidgets('showSnackBar with trailing widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => context.showSnackBar(
                  'Trailing widget',
                  trailing: const Icon(Icons.check),
                ),
                child: const Text('Show Snackbar'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Snackbar'));
      await tester.pump();

      expect(find.byType(Icon), findsOneWidget);
      expect(find.text('Trailing widget'), findsOneWidget);
    });

    testWidgets('showSnackBar with trailing loader', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => context.showSnackBar(
                  'Loading',
                  showTrailingLoader: true,
                ),
                child: const Text('Show Snackbar'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Snackbar'));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading'), findsOneWidget);
    });

    testWidgets('showSnackBar with SnackBarAction', (tester) async {
      bool actionTapped = false;
      final testKey = UniqueKey();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                key: testKey,
                onPressed: () => context.showSnackBar(
                  'Action',
                  action: SnackBarAction(
                    key: const ValueKey('snackbar-action'),
                    label: 'Tap',
                    onPressed: () {
                      actionTapped = true;
                    },
                  ),
                ),
                child: const Text('Show Snackbar'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byKey(testKey));

      await tester.pumpAndSettle();

      final snackBarFinder = find.byType(SnackBar);
      expect(snackBarFinder, findsOneWidget);

      final actionFinder = find.byKey(const ValueKey('snackbar-action'));
      expect(actionFinder, findsOneWidget);

      await tester.tap(actionFinder);

      await tester.pumpAndSettle();

      expect(actionTapped, isTrue);
    });

    testWidgets('hideSnackBar removes the current snackbar', (tester) async {
      await tester.pumpWidget(testWidget);

      await tester.tap(find.text('Show Snackbar'));
      await tester.pump();
      expect(find.byType(SnackBar), findsOneWidget);

      await tester.tap(find.text('Hide Snackbar'));
      await tester.pump();
      expect(find.byType(SnackBar), findsNothing);
    });
  });
}
