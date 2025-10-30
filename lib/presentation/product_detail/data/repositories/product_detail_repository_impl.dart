import 'package:dartz/dartz.dart';
import 'package:skelter/core/errors/exceptions.dart';
import 'package:skelter/core/errors/failure.dart';
import 'package:skelter/presentation/product_detail/data/datasources/product_detail_remote_data_source.dart';
import 'package:skelter/presentation/product_detail/data/models/product_detail_model.dart';
import 'package:skelter/presentation/product_detail/domain/entities/product_detail.dart';
import 'package:skelter/presentation/product_detail/domain/repositories/product_detail_repository.dart';
import 'package:skelter/utils/typedef.dart';

class ProductDetailRepositoryImpl with ProductDetailRepository {
  const ProductDetailRepositoryImpl(this._remoteDatasource);

  final ProductDetailRemoteDatasource _remoteDatasource;

  @override
  ResultFuture<ProductDetail> getProductDetail({required String id}) async {
    try {
      final ProductDetailModel result =
          await _remoteDatasource.getProductDetail(id: id);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
