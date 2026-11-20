import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:skelter/presentation/product_detail/domain/entities/ai_product_description.dart';
import 'package:skelter/presentation/product_detail/domain/entities/product_detail.dart';

class ProductDetailState with Equatable {
  final int selectedImageIndex;
  final ProductDetail? productDetail;
  final String? errorMessage;
  final AIProductDescription? aiDescription;
  final bool isGeneratingAIDescription;

  const ProductDetailState({
    required this.selectedImageIndex,
    this.productDetail,
    this.errorMessage,
    this.aiDescription,
    this.isGeneratingAIDescription = false,
  });

  const ProductDetailState.initial()
    : selectedImageIndex = 0,
      productDetail = null,
      errorMessage = null,
      aiDescription = null,
      isGeneratingAIDescription = false;

  ProductDetailState.copy(ProductDetailState state)
    : selectedImageIndex = state.selectedImageIndex,
      productDetail = state.productDetail,
      errorMessage = state.errorMessage,
      aiDescription = state.aiDescription,
      isGeneratingAIDescription = state.isGeneratingAIDescription;

  ProductDetailState copyWith({
    int? selectedImageIndex,
    ProductDetail? productDetail,
    String? errorMessage,
    AIProductDescription? aiDescription,
    bool? isGeneratingAIDescription,
  }) {
    return ProductDetailState(
      selectedImageIndex: selectedImageIndex ?? this.selectedImageIndex,
      productDetail: productDetail ?? this.productDetail,
      errorMessage: errorMessage ?? this.errorMessage,
      aiDescription: aiDescription ?? this.aiDescription,
      isGeneratingAIDescription:
          isGeneratingAIDescription ?? this.isGeneratingAIDescription,
    );
  }

  @visibleForTesting
  const ProductDetailState.test({
    this.selectedImageIndex = 0,
    this.productDetail,
    this.errorMessage,
    this.aiDescription,
    this.isGeneratingAIDescription = false,
  });

  @override
  List<Object?> get props => [
    selectedImageIndex,
    productDetail,
    errorMessage,
    aiDescription,
    isGeneratingAIDescription,
  ];
}

class ProductDetailLoading extends ProductDetailState {
  ProductDetailLoading(ProductDetailState state) : super.copy(state.copyWith());
}

class ProductDetailLoadedState extends ProductDetailState {
  ProductDetailLoadedState(
    ProductDetailState state, {
    required ProductDetail productDetail,
  }) : super.copy(state.copyWith(productDetail: productDetail));
}

class ProductDetailErrorState extends ProductDetailState {
  ProductDetailErrorState(
    ProductDetailState state, {
    required String errorMessage,
  }) : super.copy(state.copyWith(errorMessage: errorMessage));
}

class AIDescriptionGenerating extends ProductDetailState {
  AIDescriptionGenerating(ProductDetailState state)
    : super.copy(state.copyWith(isGeneratingAIDescription: true));
}

class AIDescriptionGenerated extends ProductDetailState {
  AIDescriptionGenerated(
    ProductDetailState state, {
    required AIProductDescription aiDescription,
  }) : super.copy(
         state.copyWith(
           aiDescription: aiDescription,
           isGeneratingAIDescription: false,
         ),
       );
}

class AIDescriptionError extends ProductDetailState {
  AIDescriptionError(ProductDetailState state, {required String errorMessage})
    : super.copy(
        state.copyWith(
          errorMessage: errorMessage,
          isGeneratingAIDescription: false,
        ),
      );
}
