import 'package:auto_route/auto_route.dart';
import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:skelter/routes.gr.dart';

/// Observes all route changes and reports the current screen to Clarity.
/// Tracks all screens by default and
/// skips routes defined in [_defaultExcludedRoutes].
class ClarityRouteObserver extends AutoRouterObserver {
  ///Routes to exclude from tracking
  static const List<Type> _defaultExcludedRouteTypes = <Type>[
    InitialRoute,
    NoInternetRoute,
    UnderMaintenanceRoute,
    ForceUpdateRoute,
    SslConnectionFailedRoute,
    LoginWithPhoneNumberRoute,
  ];

  /// Excluded route names (strings)
  late final Set<String> _excludedRouteNames = <String>{
    for (final Type routeType in _defaultExcludedRouteTypes)
      routeType.toString(),
  };

  ClarityRouteObserver({List<Type>? additionalExcludedRoutes}) {
    if (additionalExcludedRoutes != null) {
      _excludedRouteNames.addAll(
        additionalExcludedRoutes.map((Type routeType) => routeType.toString()),
      );
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _trackRoute(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) {
      _trackRoute(previousRoute);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _trackRoute(newRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) {
      _trackRoute(previousRoute);
    }
  }

  /// Tracks the given route with Clarity if it is not excluded
  void _trackRoute(Route<dynamic>? route) {
    if (route == null) return;
    if (route.settings is! AutoRoutePage<Object?>) return;

    final AutoRoutePage<Object?> autoRoutePage =
        route.settings as AutoRoutePage<Object?>;

    final String routeName = autoRoutePage.routeData.name;

    // Skip excluded routes
    if (_excludedRouteNames.contains(routeName)) {
      debugPrint('[ClarityRouteObserver] Skipped route: $routeName');
      return;
    }

    // Derive actual screen name from the widget
    final String screenName = autoRoutePage.child.runtimeType.toString();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bool isSetScreenName = Clarity.setCurrentScreenName(screenName);
      debugPrint(
        '[ClarityRouteObserver] Tracked screen: $screenName '
        '(set=$isSetScreenName)',
      );
    });
  }
}
