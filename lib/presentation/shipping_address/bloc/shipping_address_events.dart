import 'package:equatable/equatable.dart';

abstract class ShippingAddressEvent extends Equatable {
  const ShippingAddressEvent();
}

class SelectedAddressIndexUpdateEvent extends ShippingAddressEvent {
  final int index;

  const SelectedAddressIndexUpdateEvent({required this.index});

  @override
  List<Object?> get props => [index];
}
