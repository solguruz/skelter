import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class CheckoutState with EquatableMixin {
  final int stepperIndex;
  final double totalPrice;
  final double discount;
  final double deliveryCharges;
  final double finalAmount;

  CheckoutState({
    required this.stepperIndex,
    required this.totalPrice,
    required this.discount,
    required this.deliveryCharges,
    required this.finalAmount,
  });

  CheckoutState.initial()
      : stepperIndex = 0,
        totalPrice = 0.0,
        discount = 0.0,
        deliveryCharges = 0.0,
        finalAmount = 0.0;

  CheckoutState.copy(CheckoutState state)
      : stepperIndex = state.stepperIndex,
        totalPrice = state.totalPrice,
        discount = state.discount,
        deliveryCharges = state.deliveryCharges,
        finalAmount = state.finalAmount;

  CheckoutState copyWith({
    int? stepperIndex,
    double? totalPrice,
    double? discount,
    double? deliveryCharges,
    double? finalAmount,
  }) {
    return CheckoutState(
      stepperIndex: stepperIndex ?? this.stepperIndex,
      totalPrice: totalPrice ?? this.totalPrice,
      discount: discount ?? this.discount,
      deliveryCharges: deliveryCharges ?? this.deliveryCharges,
      finalAmount: finalAmount ?? this.finalAmount,
    );
  }

  @visibleForTesting
  CheckoutState.test({
    int? stepperIndex,
    double? totalPrice,
    double? discount,
    double? deliveryCharges,
    double? finalAmount,
  })  : stepperIndex = stepperIndex ?? 0,
        totalPrice = totalPrice ?? 0.0,
        discount = discount ?? 0.0,
        deliveryCharges = deliveryCharges ?? 0.0,
        finalAmount = finalAmount ?? 0.0;

  @override
  List<Object?> get props => [
        stepperIndex,
        totalPrice,
        discount,
        deliveryCharges,
        finalAmount,
      ];
}
