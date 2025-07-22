import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_skeleton/presentation/checkout/data/cart_sample_data.dart';
import 'package:flutter_skeleton/presentation/checkout/model/product_cart.dart';

class CheckoutState with EquatableMixin {
  final int stepperIndex;
  final double totalPrice;
  final double discount;
  final double deliveryCharges;
  final double finalAmount;
  final List<CartModel> cartData;
  final String userName;
  final String address;
  final bool isPaymentMethodOnline;
  final int couponCount;

  CheckoutState({
    required this.stepperIndex,
    required this.totalPrice,
    required this.discount,
    required this.deliveryCharges,
    required this.finalAmount,
    required this.cartData,
    required this.userName,
    required this.address,
    required this.isPaymentMethodOnline,
    required this.couponCount,
  });

  CheckoutState.initial()
      : stepperIndex = 0,
        totalPrice = 0.0,
        discount = 0.0,
        deliveryCharges = 0.0,
        finalAmount = 0.0,
        cartData = cartSampleData,
        userName = 'Roz Cooper',
        address = '2118 Thornridge Cir. Syracuse, Connecticut 35624',
        isPaymentMethodOnline = true,
        couponCount = 1;

  CheckoutState.copy(CheckoutState state)
      : stepperIndex = state.stepperIndex,
        totalPrice = state.totalPrice,
        discount = state.discount,
        deliveryCharges = state.deliveryCharges,
        finalAmount = state.finalAmount,
        cartData = state.cartData,
        userName = state.userName,
        address = state.address,
        isPaymentMethodOnline = state.isPaymentMethodOnline,
        couponCount = state.couponCount;

  CheckoutState copyWith({
    int? stepperIndex,
    double? totalPrice,
    double? discount,
    double? deliveryCharges,
    double? finalAmount,
    List<CartModel>? cartData,
    String? userName,
    String? address,
    bool? isPaymentMethodOnline,
    int? couponCount,
  }) {
    return CheckoutState(
      stepperIndex: stepperIndex ?? this.stepperIndex,
      totalPrice: totalPrice ?? this.totalPrice,
      discount: discount ?? this.discount,
      deliveryCharges: deliveryCharges ?? this.deliveryCharges,
      finalAmount: finalAmount ?? this.finalAmount,
      cartData: cartData ?? this.cartData,
      address: address ?? this.address,
      userName: userName ?? this.userName,
      isPaymentMethodOnline:
          isPaymentMethodOnline ?? this.isPaymentMethodOnline,
      couponCount: couponCount ?? this.couponCount,
    );
  }

  @visibleForTesting
  CheckoutState.test({
    int? stepperIndex,
    double? totalPrice,
    double? discount,
    double? deliveryCharges,
    double? finalAmount,
    List<CartModel>? cartData,
    String? userName,
    String? address,
    bool? isPaymentMethodOnline,
    int? couponCount,
  })  : stepperIndex = stepperIndex ?? 0,
        totalPrice = totalPrice ?? 0.0,
        discount = discount ?? 0.0,
        deliveryCharges = deliveryCharges ?? 0.0,
        finalAmount = finalAmount ?? 0.0,
        cartData = cartData ?? cartSampleData,
        userName = userName ?? '',
        address = address ?? '',
        isPaymentMethodOnline = isPaymentMethodOnline ?? true,
        couponCount = couponCount ?? 1;

  @override
  List<Object?> get props => [
        stepperIndex,
        totalPrice,
        discount,
        deliveryCharges,
        finalAmount,
        cartData,
        userName,
        address,
        isPaymentMethodOnline,
        couponCount,
      ];
}

class StepperIndexUpdateState extends CheckoutState {
  StepperIndexUpdateState(
    CheckoutState state, {
    required int index,
  }) : super.copy(state.copyWith(stepperIndex: index));
}
