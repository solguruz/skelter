import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';
import 'package:local_auth/local_auth.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/core/deep_link/app_deep_link_manager.dart';
import 'package:skelter/core/services/app_tour_service.dart';
import 'package:skelter/main.dart';
import 'package:skelter/presentation/chat/data/datasources/chat_remote_datasource.dart';
import 'package:skelter/presentation/chat/data/repositories/chat_repository_impl.dart';
import 'package:skelter/presentation/chat/domain/repositories/chat_repository.dart';
import 'package:skelter/presentation/chat/domain/usecases/create_chat_user_document.dart';
import 'package:skelter/presentation/chat/domain/usecases/delete_chat_user_document.dart';
import 'package:skelter/presentation/chat/domain/usecases/send_chat_message.dart';
import 'package:skelter/presentation/chat/domain/usecases/watch_chat_messages.dart';
import 'package:skelter/presentation/chat/domain/usecases/watch_my_chats.dart';
import 'package:skelter/presentation/chat/domain/usecases/watch_other_users.dart';
import 'package:skelter/presentation/feedback/data/datasources/feedback_remote_datasource.dart';
import 'package:skelter/presentation/feedback/data/repositories/feedback_repository_impl.dart';
import 'package:skelter/presentation/feedback/domain/repositories/feedback_repository.dart';
import 'package:skelter/presentation/feedback/domain/usecases/submit_feedback.dart';
import 'package:skelter/presentation/home/data/datasources/product_remote_data_source.dart';
import 'package:skelter/presentation/home/data/repositories/product_repository_impl.dart';
import 'package:skelter/presentation/home/domain/repositories/product_repository.dart';
import 'package:skelter/presentation/home/domain/usecases/get_products.dart';
import 'package:skelter/presentation/product_detail/data/datasources/ai_product_description_remote_data_source.dart';
import 'package:skelter/presentation/product_detail/data/datasources/product_detail_remote_data_source.dart';
import 'package:skelter/presentation/product_detail/data/repositories/ai_product_description_repository_impl.dart';
import 'package:skelter/presentation/product_detail/data/repositories/product_detail_repository_impl.dart';
import 'package:skelter/presentation/product_detail/domain/repositories/ai_product_description_repository.dart';
import 'package:skelter/presentation/product_detail/domain/repositories/product_detail_repository.dart';
import 'package:skelter/presentation/product_detail/domain/usecases/generate_ai_product_description.dart';
import 'package:skelter/presentation/product_detail/domain/usecases/get_product_detail.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/services/ai/gemini_service.dart';
import 'package:skelter/services/dynamic_icon_service.dart';
import 'package:skelter/services/firebase_auth_services.dart';
import 'package:skelter/services/firestore_service.dart';
import 'package:skelter/services/in_app_review_service.dart';
import 'package:skelter/services/local_auth_services.dart';
import 'package:skelter/services/performance_monitoring_service.dart';
import 'package:skelter/services/remote_config_service.dart';
import 'package:skelter/shared_pref/prefs.dart';
import 'package:skelter/utils/app_flavor_env.dart';
import 'package:skelter/utils/cache_manager.dart';
import 'package:skelter/utils/currency_converter/currency_converter_util.dart';
import 'package:skelter/utils/currency_converter/data/datasources/currency_converter_remote_data_source.dart';
import 'package:skelter/utils/currency_converter/data/repositories/currency_converter_repository_impl.dart';
import 'package:skelter/utils/currency_converter/domain/repositories/currency_converter_repository.dart';
import 'package:skelter/utils/currency_converter/domain/usecases/get_exchange_rate.dart';

final sl = GetIt.instance;
bool _isForceLoggingOutUser = false;

