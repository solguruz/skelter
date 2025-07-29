import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_skeleton/presentation/home/domain/entities/product.dart';

class HomeState with EquatableMixin {
  final int currentBottomNavIndex;
  final List<Product> topProducts;

  HomeState({
    required this.currentBottomNavIndex,
    required this.topProducts,
  });

  HomeState.initial()
      : currentBottomNavIndex = 0,
        topProducts = const [];

  HomeState.copy(HomeState state)
      : currentBottomNavIndex = state.currentBottomNavIndex,
        topProducts = state.topProducts;

  HomeState copyWith({
    int? currentBottomNavIndex,
    List<Product>? topProducts,
  }) {
    return HomeState(
      currentBottomNavIndex:
          currentBottomNavIndex ?? this.currentBottomNavIndex,
      topProducts: topProducts ?? this.topProducts,
    );
  }

  @visibleForTesting
  HomeState.test({
    int? currentBottomNavIndex,
    List<Product>? topProducts,
    bool? isTopProductsLoading,
    String? reviewAttachmentPath,
  })  : currentBottomNavIndex = currentBottomNavIndex ?? 0,
        topProducts = topProducts ?? const [];

  @override
  List<Object?> get props => [
        currentBottomNavIndex,
        topProducts,
      ];
}

class TopProductsLoadedState extends HomeState {
  TopProductsLoadedState(HomeState state, {required List<Product> topProducts})
      : super.copy(state.copyWith(topProducts: topProducts));
}

class AuthenticationError extends HomeState {
  AuthenticationError(HomeState state, {required String errorMessage})
      : super.copy(state.copyWith());
}
