import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_event.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_state.dart';
import 'package:skelter/presentation/product_detail/domain/usecases/generate_ai_product_description.dart';
import 'package:skelter/presentation/product_detail/domain/usecases/get_product_detail.dart';
import 'package:skelter/services/performance_monitoring_service.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc({
    required this._getProductDetail,
    required this._generateAIProductDescription,
  }) : super(const ProductDetailState.initial()) {
    _setupEventListeners();
  }

  final GetProductDetail _getProductDetail;
  final GenerateAIProductDescription _generateAIProductDescription;
  final PerformanceMonitoringService _performanceService = sl();

  void _setupEventListeners() {
    on<GetProductDetailDataEvent>(_onGetProductDetailDataEvent);
    on<ProductImageSelectedEvent>(_onProductImageSelectedEvent);
    on<GenerateAIDescriptionEvent>(_onGenerateAIDescriptionEvent);
  }

  void _onGetProductDetailDataEvent(
    GetProductDetailDataEvent event,
    Emitter<ProductDetailState> emit,
  ) async {
    _performanceService.startTrace(kTraceApiGetProductDetail);
    emit(ProductDetailLoading(state));

    final result = await _getProductDetail(
      GetProductDetailParams(id: event.productId),
    );

    result.fold(
      (failure) {
        _performanceService.putAttribute(
          kTraceApiGetProductDetail,
          kTraceAttrError,
          failure.errorMessage.truncate(100),
        );
        emit(
          ProductDetailErrorState(state, errorMessage: failure.errorMessage),
        );
      },
      (productDetail) {
        _performanceService.putAttribute(
          kTraceApiGetProductDetail,
          kTraceAttrSuccess,
          true,
        );
        emit(ProductDetailLoadedState(state, productDetail: productDetail));
      },
    );

    _performanceService.stopTrace(kTraceApiGetProductDetail);
  }

  void _onProductImageSelectedEvent(
    ProductImageSelectedEvent event,
    Emitter<ProductDetailState> emit,
  ) {
    emit(state.copyWith(selectedImageIndex: event.selectedIndex));
  }

  void _onGenerateAIDescriptionEvent(
    GenerateAIDescriptionEvent event,
    Emitter<ProductDetailState> emit,
  ) async {
    debugPrint('[AI Description] Starting generation...');
    _performanceService.startTrace(kTraceAIDescriptionGeneration);
    emit(AIDescriptionGenerating(state));

    try {
      final result = await _generateAIProductDescription(
        GenerateAIProductDescriptionParams(
          productDetail: event.productDetail,
          userOrderHistory: event.userOrderHistory,
        ),
      );

      result.fold(
        (failure) {
          debugPrint('[AI Description] Error: ${failure.errorMessage}');
          _performanceService.putAttribute(
            kTraceAIDescriptionGeneration,
            kTraceAttrError,
            failure.errorMessage.truncate(100),
          );
          emit(AIDescriptionError(state, errorMessage: failure.errorMessage));
        },
        (aiDescription) {
          debugPrint('[AI Description] Success: Generated description');
          _performanceService.putAttribute(
            kTraceAIDescriptionGeneration,
            kTraceAttrSuccess,
            true,
          );
          emit(AIDescriptionGenerated(state, aiDescription: aiDescription));
        },
      );
    } catch (e) {
      debugPrint('[AI Description] Exception: $e');
      _performanceService.putAttribute(
        kTraceAIDescriptionGeneration,
        kTraceAttrError,
        e.toString().truncate(100),
      );
      emit(
        AIDescriptionError(
          state,
          errorMessage: 'Failed to generate AI description: $e',
        ),
      );
    } finally {
      _performanceService.stopTrace(kTraceAIDescriptionGeneration);
    }
  }
}