Future<void> configureDependencies({
  FirebaseAuth? firebaseAuth,
  GoogleSignIn? googleSignIn,
  FirebaseAuthService? firebaseAuthService,
  Dio? dio,
}) async {
  sl.registerLazySingleton<FirebaseAuth>(
    () => firebaseAuth ?? FirebaseAuth.instance,
  );

  sl.registerLazySingleton<GoogleSignIn>(
    () => googleSignIn ?? GoogleSignIn.instance,
  );

  sl.registerLazySingleton<FirebaseAuthService>(
    () =>
        firebaseAuthService ??
        FirebaseAuthService(
          firebaseAuth: sl<FirebaseAuth>(),
          googleSignIn: sl<GoogleSignIn>(),
        ),
  );

  final cacheManager = CacheManager();
  await cacheManager.initialize();
  sl.registerSingleton<CacheManager>(cacheManager);

  final pinnedDio =
      dio ??
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
    ..registerLazySingleton(() => GetProductDetail(sl()))
    ..registerLazySingleton<ProductDetailRepository>(
      () => ProductDetailRepositoryImpl(sl()),
    )
    ..registerLazySingleton<ProductDetailRemoteDatasource>(
      () => ProductDetailRemoteDataSrcImpl(sl()),
    )
    ..registerLazySingleton(() => GenerateAIProductDescription(sl()))
    ..registerLazySingleton<AIProductDescriptionRepository>(
      () => AIProductDescriptionRepositoryImpl(sl()),
    )
    ..registerLazySingleton<AIProductDescriptionRemoteDataSource>(
      () => AIProductDescriptionRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton(() {
      final service = GeminiService();
      service.initialize();
      return service;
    }, dispose: (service) => service.dispose())
    ..registerLazySingleton<FirebasePerformance>(
      () => FirebasePerformance.instance,
    )
    ..registerLazySingleton(
      () =>
          PerformanceMonitoringService(performance: sl<FirebasePerformance>()),
    )
    ..registerLazySingleton(() => GetExchangeRate(sl()))
    ..registerLazySingleton<CurrencyConverterRepository>(
      () => CurrencyConverterRepositoryImpl(sl()),
    )
    ..registerLazySingleton<CurrencyConverterRemoteDatasource>(
      () => CurrencyConverterRemoteDataSrcImpl(sl()),
    )
    ..registerLazySingleton(() => CurrencyConverterUtil(sl()))
    ..registerLazySingleton<Dio>(() => pinnedDio)
    ..registerLazySingleton<AppDeepLinkManager>(() => AppDeepLinkManager())
    ..registerLazySingleton<LocalAuthService>(
      () => LocalAuthService(LocalAuthentication()),
    )
    ..registerLazySingleton<DynamicIconService>(
      () => DynamicIconService(remoteConfigService: RemoteConfigService()),
    )
    ..registerLazySingleton<InAppReviewService>(() => InAppReviewService())
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)
    ..registerLazySingleton<FirestoreService>(
      () => FirestoreService(firestore: sl<FirebaseFirestore>()),
    )
    ..registerLazySingleton(() => SubmitFeedback(sl()))
    ..registerLazySingleton<FeedbackRepository>(
      () => FeedbackRepositoryImpl(sl()),
    )
    ..registerLazySingleton<FeedbackRemoteDatasource>(
      () => FeedbackRemoteDatasourceImpl(sl<FirestoreService>()),
    )
    ..registerLazySingleton<ChatRemoteDatasource>(
      () => ChatRemoteDatasourceImpl(sl<FirebaseFirestore>()),
    )
    ..registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(sl<ChatRemoteDatasource>()),
    )
    ..registerLazySingleton(() => WatchOtherUsers(sl<ChatRepository>()))
    ..registerLazySingleton(() => WatchChatMessages(sl<ChatRepository>()))
    ..registerLazySingleton(() => WatchMyChats(sl<ChatRepository>()))
    ..registerLazySingleton(() => SendChatMessage(sl<ChatRepository>()))
    ..registerLazySingleton(() => CreateChatUserDocument(sl<ChatRepository>()))
    ..registerLazySingleton(() => DeleteChatUserDocument(sl<ChatRepository>()));
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

        AppTourService.dismissTour();
        await rootNavigatorKey.currentContext!.router.replaceAll([
          const SslConnectionFailedRoute(),
        ]);
      }

      handler.next(dioError);
    },
  );
}

InterceptorsWrapper _authErrorInterceptor() => InterceptorsWrapper(
  onError: (DioException dioError, ErrorInterceptorHandler handler) async {
    final statusCode = dioError.response?.statusCode ?? 0;

    debugPrint('[AuthErrorInterceptor] status: $statusCode');

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
          await currentContext.router.replaceAll([LoginWithPhoneNumberRoute()]);
        } else {
          debugPrint('[AuthErrorInterceptor] No navigator context available');
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
    throw Exception(
      '[SSL Pinning] Missing certificate hash for: '
      '${AppConfig.appFlavor.name}',
    );
  }

  if (certificateHash.length != 64) {
    throw Exception(
      '[SSL Pinning] Certificate hash length is not 64 characters. '
      'Current length: ${certificateHash.length}',
    );
  }

  debugPrint('[SSL Pinning] Using SHA-256 certHash: "$certificateHash"');
  return certificateHash;
}
