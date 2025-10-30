import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:skelter/core/errors/exceptions.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/product_detail/data/models/product_detail_model.dart';
import 'package:skelter/utils/cache_manager.dart';
import 'package:skelter/utils/typedef.dart';

mixin ProductDetailRemoteDatasource {
  Future<ProductDetailModel> getProductDetail({required String id});
}

const kGetProductDetailEndpoint = '/productDetail/';

class ProductDetailRemoteDataSrcImpl implements ProductDetailRemoteDatasource {
  ProductDetailRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<ProductDetailModel> getProductDetail({required String id}) async {
    try {
      final response = await _dio.get(
        '$kGetProductDetailEndpoint$id',
        options: sl<CacheManager>().noCacheOptions().toOptions(),
      );

      if (response.statusCode != 200) {
        throw APIException(
          message: response.data,
          statusCode: response.statusCode ?? 500,
        );
      }

      return ProductDetailModel.fromMap(response.data as DataMap);
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}
