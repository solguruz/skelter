import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/shipping_address/bloc/shipping_address_events.dart';
import 'package:flutter_skeleton/presentation/shipping_address/bloc/shipping_address_state.dart';

class ShippingAddressBloc
    extends Bloc<ShippingAddressEvent, ShippingAddressState> {
  ShippingAddressBloc() : super(ShippingAddressState.initial()) {
    on<SelectedAddressIndexUpdateEvent>(_onSelectedAddressIndexUpdateEvent);
  }

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
