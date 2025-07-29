import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_event.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_state.dart';
import 'package:flutter_skeleton/presentation/home/domain/usecases/get_products.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required GetProducts getProducts,
  })  : _getProducts = getProducts,
        super(HomeState.initial()) {
    _setupEventListener();
  }

  final GetProducts _getProducts;

  void _setupEventListener() {
    on<BottomNavBarIndexChangedEvent>(_onBottomNavBarIndexChangedEvent);
    on<GetTopProductDataEvent>(_onGetTopProductDataEvent);
  }

  void _onBottomNavBarIndexChangedEvent(
    BottomNavBarIndexChangedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(currentBottomNavIndex: event.index));
  }

  void _onGetTopProductDataEvent(
    GetTopProductDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await _getProducts();

    result.fold(
      (failure) =>
          emit(AuthenticationError(state, errorMessage: failure.errorMessage)),
      (topProducts) =>
          emit(TopProductsLoadedState(state, topProducts: topProducts)),
    );
  }
}
