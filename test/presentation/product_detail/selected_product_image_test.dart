import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_event.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_state.dart';
import 'package:skelter/presentation/product_detail/widgets/selected_product_image.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';
import 'data/product_detail_sample_data.dart';

class MockProductDetailBloc
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SelectedProductImage', () {
    testExecutable(() {
      goldenTest(
        'Only one image available',
        fileName: 'only_one_image_available',
        pumpBeforeTest: precacheImages,
        builder: () {
          final mockBloc = MockProductDetailBloc();
          when(() => mockBloc.state).thenReturn(
            const ProductDetailState.test(),
          );

          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'Product with one images',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(value: mockBloc),
                ],
                child: SelectedProductImage(
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
