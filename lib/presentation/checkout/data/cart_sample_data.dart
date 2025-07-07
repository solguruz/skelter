import 'package:flutter_skeleton/presentation/checkout/data/sample_products.dart';
import 'package:flutter_skeleton/presentation/checkout/model/product_cart.dart';

final List<CartModel> cartSampleData = [
  CartModel(
    product: sampleProducts[0],
    quantities: 2,
    expectedDeliveryDate: 'Sat, 15 Apr',
  ),
  CartModel(
    product: sampleProducts[1],
    quantities: 1,
    expectedDeliveryDate: 'Sat, 15 Apr',
  ),
];

final List<CartModel> oneItemTestCase = [
  CartModel(
    product: testProducts[0],
    quantities: 1,
    expectedDeliveryDate: 'Sat, 15 Apr',
  ),
];

final List<CartModel> shortTitleTestCase = [
  CartModel(
    product: testProducts[0],
    quantities: 2,
    expectedDeliveryDate: 'Sat, 15 Apr',
  ),
];

final List<CartModel> longTitleTestCase = [
  CartModel(
    product: testProducts[1],
    quantities: 1,
    expectedDeliveryDate: 'Sat, 15 Apr',
  ),
];

final List<CartModel> emojiTitleTestCase = [
  CartModel(
    product: testProducts[2],
    quantities: 1,
    expectedDeliveryDate: 'Sat, 15 Apr',
  ),
];

final List<CartModel> noRatingTestCase = [
  CartModel(
    product: testProducts[3],
    quantities: 1,
    expectedDeliveryDate: 'Sat, 15 Apr',
  ),
];

final List<CartModel> threeStarRatingTestCase = [
  CartModel(
    product: testProducts[4],
    quantities: 1,
    expectedDeliveryDate: 'Sat, 15 Apr',
  ),
];

final List<CartModel> priceNoDecimalsTestCase = [
  CartModel(
    product: testProducts[5],
    quantities: 1,
    expectedDeliveryDate: 'Sat, 15 Apr',
  ),
];

final List<CartModel> priceWithDecimalsTestCase = [
  CartModel(
    product: testProducts[6],
    quantities: 1,
    expectedDeliveryDate: 'Sat, 15 Apr',
  ),
];

final List<CartModel> quantityOneTestCase = [
  CartModel(
    product: testProducts[7],
    quantities: 1,
    expectedDeliveryDate: 'Sat, 15 Apr',
  ),
];

final List<CartModel> quantityHundredTestCase = [
  CartModel(
    product: testProducts[8],
    quantities: 100,
    expectedDeliveryDate: 'Sat, 15 Apr',
  ),
];

final List<CartModel> validDeliveryDateTestCase = [
  CartModel(
    product: testProducts[9],
    quantities: 1,
    expectedDeliveryDate: 'Sat, 15 Apr',
  ),
];

final List<CartModel> noDeliveryDateTestCase = [
  CartModel(
    product: testProducts[10],
    quantities: 1,
    expectedDeliveryDate: '',
  ),
];

final List<CartModel> productCategoryWithLongTextTestCase = [
  CartModel(
    product: testProducts[12],
    quantities: 1,
    expectedDeliveryDate: 'Sat, 15 Apr',
  ),
];
