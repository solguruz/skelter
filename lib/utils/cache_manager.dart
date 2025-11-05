import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:http_cache_file_store/http_cache_file_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skelter/constants/constants.dart';

class CacheManager {
  late final CacheOptions _defaultCacheOptions;
  late final String _cacheDirectoryPath;

  Future<void> initialize() async {
    final directory = await getApplicationSupportDirectory();
    _cacheDirectoryPath = '${directory.path}/$kApiCache';
    debugPrint('Cache directory: $_cacheDirectoryPath');

    final store = FileCacheStore(_cacheDirectoryPath);
    _defaultCacheOptions = CacheOptions(
      store: store,
      policy: CachePolicy.forceCache,
      maxStale: const Duration(hours: 1),
      // hitCacheOnErrorCodes: [304], // Enable Smart Cache: Returns cached data
      // when the server responds with 304 (Not Modified).
      // This leverages backend conditional requests.
    );
  }

  void attachCacheInterceptor(Dio dio) {
    dio.interceptors.add(DioCacheInterceptor(options: _defaultCacheOptions));
  }

  CacheOptions get defaultCacheOptions => _defaultCacheOptions;

  CacheOptions noCacheOptions() {
    return _defaultCacheOptions.copyWith(policy: CachePolicy.noCache);
  }

  CacheOptions customCacheOptions({
    CachePolicy? policy,
    CachePriority? priority,
    Duration? maxStale,
  }) {
    return _defaultCacheOptions.copyWith(
      policy: policy ?? _defaultCacheOptions.policy,
      priority: priority ?? _defaultCacheOptions.priority,
      maxStale: maxStale ?? _defaultCacheOptions.maxStale,
    );
  }

  Future<void> clearCachedApiResponse() async {
    try {
      await _defaultCacheOptions.store?.clean();
      debugPrint('Cache store cleaned successfully!');

      final cacheDirectory = Directory(_cacheDirectoryPath);
      if (await cacheDirectory.exists()) {
        await cacheDirectory.delete(recursive: true);
        debugPrint(
          'Cache directory at $_cacheDirectoryPath deleted successfully!',
        );
      }
    } catch (e, stackTrace) {
      debugPrint('Error clearing cache: $e\n$stackTrace');
    }
  }
}
