import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class InternetConnectivityUtil {
  factory InternetConnectivityUtil() => _instance;

  InternetConnectivityUtil._internal() {
    _initListener();
  }

  static final InternetConnectivityUtil _instance =
      InternetConnectivityUtil._internal();

  final Connectivity _connectivity = Connectivity();

  final ValueNotifier<bool> _connectionNotifier = ValueNotifier<bool>(true);

  ValueNotifier<bool> get onConnectivityChange => _connectionNotifier;

  Future<bool> isConnected() async {
    final List<ConnectivityResult> connectivityResult =
        await _connectivity.checkConnectivity();
    final bool isConnected =
        !connectivityResult.contains(ConnectivityResult.none);
    return isConnected;
  }

  void _initListener() async {
    final bool initialConnected = await isConnected();
    _connectionNotifier.value = initialConnected;

    _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) {
        final bool isConnected = !results.contains(ConnectivityResult.none);
        if (_connectionNotifier.value != isConnected) {
          _connectionNotifier.value = isConnected;
          if (!isConnected) {
            debugPrint('Connectivity changed: Internet is OFF!');
          } else {
            debugPrint('Connectivity changed: Internet is ON!');
          }
        }
      },
    );
  }
}
