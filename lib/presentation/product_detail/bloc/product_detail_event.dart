import 'package:equatable/equatable.dart';
import 'package:skelter/presentation/product_detail/domain/entities/product_detail.dart';

abstract class ProductDetailEvent with Equatable {
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

class GenerateAIDescriptionEvent extends ProductDetailEvent {
  final ProductDetail productDetail;
  final List<String>? userOrderHistory;

  const GenerateAIDescriptionEvent({
    required this.productDetail,
    this.userOrderHistory,
  });

  @override
  List<Object?> get props => [productDetail, userOrderHistory];
}
