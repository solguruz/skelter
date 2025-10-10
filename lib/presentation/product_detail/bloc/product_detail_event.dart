import 'package:equatable/equatable.dart';

abstract class ProductDetailEvent with EquatableMixin {
  const ProductDetailEvent();
}

class ProductImageSelectedEvent extends ProductDetailEvent {
  final int selectedIndex;

  const ProductImageSelectedEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}
