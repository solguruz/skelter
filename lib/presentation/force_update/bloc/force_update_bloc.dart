import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/force_update/bloc/force_update_event.dart';
import 'package:flutter_skeleton/presentation/force_update/bloc/force_update_state.dart';

class ForceUpdateBloc extends Bloc<ForceUpdateEvent, ForceUpdateState> {
  ForceUpdateBloc({
    required bool isMandatoryUpdate,
  }) : super(
          const ForceUpdateState.initial().copyWith(
            isMandatoryUpdate: isMandatoryUpdate,
          ),
        ) {
    _setupEventListener();
  }

  void _setupEventListener() {
    on<SkipUpdateEvent>(_onSkipUpdateEvent);
  }

  void _onSkipUpdateEvent(
    SkipUpdateEvent event,
    Emitter<ForceUpdateState> emit,
  ) {
    emit(SkipUpdateState(state));
  }
}
