import 'package:skelter/presentation/product_detail/domain/entities/product_detail.dart';
import 'package:skelter/utils/typedef.dart';

mixin ProductDetailRepository {
  ResultFuture<ProductDetail> getProductDetail({required String id});
}
