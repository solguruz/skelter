import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_events.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_state.dart';
import 'package:flutter_skeleton/presentation/checkout/data/cart_sample_data.dart';
import 'package:flutter_skeleton/presentation/checkout/initial_checkout_screen.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/apply_coupon.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/cart_item_lists.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/checkout_app_bar.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/custom_stepper.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/empty_cart_view.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/order_summary.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/payment_method_header.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/select_payment_method_from_list.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/shipping_address.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockCheckoutBloc extends MockBloc<CheckoutEvent, CheckoutState>
    implements CheckoutBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Checkout initial Page', () {
    testWidgets('Checkout initial Page', (tester) async {
      await tester.runWidgetTest(
        child: const InitialCheckoutScreen(),
      );
      expect(find.byType(InitialCheckoutScreen), findsOneWidget);
    });
  });

  // Cart details test cases
  testExecutable(() {
    goldenTest(
      'Cart screen UI Test',
      fileName: 'cart_screen',
      pumpBeforeTest: precacheImages,
      builder: () {
        final checkoutBlocCartScreen = MockCheckoutBloc();
        when(() => checkoutBlocCartScreen.state).thenReturn(
          CheckoutState.test(
            stepperIndex: 0,
            totalPrice: 899.97,
            discount: 25.9,
            deliveryCharges: 10,
            finalAmount: 884.07,
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Cart screen',
              child: const CheckoutScreenBody(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(value: checkoutBlocCartScreen),
              ],
            ),
          ],
        );
      },
    );
  });
  testExecutable(() {
    goldenTest(
      'Empty Cart View UI Test',
      fileName: 'empty_cart_view',
      builder: () {
        final checkoutBlocEmptyCart = MockCheckoutBloc();
        when(() => checkoutBlocEmptyCart.state)
            .thenReturn(CheckoutState.test());

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Empty Cart View',
              child: const EmptyCartView(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(value: checkoutBlocEmptyCart),
              ],
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Cart Details Appbar UI Test',
      fileName: 'cart_details_app_bar',
      builder: () {
        final checkoutBlocCartDetailsAppBar = MockCheckoutBloc();
        when(() => checkoutBlocCartDetailsAppBar.state)
            .thenReturn(CheckoutState.test(stepperIndex: 0));

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Cart Details Appbar',
              child: const CheckoutAppBar(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocCartDetailsAppBar,
                ),
              ],
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Cart Details Custom Stepper UI Test',
      fileName: 'cart_details_custom_stepper',
      builder: () {
        final checkoutBlocCartDetailsStepper = MockCheckoutBloc();
        when(() => checkoutBlocCartDetailsStepper.state).thenReturn(
          CheckoutState.test(stepperIndex: 0),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Cart Details Custom Stepper',
              child: const CustomStepper(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocCartDetailsStepper,
                ),
              ],
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Cart details items UI Test',
      fileName: 'cart_details_items',
      pumpBeforeTest: precacheImages,
      builder: () {
        final checkoutBlocCartDetailsShortTitle = MockCheckoutBloc();
        when(() => checkoutBlocCartDetailsShortTitle.state).thenReturn(
          CheckoutState.test(cartData: shortTitleTestCase),
        );

        final checkoutBlocCartDetailsLongTitle = MockCheckoutBloc();
        when(() => checkoutBlocCartDetailsLongTitle.state).thenReturn(
          CheckoutState.test(cartData: longTitleTestCase),
        );

        final checkoutBlocCartDetailsNoRating = MockCheckoutBloc();
        when(() => checkoutBlocCartDetailsNoRating.state).thenReturn(
          CheckoutState.test(cartData: noRatingTestCase),
        );

        final checkoutBlocCartDetailsThreeStarRating = MockCheckoutBloc();
        when(() => checkoutBlocCartDetailsThreeStarRating.state).thenReturn(
          CheckoutState.test(cartData: threeStarRatingTestCase),
        );

        final checkoutBlocCartDetailsPriceNoDecimals = MockCheckoutBloc();
        when(() => checkoutBlocCartDetailsPriceNoDecimals.state).thenReturn(
          CheckoutState.test(cartData: priceNoDecimalsTestCase),
        );

        final checkoutBlocCartDetailsPriceWithDecimals = MockCheckoutBloc();
        when(() => checkoutBlocCartDetailsPriceWithDecimals.state).thenReturn(
          CheckoutState.test(cartData: priceWithDecimalsTestCase),
        );

        final checkoutBlocCartDetailsQuantityOne = MockCheckoutBloc();
        when(() => checkoutBlocCartDetailsQuantityOne.state).thenReturn(
          CheckoutState.test(cartData: quantityOneTestCase),
        );

        final checkoutBlocCartDetailsQuantityHundred = MockCheckoutBloc();
        when(() => checkoutBlocCartDetailsQuantityHundred.state).thenReturn(
          CheckoutState.test(cartData: quantityHundredTestCase),
        );

        final checkoutBlocCartDetailsValidDeliveryDate = MockCheckoutBloc();
        when(() => checkoutBlocCartDetailsValidDeliveryDate.state).thenReturn(
          CheckoutState.test(cartData: validDeliveryDateTestCase),
        );

        final checkoutBlocCartDetailsNoDeliveryDate = MockCheckoutBloc();
        when(() => checkoutBlocCartDetailsNoDeliveryDate.state).thenReturn(
          CheckoutState.test(cartData: noDeliveryDateTestCase),
        );

        final checkoutBlocCartDetailsProductCategoryWithLongText =
            MockCheckoutBloc();
        when(() => checkoutBlocCartDetailsProductCategoryWithLongText.state)
            .thenReturn(
          CheckoutState.test(cartData: productCategoryWithLongTextTestCase),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'cart items with short title',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocCartDetailsShortTitle,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.localization.cart_items,
                        style: AppTextStyles.p2Bold,
                      ),
                      const SizedBox(height: 16),
                      const CartItemLists(),
                    ],
                  );
                },
              ),
            ),
            createTestScenario(
              name: 'cart items with long title',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocCartDetailsLongTitle,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.localization.cart_items,
                        style: AppTextStyles.p2Bold,
                      ),
                      const SizedBox(height: 16),
                      const CartItemLists(),
                    ],
                  );
                },
              ),
            ),
            createTestScenario(
              name: 'cart items with no rating',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocCartDetailsNoRating,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.localization.cart_items,
                        style: AppTextStyles.p2Bold,
                      ),
                      const SizedBox(height: 16),
                      const CartItemLists(),
                    ],
                  );
                },
              ),
            ),
            createTestScenario(
              name: 'cart items with 3-star rating',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocCartDetailsThreeStarRating,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.localization.cart_items,
                        style: AppTextStyles.p2Bold,
                      ),
                      const SizedBox(height: 16),
                      const CartItemLists(),
                    ],
                  );
                },
              ),
            ),
            createTestScenario(
              name: 'cart items with price no decimals',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocCartDetailsPriceNoDecimals,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.localization.cart_items,
                        style: AppTextStyles.p2Bold,
                      ),
                      const SizedBox(height: 16),
                      const CartItemLists(),
                    ],
                  );
                },
              ),
            ),
            createTestScenario(
              name: 'cart items with price with decimals',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocCartDetailsPriceWithDecimals,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.localization.cart_items,
                        style: AppTextStyles.p2Bold,
                      ),
                      const SizedBox(height: 16),
                      const CartItemLists(),
                    ],
                  );
                },
              ),
            ),
            createTestScenario(
              name: 'cart items with 1 quantity',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocCartDetailsQuantityOne,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.localization.cart_items,
                        style: AppTextStyles.p2Bold,
                      ),
                      const SizedBox(height: 16),
                      const CartItemLists(),
                    ],
                  );
                },
              ),
            ),
            createTestScenario(
              name: 'cart items with 100 quantity',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocCartDetailsQuantityHundred,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.localization.cart_items,
                        style: AppTextStyles.p2Bold,
                      ),
                      const SizedBox(height: 16),
                      const CartItemLists(),
                    ],
                  );
                },
              ),
            ),
            createTestScenario(
              name: 'cart items with valid delivery date',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocCartDetailsValidDeliveryDate,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.localization.cart_items,
                        style: AppTextStyles.p2Bold,
                      ),
                      const SizedBox(height: 16),
                      const CartItemLists(),
                    ],
                  );
                },
              ),
            ),
            createTestScenario(
              name: 'cart items with no delivery date',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocCartDetailsNoDeliveryDate,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.localization.cart_items,
                        style: AppTextStyles.p2Bold,
                      ),
                      const SizedBox(height: 16),
                      const CartItemLists(),
                    ],
                  );
                },
              ),
            ),
            createTestScenario(
              name: 'cart items with long product category name',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocCartDetailsProductCategoryWithLongText,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.localization.cart_items,
                        style: AppTextStyles.p2Bold,
                      ),
                      const SizedBox(height: 16),
                      const CartItemLists(),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Order Summary  UI Test',
      fileName: 'order_summary',
      builder: () {
        final checkoutBlocOrderSummaryStandardValues = MockCheckoutBloc();
        when(() => checkoutBlocOrderSummaryStandardValues.state).thenReturn(
          CheckoutState.test(
            totalPrice: 199.98,
            discount: 20.00,
            deliveryCharges: 5.00,
            finalAmount: 184.98,
          ),
        );

        final checkoutBlocOrderSummaryZeroDelivery = MockCheckoutBloc();
        when(() => checkoutBlocOrderSummaryZeroDelivery.state).thenReturn(
          CheckoutState.test(
            totalPrice: 99.99,
            discount: 10.00,
            deliveryCharges: 0.0,
            finalAmount: 89.99,
          ),
        );

        final checkoutBlocOrderSummaryZeroValues = MockCheckoutBloc();
        when(() => checkoutBlocOrderSummaryZeroValues.state).thenReturn(
          CheckoutState.test(
            totalPrice: 0.0,
            discount: 0.0,
            deliveryCharges: 0.0,
            finalAmount: 0.0,
          ),
        );

        final checkoutBlocOrderSummaryLargeAmount = MockCheckoutBloc();
        when(() => checkoutBlocOrderSummaryLargeAmount.state).thenReturn(
          CheckoutState.test(
            totalPrice: 1540.75,
            discount: 340.25,
            deliveryCharges: 0.0,
            finalAmount: 1200.50,
          ),
        );

        final checkoutBlocOrderSummaryOneItem = MockCheckoutBloc();
        when(() => checkoutBlocOrderSummaryOneItem.state).thenReturn(
          CheckoutState.test(
            totalPrice: 1540.75,
            discount: 340.25,
            deliveryCharges: 0.0,
            finalAmount: 1200.50,
            cartData: oneItemTestCase,
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'standard charges',
              child: const OrderSummary(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocOrderSummaryStandardValues,
                ),
              ],
            ),
            createTestScenario(
              name: 'zero delivery charges',
              child: const OrderSummary(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocOrderSummaryZeroDelivery,
                ),
              ],
            ),
            createTestScenario(
              name: 'zero total charges',
              child: const OrderSummary(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocOrderSummaryZeroValues,
                ),
              ],
            ),
            createTestScenario(
              name: 'large price',
              child: const OrderSummary(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocOrderSummaryLargeAmount,
                ),
              ],
            ),
            createTestScenario(
              name: 'one item in cart',
              child: const OrderSummary(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocOrderSummaryOneItem,
                ),
              ],
            ),
          ],
        );
      },
    );
  });

  // Shipping details test cases

  testExecutable(() {
    goldenTest(
      'Shipping detail screen UI Test',
      fileName: 'shipping_detail_screen',
      pumpBeforeTest: precacheImages,
      builder: () {
        final checkoutBlocShippingDetailScreen = MockCheckoutBloc();
        when(() => checkoutBlocShippingDetailScreen.state).thenReturn(
          CheckoutState.test(
            stepperIndex: 1,
            totalPrice: 899.97,
            discount: 25.9,
            deliveryCharges: 10,
            finalAmount: 884.07,
            userName: 'john doe',
            address: '123 Main St',
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Shipping detail screen',
              child: const CheckoutScreenBody(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocShippingDetailScreen,
                ),
              ],
            ),
          ],
        );
      },
    );
  });
  testExecutable(() {
    goldenTest(
      'Shipping Details Appbar',
      fileName: 'shipping_detail_app_bar',
      builder: () {
        final checkoutBlocShippingDetailAppBar = MockCheckoutBloc();
        when(() => checkoutBlocShippingDetailAppBar.state)
            .thenReturn(CheckoutState.test(stepperIndex: 1));

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Shipping Details Appbar',
              child: const CheckoutAppBar(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocShippingDetailAppBar,
                ),
              ],
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Shipping details Custom Stepper UI Test',
      fileName: 'shipping_details_custom_stepper',
      builder: () {
        final checkoutBlocShippingDetailStepper = MockCheckoutBloc();
        when(() => checkoutBlocShippingDetailStepper.state).thenReturn(
          CheckoutState.test(stepperIndex: 1),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Shipping details Custom Stepper',
              child: const CustomStepper(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocShippingDetailStepper,
                ),
              ],
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Shipping details address UI Test',
      fileName: 'shipping_details_address',
      pumpBeforeTest: precacheImages,
      builder: () {
        // Short user name with short address
        final checkoutBlocWithShortUserNameAndShortAddress = MockCheckoutBloc();
        when(() => checkoutBlocWithShortUserNameAndShortAddress.state)
            .thenReturn(
          CheckoutState.test(userName: 'john doe', address: '123 Main St'),
        );

        // Long user name with long address
        final checkoutBlocWithLongUserNameAndLongAddress = MockCheckoutBloc();
        when(() => checkoutBlocWithLongUserNameAndLongAddress.state).thenReturn(
          CheckoutState.test(
            userName: 'Johnathan Alexander Doe the Third of the Royal House of '
                'Windermere and Heir to the Northern Highlands',
            address: '1234 Elm Street, Apartment 56B, Springfield Heights, '
                'Springfield, Illinois, 62701, United States of America',
          ),
        );

        // Short user name with long address
        final checkoutBlocWithShortUserNameAndLongAddress = MockCheckoutBloc();
        when(() => checkoutBlocWithShortUserNameAndLongAddress.state)
            .thenReturn(
          CheckoutState.test(
            userName: 'Johnathan Alexander Doe',
            address: '1234 Elm Street, Apartment 56B, Springfield Heights, '
                'Springfield, Illinois, 62701, United States of America',
          ),
        );

        // Long user name with short address
        final checkoutBlocWithLongUserNameAndShortAddress = MockCheckoutBloc();
        when(() => checkoutBlocWithLongUserNameAndShortAddress.state)
            .thenReturn(
          CheckoutState.test(
            userName: 'Johnathan Alexander Doe the Third of '
                'the Royal House of Windermere',
            address: '123 Main St',
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'shipping address with short user name and short address',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocWithShortUserNameAndShortAddress,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.localization.shipping_address,
                        style: AppTextStyles.p2Bold,
                      ),
                      const SizedBox(height: 16),
                      const ShippingAddress(),
                    ],
                  );
                },
              ),
            ),
            createTestScenario(
              name: 'shipping address with long user name and long address',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocWithLongUserNameAndLongAddress,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.localization.shipping_address,
                        style: AppTextStyles.p2Bold,
                      ),
                      const SizedBox(height: 16),
                      const ShippingAddress(),
                    ],
                  );
                },
              ),
            ),
            createTestScenario(
              name: 'shipping address with short user name and long address',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocWithShortUserNameAndLongAddress,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.localization.shipping_address,
                        style: AppTextStyles.p2Bold,
                      ),
                      const SizedBox(height: 16),
                      const ShippingAddress(),
                    ],
                  );
                },
              ),
            ),
            createTestScenario(
              name: 'shipping address with long user name and short address',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocWithLongUserNameAndShortAddress,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.localization.shipping_address,
                        style: AppTextStyles.p2Bold,
                      ),
                      const SizedBox(height: 16),
                      const ShippingAddress(),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  });

  // Payment test cases

  testExecutable(() {
    goldenTest(
      'Payment screen UI Test',
      fileName: 'payment_screen',
      pumpBeforeTest: precacheImages,
      builder: () {
        final checkoutBlocShippingDetailScreen = MockCheckoutBloc();
        when(() => checkoutBlocShippingDetailScreen.state).thenReturn(
          CheckoutState.test(
            stepperIndex: 2,
            totalPrice: 899.97,
            discount: 25.9,
            deliveryCharges: 10,
            finalAmount: 884.07,
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Payment screen',
              child: const CheckoutScreenBody(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocShippingDetailScreen,
                ),
              ],
            ),
          ],
        );
      },
    );
  });
  testExecutable(() {
    goldenTest(
      'Payment Appbar UI test',
      fileName: 'payment_app_bar',
      builder: () {
        final checkoutBlocPaymentAppBar = MockCheckoutBloc();
        when(() => checkoutBlocPaymentAppBar.state)
            .thenReturn(CheckoutState.test(stepperIndex: 2));

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Payment appbar',
              child: const CheckoutAppBar(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocPaymentAppBar,
                ),
              ],
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Payment Custom Stepper UI Test',
      fileName: 'payment_custom_stepper',
      builder: () {
        final checkoutBlocPaymentStepper = MockCheckoutBloc();
        when(() => checkoutBlocPaymentStepper.state).thenReturn(
          CheckoutState.test(stepperIndex: 2),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'payment stepper',
              child: const CustomStepper(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocPaymentStepper,
                ),
              ],
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Payment methods UI Test',
      fileName: 'payment_methods',
      pumpBeforeTest: precacheImages,
      builder: () {
        final checkoutBlocPaymentMethodOnline = MockCheckoutBloc();
        when(() => checkoutBlocPaymentMethodOnline.state).thenReturn(
          CheckoutState.test(stepperIndex: 2, isPaymentMethodOnline: true),
        );

        final checkoutBlocPaymentCOD = MockCheckoutBloc();
        when(() => checkoutBlocPaymentCOD.state).thenReturn(
          CheckoutState.test(stepperIndex: 2, isPaymentMethodOnline: false),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'payment method online',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocPaymentMethodOnline,
                ),
              ],
              child: Builder(
                builder: (context) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PaymentMethodHeader(),
                      SelectPaymentMethodFromList(),
                    ],
                  );
                },
              ),
            ),
            createTestScenario(
              name: 'payment method cash on delivery',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(value: checkoutBlocPaymentCOD),
              ],
              child: Builder(
                builder: (context) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PaymentMethodHeader(),
                      SelectPaymentMethodFromList(),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Payment apply coupon UI Test',
      fileName: 'payment_apply_coupon',
      pumpBeforeTest: precacheImages,
      builder: () {
        final checkoutBlocPaymentOneCoupon = MockCheckoutBloc();
        when(() => checkoutBlocPaymentOneCoupon.state).thenReturn(
          CheckoutState.test(stepperIndex: 2),
        );
        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'one coupon available',
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocPaymentOneCoupon,
                ),
              ],
              child: const ApplyCoupon(),
            ),
          ],
        );
      },
    );
  });

  // Order review test cases

  testExecutable(() {
    goldenTest(
      'Order review UI Test',
      fileName: 'order_review_screen',
      pumpBeforeTest: precacheImages,
      builder: () {
        final checkoutBlocShippingDetailScreen = MockCheckoutBloc();
        when(() => checkoutBlocShippingDetailScreen.state).thenReturn(
          CheckoutState.test(
            stepperIndex: 3,
            totalPrice: 899.97,
            discount: 25.9,
            deliveryCharges: 10,
            finalAmount: 884.07,
            userName: 'john doe',
            address: '123 Main St',
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Order review screen',
              child: const CheckoutScreenBody(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocShippingDetailScreen,
                ),
              ],
            ),
          ],
        );
      },
    );
  });
  testExecutable(() {
    goldenTest(
      'Order review Appbar UI test',
      fileName: 'order_review_app_bar',
      builder: () {
        final checkoutBlocOrderReviewAppBar = MockCheckoutBloc();
        when(() => checkoutBlocOrderReviewAppBar.state)
            .thenReturn(CheckoutState.test(stepperIndex: 3));

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Order review appbar',
              child: const CheckoutAppBar(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocOrderReviewAppBar,
                ),
              ],
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Order review Custom Stepper UI Test',
      fileName: 'order_review_custom_stepper',
      builder: () {
        final checkoutBlocOrderReviewStepper = MockCheckoutBloc();
        when(() => checkoutBlocOrderReviewStepper.state).thenReturn(
          CheckoutState.test(stepperIndex: 3),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Order review stepper',
              child: const CustomStepper(),
              addScaffold: true,
              providers: [
                BlocProvider<CheckoutBloc>.value(
                  value: checkoutBlocOrderReviewStepper,
                ),
              ],
            ),
          ],
        );
      },
    );
  });
}
