import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/main.dart';
import 'package:skelter/presentation/home/data/datasources/product_remote_data_source.dart';
import 'package:skelter/presentation/home/data/repositories/product_repository_impl.dart';
import 'package:skelter/presentation/home/domain/repositories/product_repository.dart';
import 'package:skelter/presentation/home/domain/usecases/get_products.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/services/firebase_auth_services.dart';
import 'package:skelter/shared_pref/prefs.dart';
import 'package:skelter/utils/app_flavor_env.dart';
import 'package:skelter/utils/cache_manager.dart';

final sl = GetIt.instance;
bool _isForceLoggingOutUser = false;

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

  final cacheManager = CacheManager();
  await cacheManager.initialize();
  sl.registerSingleton<CacheManager>(cacheManager);

  final pinnedDio = dio ??
      Dio(
        BaseOptions(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

  _registerDioInterceptor(pinnedDio);
  sl<CacheManager>().attachCacheInterceptor(pinnedDio);

  sl
    ..registerLazySingleton(() => GetProducts(sl()))
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(sl()),
    )
    ..registerLazySingleton<ProductRemoteDatasource>(
      () => ProductRemoteDataSrcImpl(sl()),
    )
    ..registerLazySingleton<Dio>(() => pinnedDio);
}

void _registerDioInterceptor(Dio dio) {
  final certHash = _getCertHash();
  dio.interceptors.addAll([
    CertificatePinningInterceptor(
      allowedSHAFingerprints: [certHash],
      callFollowingErrorInterceptor: true,
    ),
    _sslPinningErrorInterceptor,
    _authErrorInterceptor(),
  ]);
}

InterceptorsWrapper get _sslPinningErrorInterceptor {
  return InterceptorsWrapper(
    onError: (DioException dioError, ErrorInterceptorHandler handler) async {
      if (dioError.error.toString().contains(kConnectionIsNotSecureError)) {
        debugPrint('[SSL Pinning] Connection is not secure!');

        await rootNavigatorKey.currentContext!.router
            .replaceAll([const SslConnectionFailedRoute()]);
      }

      handler.next(dioError);
    },
  );
}

InterceptorsWrapper _authErrorInterceptor() => InterceptorsWrapper(
      onError: (DioException dioError, ErrorInterceptorHandler handler) async {
        final statusCode = dioError.response?.statusCode ?? 0;

        debugPrint(
          '[AuthErrorInterceptor] status: $statusCode',
        );

        final shouldLogout =
            !_isForceLoggingOutUser && (statusCode == 401 || statusCode == 403);

        if (shouldLogout) {
          _isForceLoggingOutUser = true;
          try {
            await Prefs.clear();
            await sl<CacheManager>().clearCachedApiResponse();
            await sl<FirebaseAuthService>().signOut();

            final currentContext = rootNavigatorKey.currentContext;
            if (currentContext != null) {
              await currentContext.router
                  .replaceAll([LoginWithPhoneNumberRoute()]);
            } else {
              debugPrint(
                '[AuthErrorInterceptor] No navigator context available',
              );
            }
          } catch (e) {
            debugPrint('[AuthErrorInterceptor] Logout failed: $e');
          } finally {
            _isForceLoggingOutUser = false;
          }
        }

        handler.next(dioError);
      },
    );

String _getCertHash() {
  final certificateHash = AppConfig.getDioCertHash();
  if (certificateHash.isEmpty) {
    throw Exception('[SSL Pinning] Missing certificate hash for: '
        '${AppConfig.appFlavor.name}');
  }

  if (certificateHash.length != 64) {
    throw Exception(
        '[SSL Pinning] Certificate hash length is not 64 characters. '
        'Current length: ${certificateHash.length}');
  }

  debugPrint('[SSL Pinning] Using SHA-256 certHash: "$certificateHash"');
  return certificateHash;
}
