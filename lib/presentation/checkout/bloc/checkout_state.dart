import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class CheckoutState with EquatableMixin {
  final int stepperIndex;

  CheckoutState({
    required this.stepperIndex,
  });

  CheckoutState.initial() : stepperIndex = 0;

  CheckoutState.copy(CheckoutState state) : stepperIndex = state.stepperIndex;

  CheckoutState copyWith({
    int? stepperIndex,
  }) {
    return CheckoutState(
      stepperIndex: stepperIndex ?? this.stepperIndex,
    );
  }

  @visibleForTesting
  CheckoutState.test({
    int? stepperIndex,
  }) : stepperIndex = stepperIndex ?? 0;

  @override
  List<Object?> get props => [
        stepperIndex,
      ];
}
