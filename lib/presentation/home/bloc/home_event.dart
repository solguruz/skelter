import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class BottomNavBarIndexChangedEvent extends HomeEvent {
  final int index;

  const BottomNavBarIndexChangedEvent({required this.index});

  @override
  List<Object> get props => [index];
}

class GetTopProductDataEvent extends HomeEvent {
  const GetTopProductDataEvent();

  @override
  List<Object> get props => [];
}
