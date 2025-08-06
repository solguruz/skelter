import 'package:flutter_skeleton/presentation/home/data/models/product_model.dart';

class CartModel {
  final ProductModel product;
  int quantities;
  String expectedDeliveryDate;

  CartModel({
    required this.product,
    required this.quantities,
    required this.expectedDeliveryDate,
  });

  // Factory method to create a CartModel from JSON
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      product: ProductModel.fromJson(json['product']),
      quantities: json['quantities'] as int,
      expectedDeliveryDate: json['quantities'] as String,
    );
  }

  // Method to convert a CartModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantities': quantities,
      'expectedDeliveryDate': expectedDeliveryDate,
    };
  }
}
