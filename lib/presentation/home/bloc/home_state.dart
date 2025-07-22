import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_skeleton/presentation/checkout/model/product_model.dart';

class HomeState with EquatableMixin {
  final int currentBottomNavIndex;
  final List<ProductModel> topProducts;

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
    List<ProductModel>? topProducts,
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
    List<ProductModel>? topProducts,
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
