import 'package:equatable/equatable.dart';

abstract class ForceUpdateEvent with Equatable {
  ForceUpdateEvent();
}

class SkipUpdateEvent extends ForceUpdateEvent {
  SkipUpdateEvent();

  @override
  List<Object?> get props => [];
}
