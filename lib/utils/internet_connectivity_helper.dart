import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class InternetConnectivityHelper {
  factory InternetConnectivityHelper() => _instance;

  InternetConnectivityHelper._internal() {
    _initListener();
  }

  static final InternetConnectivityHelper _instance =
      InternetConnectivityHelper._internal();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

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

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
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

  void dispose() {
    _connectivitySubscription.cancel();
    _connectionNotifier.dispose();
    onConnectivityChange.dispose();
  }
}
