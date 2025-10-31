import 'package:equatable/equatable.dart';

abstract class ProductDetailEvent with EquatableMixin {
  const ProductDetailEvent();
}

class ProductImageSelectedEvent extends ProductDetailEvent {
  final int selectedIndex;

  const ProductImageSelectedEvent({required this.selectedIndex});

  @override
  List<Object?> get props => [selectedIndex];
}

class GetProductDetailDataEvent extends ProductDetailEvent {
  final String productId;

  const GetProductDetailDataEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}