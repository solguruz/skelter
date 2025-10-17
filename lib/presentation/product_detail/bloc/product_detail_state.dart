import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ProductDetailState with EquatableMixin {
  final int selectedImageIndex;

  const ProductDetailState({
    required this.selectedImageIndex,
  });

  const ProductDetailState.initial() : selectedImageIndex = 0;

  ProductDetailState.copy(ProductDetailState state)
      : this(
          selectedImageIndex: state.selectedImageIndex,
        );

  ProductDetailState copyWith({
    int? selectedImageIndex,
  }) {
    return ProductDetailState(
      selectedImageIndex: selectedImageIndex ?? this.selectedImageIndex,
    );
  }

  @visibleForTesting
  const ProductDetailState.test({
    this.selectedImageIndex = 0,
  });

  @override
  List<Object?> get props => [
        selectedImageIndex,
      ];
}
