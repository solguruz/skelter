import 'package:skelter/core/usecase/usecase.dart';
import 'package:skelter/presentation/product_detail/domain/entities/product_detail.dart';
import 'package:skelter/presentation/product_detail/domain/repositories/product_detail_repository.dart';
import 'package:skelter/utils/typedef.dart';

class GetProductDetailParams {
  const GetProductDetailParams({required this.id});

  final String id;
}

class GetProductDetail
    with UseCaseWithParams<ProductDetail, GetProductDetailParams> {
  const GetProductDetail(this._repository);

  final ProductDetailRepository _repository;

  @override
  ResultFuture<ProductDetail> call(GetProductDetailParams params) async =>
      _repository.getProductDetail(id: params.id);
}
