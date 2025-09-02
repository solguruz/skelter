import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:skelter/presentation/home/data/datasources/product_remote_data_source.dart';
import 'package:skelter/presentation/home/data/repositories/product_repository_impl.dart';
import 'package:skelter/presentation/home/domain/repositories/product_repository.dart';
import 'package:skelter/presentation/home/domain/usecases/get_products.dart';
import 'package:skelter/services/firebase_auth_services.dart';
import 'package:skelter/utils/app_flavor_env.dart';

final sl = GetIt.instance;

Future<void> configureDependencies({
  FirebaseAuth? firebaseAuth,
  Dio? dio,
}) async {
  sl.registerLazySingleton<FirebaseAuth>(
    () => firebaseAuth ?? FirebaseAuth.instance,
  );

  sl.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(firebaseAuth: sl<FirebaseAuth>()),
  );

  sl
    ..registerLazySingleton(() => GetProducts(sl()))
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(sl()),
    )
    ..registerLazySingleton<ProductRemoteDatasource>(
      () => ProductRemoteDataSrcImpl(sl()),
    )
    ..registerLazySingleton(
      () =>
          dio ??
          Dio(
            BaseOptions(
              baseUrl: AppConfig.baseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ),
          ),
    );
}
