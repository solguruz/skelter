import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ShippingAddressState with EquatableMixin {
  final int selectedAddressIndex;

  ShippingAddressState({
    required this.selectedAddressIndex,
  });

  ShippingAddressState.initial() : selectedAddressIndex = 0;

  ShippingAddressState.copy(ShippingAddressState state)
      : selectedAddressIndex = state.selectedAddressIndex;

  ShippingAddressState copyWith({
    int? selectedAddressIndex,
  }) {
    return ShippingAddressState(
      selectedAddressIndex: selectedAddressIndex ?? this.selectedAddressIndex,
    );
  }

  @visibleForTesting
  ShippingAddressState.test({
    int? selectedAddressIndex,
  }) : selectedAddressIndex = selectedAddressIndex ?? 0;

  @override
  List<Object?> get props => [
        selectedAddressIndex,
      ];
}
