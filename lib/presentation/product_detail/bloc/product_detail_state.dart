import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:skelter/presentation/product_detail/domain/entities/product_detail.dart';

class ProductDetailState with EquatableMixin {
  final int selectedImageIndex;
  final ProductDetail? productDetail;
  final String? errorMessage;

  const ProductDetailState({
    required this.selectedImageIndex,
    this.productDetail,
    this.errorMessage,
  });

  const ProductDetailState.initial()
      : selectedImageIndex = 0,
        productDetail = null,
        errorMessage = null;

  ProductDetailState.copy(ProductDetailState state)
      : selectedImageIndex = state.selectedImageIndex,
        productDetail = state.productDetail,
        errorMessage = state.errorMessage;

  ProductDetailState copyWith({
    int? selectedImageIndex,
    ProductDetail? productDetail,
    String? errorMessage,
  }) {
    return ProductDetailState(
      selectedImageIndex: selectedImageIndex ?? this.selectedImageIndex,
      productDetail: productDetail ?? this.productDetail,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @visibleForTesting
  const ProductDetailState.test({
    this.selectedImageIndex = 0,
    this.productDetail,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [selectedImageIndex, productDetail, errorMessage];
}

class ProductDetailLoading extends ProductDetailState {
  ProductDetailLoading(ProductDetailState state)
      : super.copy(
          state.copyWith(),
        );
}

class ProductDetailLoadedState extends ProductDetailState {
  ProductDetailLoadedState(
    ProductDetailState state, {
    required ProductDetail productDetail,
  }) : super.copy(
          state.copyWith(
            productDetail: productDetail,
          ),
        );
}

class ProductDetailErrorState extends ProductDetailState {
  ProductDetailErrorState(
    ProductDetailState state, {
    required String errorMessage,
  }) : super.copy(
          state.copyWith(errorMessage: errorMessage),
        );
}
