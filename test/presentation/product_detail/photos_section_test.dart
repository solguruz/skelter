import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_event.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_state.dart';
import 'package:skelter/presentation/product_detail/widgets/photos_section.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';
import 'data/product_detail_sample_data.dart';

class MockProductDetailBloc
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PhotosSection', () {
    testWidgets('PhotosSection', (tester) async {
      final productDetailBloc = MockProductDetailBloc();
      when(() => productDetailBloc.state).thenReturn(
        const ProductDetailState.test(),
      );

      await tester.runWidgetTest(
        providers: [
          BlocProvider<ProductDetailBloc>.value(value: productDetailBloc),
        ],
        child: PhotosSection(
          productDetail: generateSampleProductDetail(),
        ),
      );
      expect(find.byType(PhotosSection), findsOneWidget);
    });

    testExecutable(() {
      goldenTest(
        'Multiple product images',
        fileName: 'multiple_product_images',
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
                name: 'Multiple product images',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: PhotosSection(
                  productDetail: generateSampleProductDetail(),
                ),
              ),
            ],
          );
        },
      );
    });
  });
}
