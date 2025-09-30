import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:skelter/presentation/home/domain/entities/product.dart';

class HomeState with EquatableMixin {
  final int currentBottomNavIndex;
  final List<Product> topProducts;
  final List<Product> filteredProducts;
  final String searchQuery;
  final bool shouldAnimateListenIcon;

  HomeState({
    required this.currentBottomNavIndex,
    required this.topProducts,
    required this.filteredProducts,
    this.searchQuery = '',
    this.shouldAnimateListenIcon = false,
  });

  HomeState.initial()
      : currentBottomNavIndex = 0,
        topProducts = const [],
        filteredProducts = const [],
        searchQuery = '',
        shouldAnimateListenIcon = false;

  HomeState.copy(HomeState state)
      : currentBottomNavIndex = state.currentBottomNavIndex,
        topProducts = state.topProducts,
        filteredProducts = state.filteredProducts,
        searchQuery = state.searchQuery,
        shouldAnimateListenIcon = state.shouldAnimateListenIcon;

  HomeState copyWith({
    int? currentBottomNavIndex,
    List<Product>? topProducts,
    List<Product>? filteredProducts,
    String? searchQuery,
    bool? shouldAnimateListenIcon,
  }) {
    return HomeState(
      currentBottomNavIndex:
          currentBottomNavIndex ?? this.currentBottomNavIndex,
      topProducts: topProducts ?? this.topProducts,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      searchQuery: searchQuery ?? this.searchQuery,
      shouldAnimateListenIcon:
          shouldAnimateListenIcon ?? this.shouldAnimateListenIcon,
    );
  }

  @visibleForTesting
  HomeState.test({
    int? currentBottomNavIndex,
    List<Product>? topProducts,
    List<Product>? filteredProducts,
    String? searchQuery,
  })  : currentBottomNavIndex = currentBottomNavIndex ?? 0,
        topProducts = topProducts ?? const [],
        filteredProducts = filteredProducts ?? const [],
        searchQuery = searchQuery ?? '',
        shouldAnimateListenIcon = false;

  @override
  List<Object?> get props => [
        currentBottomNavIndex,
        topProducts,
        filteredProducts,
        searchQuery,
        shouldAnimateListenIcon,
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

class MicrophoneVoiceInputtedState extends HomeState {
  MicrophoneVoiceInputtedState(
    HomeState state, {
    required String searchQuery,
    required List<Product> filteredProducts,
  }) : super.copy(
          state.copyWith(
            searchQuery: searchQuery,
            filteredProducts: filteredProducts,
            shouldAnimateListenIcon: false,
          ),
        );
}

class ProductLoadingState extends HomeState {
  ProductLoadingState(HomeState state)
      : super.copy(
          state.copyWith(),
        );
}
