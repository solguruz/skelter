import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_event.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_state.dart';
import 'package:skelter/presentation/product_detail/widgets/title_and_rating.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockProductDetailBloc
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TitleAndRating', () {
    testWidgets('renders title and rating correctly', (tester) async {
      await tester.runWidgetTest(
        child: const TitleAndRating(
          title: 'Premium Wireless Headphones',
          rating: 4.8,
        ),
      );
      expect(find.text('Premium Wireless Headphones'), findsOneWidget);
      expect(find.text('4.8'), findsOneWidget);
    });

    testExecutable(() {
      goldenTest(
        'TitleAndRating - different text variations',
        fileName: 'title_and_rating_variations',
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
                name: 'Standard title and rating',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const TitleAndRating(
                  title: 'Premium Wireless Headphones',
                  rating: 4.8,
                ),
              ),
              createTestScenario(
                name: 'Long title with high rating',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const TitleAndRating(
                  title:
                      'Ultra HD 4K Smart LED TV with Built-in Streaming Apps '
                      'and Voice Control',
                  rating: 4.9,
                ),
              ),
              createTestScenario(
                name: 'Short title with low rating',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const TitleAndRating(
                  title: 'Pen',
                  rating: 2.1,
                ),
              ),
              createTestScenario(
                name: 'Empty title fallback text',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const TitleAndRating(
                  title: 'N/A',
                  rating: 4.2,
                ),
              ),
              createTestScenario(
                name: 'Title with very long single word',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const TitleAndRating(
                  title: 'Supercalifragilisticexpialidocious',
                  rating: 3.7,
                ),
              ),
            ],
          );
        },
      );
    });
  });
}
