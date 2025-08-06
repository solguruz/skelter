import 'package:dio/dio.dart';
import 'package:flutter_skeleton/presentation/home/data/datasources/product_remote_data_source.dart';
import 'package:flutter_skeleton/presentation/home/data/repositories/product_repository_impl.dart';
import 'package:flutter_skeleton/presentation/home/domain/repositories/product_repository.dart';
import 'package:flutter_skeleton/presentation/home/domain/usecases/get_products.dart';
import 'package:flutter_skeleton/utils/app_flavor_env.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  sl
    ..registerLazySingleton(() => GetProducts(sl()))
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(sl()),
    )
    ..registerLazySingleton<ProductRemoteDatasource>(
      () => ProductRemoteDataSrcImpl(sl()),
    )
    ..registerLazySingleton(
      () => Dio(
        BaseOptions(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      ),
    );
}
