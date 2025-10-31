import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_event.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_state.dart';
import 'package:skelter/presentation/product_detail/widgets/price.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockProductDetailBloc
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Price', () {
    testWidgets('display price correctly', (tester) async {
      await tester.runWidgetTest(
        child: const Price(price: 99.99),
      );
      expect(find.textContaining('99.99'), findsOneWidget);
    });

    testExecutable(() {
      goldenTest(
        'Price variants',
        fileName: 'price_variations',
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
                name: 'Standard price',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const Price(price: 99.99),
              ),
              createTestScenario(
                name: 'High price',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const Price(price: 1999.99),
              ),
              createTestScenario(
                name: 'Low price',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const Price(price: 0.99),
              ),
              createTestScenario(
                name: 'Very high price',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const Price(price: 9999.99),
              ),
            ],
          );
        },
      );
    });
  });
}
