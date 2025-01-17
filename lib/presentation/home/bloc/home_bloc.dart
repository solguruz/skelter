import 'package:flutter_skeleton/logger/app_logging.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_event.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/analytics_helper.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with Loggable {
  HomeBloc() : super(HomeState.initial()) {
    _setupEventListener();
  }

  @override
  void onEvent(HomeEvent event) {
    super.onEvent(event);
    AnalyticsHelper().logCustomEvent(
      event.eventName,
      parameters: event.getAnalyticParameters(),
    );
  }

  @override
  String get className => (LoginBloc).toString();

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

extension HomeBlcoExtension on BuildContext {
  HomeBloc get homeBloc => BlocProvider.of<HomeBloc>(this);
}
