import 'package:flutter_skeleton/core/usecase/usecase.dart';
import 'package:flutter_skeleton/presentation/home/domain/entities/product.dart';
import 'package:flutter_skeleton/presentation/home/domain/repositories/product_repository.dart';
import 'package:flutter_skeleton/utils/typedef.dart';

class GetProducts with UseCaseWithoutParams<List<Product>> {
  const GetProducts(this._repository);

  final ProductRepository _repository;

  @override
  ResultFuture<List<Product>> call() async => _repository.getProducts();
}
