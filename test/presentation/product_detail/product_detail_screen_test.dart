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
import 'package:skelter/presentation/product_detail/widgets/product_add_to_cart_button.dart';
import 'package:skelter/presentation/product_detail/widgets/product_description.dart';
import 'package:skelter/presentation/product_detail/widgets/product_mark_favorite_button.dart';
import 'package:skelter/presentation/product_detail/widgets/product_photos_section.dart';
import 'package:skelter/presentation/product_detail/widgets/product_price.dart';
import 'package:skelter/presentation/product_detail/widgets/product_reviews_button.dart';
import 'package:skelter/presentation/product_detail/widgets/product_title_and_rating.dart';
import 'package:skelter/presentation/product_detail/widgets/selected_product_image.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';
import 'data/product_detail_sample_data.dart';

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

  group('ProductDetail Body', () {
    testWidgets('ProductTitleAndRating', (tester) async {
      await tester.runWidgetTest(
        child: const ProductTitleAndRating(
          title: 'Premium Wireless Headphones',
          rating: 4.8,
        ),
      );
      expect(find.text('Premium Wireless Headphones'), findsOneWidget);
      expect(find.text('4.8'), findsOneWidget);
    });

    testExecutable(() {
      goldenTest(
        'ProductTitleAndRating - different text variations',
        fileName: 'product_title_and_rating_variations',
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
                child: const ProductTitleAndRating(
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
                child: const ProductTitleAndRating(
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
                child: const ProductTitleAndRating(
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
                child: const ProductTitleAndRating(
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
                child: const ProductTitleAndRating(
                  title: 'Supercalifragilisticexpialidocious',
                  rating: 3.7,
                ),
              ),
            ],
          );
        },
      );
    });

    testWidgets('ProductDescription', (tester) async {
      await tester.runWidgetTest(
        child: const ProductDescription(
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
        'ProductDescription different text variations',
        fileName: 'product_description_variations',
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
                child: const ProductDescription(
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
                child: const ProductDescription(
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
                child: const ProductDescription(
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
                name: 'HTML tags in description',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const ProductDescription(
                  description:
                      '<p>This description contains <b>HTML tags</b> that '
                      'should be rendered properly.</p> '
                      '<ul><li>Feature 1</li><li>Feature 2</li></ul>',
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
                child: const ProductDescription(
                  description:
                      '''This is an extremely long product description that goes on and on without any line breaks. It should properly wrap and handle the text overflow gracefully. The description contains important details about the product features, specifications, and benefits. It should be displayed in a readable format with proper line height and padding. The text should be clear and easy to read on all screen sizes. This is just more text to make the description even longer and test how it handles large amounts of text in a single paragraph.''',
                ),
              ),
            ],
          );
        },
      );
    });

    testWidgets('ProductPrice', (tester) async {
      await tester.runWidgetTest(
        child: const ProductPrice(price: 99.99),
      );
      expect(find.textContaining('99.99'), findsOneWidget);
    });

    testExecutable(() {
      goldenTest(
        'ProductPrice with different price formats',
        fileName: 'product_price_variations',
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
                child: const ProductPrice(price: 99.99),
              ),
              createTestScenario(
                name: 'High price',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const ProductPrice(price: 1999.99),
              ),
              createTestScenario(
                name: 'Low price',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const ProductPrice(price: 0.99),
              ),
              createTestScenario(
                name: 'Very high price',
                addScaffold: true,
                providers: [
                  BlocProvider<ProductDetailBloc>.value(
                    value: productDetailBloc,
                  ),
                ],
                child: const ProductPrice(price: 9999.99),
              ),
            ],
          );
        },
      );
    });

    testWidgets('ProductReviewsButton', (tester) async {
      await tester.runWidgetTest(
        child: const Scaffold(
          body: ProductReviewsButton(),
        ),
      );
      expect(find.byType(ProductReviewsButton), findsOneWidget);
    });

    testExecutable(() {
      goldenTest(
        'Product with one image available',
        fileName: 'product_with_one_image',
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

    testWidgets('ProductPhotosSection renders correctly', (tester) async {
      final productDetailBloc = MockProductDetailBloc();
      when(() => productDetailBloc.state).thenReturn(
        const ProductDetailState.test(),
      );

      await tester.runWidgetTest(
        providers: [
          BlocProvider<ProductDetailBloc>.value(value: productDetailBloc),
        ],
        child: ProductPhotosSection(
          productDetail: generateSampleProductDetail(),
        ),
      );
      expect(find.byType(ProductPhotosSection), findsOneWidget);
    });

    testExecutable(() {
      goldenTest(
        'ProductPhotosSection with different photo gallery variations',
        fileName: 'product_with_multiple_images',
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
                child: ProductPhotosSection(
                  productDetail: generateSampleProductDetail(),
                ),
              ),
            ],
          );
        },
      );
    });

    testWidgets('ProductMarkFavoriteButton', (tester) async {
      await tester.runWidgetTest(
        child: const Scaffold(
          body: Row(
            children: [
              ProductMarkFavoriteButton(),
            ],
          ),
        ),
      );
      expect(find.byType(ProductMarkFavoriteButton), findsOneWidget);
    });

    testWidgets('Product Action Buttons render together', (tester) async {
      await tester.runWidgetTest(
        child: const Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                ProductAddToCartButton(),
                SizedBox(width: 16),
                ProductMarkFavoriteButton(),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(ProductAddToCartButton), findsOneWidget);
      expect(find.byType(ProductMarkFavoriteButton), findsOneWidget);
    });
  });
}
