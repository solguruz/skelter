import 'package:bloc/bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_event.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(const ProductDetailState.initial()) {
    _setupEventListeners();
  }

  void _setupEventListeners() {
    on<ProductImageSelectedEvent>(_onProductImageSelected);
  }

  void _onProductImageSelected(
    ProductImageSelectedEvent event,
    Emitter<ProductDetailState> emit,
  ) {
    emit(
      state.copyWith(selectedImageIndex: event.selectedIndex),
    );
  }
}
