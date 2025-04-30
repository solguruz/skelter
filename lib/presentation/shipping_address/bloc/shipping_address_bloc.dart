import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/logger/app_logging.dart';
import 'package:flutter_skeleton/presentation/shipping_address/bloc/shipping_address_events.dart';
import 'package:flutter_skeleton/presentation/shipping_address/bloc/shipping_address_state.dart';
import 'package:flutter_skeleton/utils/analytics_helper.dart';

class ShippingAddressBloc
    extends Bloc<ShippingAddressEvent, ShippingAddressState> with Loggable {
  ShippingAddressBloc() : super(ShippingAddressState.initial()) {
    on<SelectedAddressIndexUpdateEvent>(_onSelectedAddressIndexUpdateEvent);
  }

  @override
  void onEvent(ShippingAddressEvent event) {
    super.onEvent(event);
    AnalyticsHelper().logCustomEvent(
      event.eventName,
      parameters: event.getAnalyticParameters(),
    );
  }

  @override
  String get className => (ShippingAddressBloc).toString();

  void _onSelectedAddressIndexUpdateEvent(
    SelectedAddressIndexUpdateEvent event,
    Emitter<ShippingAddressState> emit,
  ) {
    emit(state.copyWith(selectedAddressIndex: event.index));
  }
}

extension ShippingAddressBlocExtension on ShippingAddressBloc {
  void updateSelectedAddressIndex(int index) {
    add(SelectedAddressIndexUpdateEvent(index: index));
  }
}
