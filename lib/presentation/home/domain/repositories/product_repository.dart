import 'package:flutter_skeleton/presentation/home/domain/entities/product.dart';
import 'package:flutter_skeleton/utils/typedef.dart';

mixin ProductRepository {
  ResultFuture<List<Product>> getProducts();
}
