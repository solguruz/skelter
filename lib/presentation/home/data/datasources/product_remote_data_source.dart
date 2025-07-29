import 'package:dio/dio.dart';
import 'package:flutter_skeleton/core/errors/exceptions.dart';
import 'package:flutter_skeleton/presentation/home/data/models/product_model.dart';
import 'package:flutter_skeleton/utils/typedef.dart';

mixin ProductRemoteDatasource {
  Future<List<ProductModel>> getProducts();
}

const kGetProductEndpoint = '/products';

class ProductRemoteDataSrcImpl implements ProductRemoteDatasource {
  ProductRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await _dio.get(
        kGetProductEndpoint,
      );

      if (response.statusCode != 200) {
        throw APIException(
          message: response.data,
          statusCode: response.statusCode ?? 500,
        );
      }

      return List<DataMap>.from(response.data as List)
          .map((userData) => ProductModel.fromMap(userData))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}
