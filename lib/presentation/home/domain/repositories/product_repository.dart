import 'package:skelter/presentation/home/domain/entities/product.dart';
import 'package:skelter/utils/typedef.dart';

mixin ProductRepository {
  ResultFuture<List<Product>> getProducts();
}
