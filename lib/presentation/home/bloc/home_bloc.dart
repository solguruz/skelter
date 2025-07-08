import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_event.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    _setupEventListener();
  }

  void _setupEventListener() {
    on<BottomNavBarIndexChangedEvent>(_onBottomNavBarIndexChangedEvent);
  }

  void _onBottomNavBarIndexChangedEvent(
    BottomNavBarIndexChangedEvent event,
    Emitter emit,
  ) {
    emit(state.copyWith(currentBottomNavIndex: event.index));
  }
}

extension HomeBlocExtension on BuildContext {
  HomeBloc get homeBloc => BlocProvider.of<HomeBloc>(this);
}
