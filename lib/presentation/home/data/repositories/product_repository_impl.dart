import 'package:dartz/dartz.dart';
import 'package:flutter_skeleton/core/errors/exceptions.dart';
import 'package:flutter_skeleton/core/errors/failure.dart';
import 'package:flutter_skeleton/presentation/home/data/datasources/product_remote_data_source.dart';
import 'package:flutter_skeleton/presentation/home/data/models/product_model.dart';
import 'package:flutter_skeleton/presentation/home/domain/entities/product.dart';
import 'package:flutter_skeleton/presentation/home/domain/repositories/product_repository.dart';
import 'package:flutter_skeleton/utils/typedef.dart';

class ProductRepositoryImpl with ProductRepository {
  const ProductRepositoryImpl(this._remoteDatasource);

  final ProductRemoteDatasource _remoteDatasource;

  @override
  ResultFuture<List<Product>> getProducts() async {
    try {
      final List<ProductModel> result = await _remoteDatasource.getProducts();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
