import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class HomeState with EquatableMixin {
  final int currentBottomNavIndex;

  HomeState({
    required this.currentBottomNavIndex,
  });

  HomeState.initial() : currentBottomNavIndex = 0;

  HomeState.copy(HomeState state)
      : currentBottomNavIndex = state.currentBottomNavIndex;

  HomeState copyWith({
    int? currentBottomNavIndex,
  }) {
    return HomeState(
      currentBottomNavIndex:
          currentBottomNavIndex ?? this.currentBottomNavIndex,
    );
  }

  @visibleForTesting
  HomeState.test({
    int? currentBottomNavIndex,
  }) : currentBottomNavIndex = currentBottomNavIndex ?? 0;

  @override
  List<Object?> get props => [
        currentBottomNavIndex,
      ];
}
