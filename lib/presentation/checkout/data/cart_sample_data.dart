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
