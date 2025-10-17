import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_event.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_state.dart';
import 'package:skelter/presentation/product_detail/product_detail_screen.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockProductDetailBloc
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ProductDetail Screen', () {
    testWidgets('ProductDetailScreen', (tester) async {
      await tester.runWidgetTest(
        child: const ProductDetailScreen(),
      );
      expect(find.byType(ProductDetailScreen), findsOneWidget);
    });

    testExecutable(() {
      goldenTest(
        'ProductDetailScreen Default UI test',
        fileName: 'product_detail_screen',
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
                name: 'Product Detail Screen',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const ProductDetailBody(),
              ),
            ],
          );
        },
      );
    });

    final imageList = [1, 2];
    final imageLabels = ['second', 'third'];

    for (var i = 0; i < imageList.length; i++) {
      final imageIndex = imageList[i];
      final imageLabel = imageLabels[i];

      testExecutable(() {
        goldenTest(
          'product detail $imageLabel image selected',
          fileName: 'product_detail_${imageLabel}_image_selected',
          pumpBeforeTest: precacheImages,
          builder: () {
            final mockProductDetailBloc = MockProductDetailBloc();

            when(() => mockProductDetailBloc.state).thenReturn(
              ProductDetailState.test(selectedImageIndex: imageIndex),
            );

            return GoldenTestGroup(
              columnWidthBuilder: (_) =>
                  const FixedColumnWidth(pixel5DeviceWidth),
              children: [
                createTestScenario(
                  name: '$imageLabel image selected',
                  addScaffold: true,
                  providers: [
                    BlocProvider<ProductDetailBloc>.value(
                      value: mockProductDetailBloc,
                    ),
                  ],
                  child: const ProductDetailBody(),
                ),
              ],
            );
          },
        );
      });
    }
  });
}
