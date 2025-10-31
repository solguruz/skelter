import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_event.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_state.dart';
import 'package:skelter/presentation/product_detail/widgets/description.dart'
    as description;

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockProductDetailBloc
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Description', () {
    testWidgets('Description', (tester) async {
      await tester.runWidgetTest(
        child: const description.Description(
          description:
              'High-quality wireless headphones with noise cancellation',
        ),
      );
      expect(
        find.text('High-quality wireless headphones with noise cancellation'),
        findsOneWidget,
      );
    });

    testExecutable(() {
      goldenTest(
        'Description different text variations',
        fileName: 'description_variations',
        pumpBeforeTest: precacheImages,
        builder: () {
          final productDetailBloc = MockProductDetailBloc();
          when(() => productDetailBloc.state).thenReturn(
            const ProductDetailState.test(),
          );

          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'Standard description',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const description.Description(
                  description:
                      'Experience crystal clear sound with our premium '
                      'wireless headphones. '
                      'Featuring active noise cancellation, 30-hour '
                      'battery life and comfortable over-ear design.',
                ),
              ),
              createTestScenario(
                name: 'Very short description',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const description.Description(
                  description: 'High-quality product.',
                ),
              ),
              createTestScenario(
                name: 'Long description with line breaks',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const description.Description(
                  description: '''
This is a very detailed product description that spans multiple lines.

over-ear design.

This product is made with premium materials and comes with a 1-year warranty. The earcups are designed for all-day comfort with memory foam padding. The adjustable headband ensures a perfect fit for any head size.

Features:
• Active Noise Cancellation
• 30-hour battery life
• Bluetooth 5.0
• Built-in microphone
• Touch controls''',
                ),
              ),
              createTestScenario(
                name: 'Very long single paragraph',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const description.Description(
                  description:
                      '''This is an extremely long product description that goes on and on without any line breaks. It should properly wrap and handle the text overflow gracefully. The description contains important details about the product features, specifications, and benefits. It should be displayed in a readable format with proper line height and padding. The text should be clear and easy to read on all screen sizes. This is just more text to make the description even longer and test how it handles large amounts of text in a single paragraph.''',
                ),
              ),
            ],
          );
        },
      );
    });
  });
}
