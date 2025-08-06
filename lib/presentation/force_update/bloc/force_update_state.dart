import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ForceUpdateState with EquatableMixin {
  final bool isMandatoryUpdate;

  const ForceUpdateState({
    required this.isMandatoryUpdate,
  });

  const ForceUpdateState.initial() : isMandatoryUpdate = false;

  ForceUpdateState.copy(ForceUpdateState state)
      : this(
          isMandatoryUpdate: state.isMandatoryUpdate,
        );

  ForceUpdateState copyWith({
    bool? isMandatoryUpdate,
  }) {
    return ForceUpdateState(
      isMandatoryUpdate: isMandatoryUpdate ?? this.isMandatoryUpdate,
    );
  }

  @visibleForTesting
  const ForceUpdateState.test({
    this.isMandatoryUpdate = false,
  });

  @override
  List<Object?> get props => [
        isMandatoryUpdate,
      ];
}

class SkipUpdateState extends ForceUpdateState {
  SkipUpdateState(super.state) : super.copy();
}
