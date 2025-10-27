import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_event.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_state.dart';
import 'package:skelter/presentation/product_detail/domain/usecases/get_product_detail.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc({
    required GetProductDetail getProductDetail,
  })  : _getProductDetail = getProductDetail,
        super(const ProductDetailState.initial()) {
    _setupEventListeners();
  }

  final GetProductDetail _getProductDetail;

  void _setupEventListeners() {
    on<GetProductDetailDataEvent>(_onGetProductDetailDataEvent);
    on<ProductImageSelectedEvent>(_onProductImageSelectedEvent);
  }

  void _onGetProductDetailDataEvent(
    GetProductDetailDataEvent event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(ProductDetailLoading(state));

    final result = await _getProductDetail(
      GetProductDetailParams(id: event.productId),
    );

    result.fold(
      (failure) => emit(
        ProductDetailErrorState(state, errorMessage: failure.errorMessage),
      ),
      (productDetail) => emit(
        ProductDetailLoadedState(
          state,
          productDetail: productDetail,
        ),
      ),
    );
  }

  void _onProductImageSelectedEvent(
    ProductImageSelectedEvent event,
    Emitter<ProductDetailState> emit,
  ) {
    emit(
      state.copyWith(selectedImageIndex: event.selectedIndex),
    );
  }
}
