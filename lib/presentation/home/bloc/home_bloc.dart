import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_event.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_state.dart';
import 'package:flutter_skeleton/presentation/home/data/dummy_product_data.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    _setupEventListener();
  }

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
  ) {
    emit(state.copyWith(topProducts: dummyProductData));
  }
}

extension HomeBlocExtension on BuildContext {
  HomeBloc get homeBloc => BlocProvider.of<HomeBloc>(this);
}
