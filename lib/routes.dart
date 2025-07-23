import 'package:auto_route/auto_route.dart';
import 'package:flutter_skeleton/main.dart';
import 'package:flutter_skeleton/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter() : super(navigatorKey: rootNavigatorKey);

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => _getRoutes();

  List<AutoRoute> _getRoutes() {
    final AutoRoute initialRoute = CustomRoute(
      page: InitialRoute.page,
      initial: true,
      transitionsBuilder: TransitionsBuilders.noTransition,
      durationInMilliseconds: 2,
    );

    final List<AutoRoute> routes = [
      // Login
      LoginWithPhoneNumberRoute.page,
      PhoneNumberOTPRoute.page,
      LoginWithEmailPasswordRoute.page,
      ForgotPasswordV2Route.page,
      CheckYourEmailRoute.page,

      // Signup
      PhoneNumberVerifiedRoute.page,
      AddProfilePictureRoute.page,
      SignupWithEmailPasswordRoute.page,
      CreateYourPasswordRoute.page,
      VerifyEmailRoute.page,

      // Contact Us
      ContactUsRoute.page,
      ContactUsSubmittedRoute.page,

      // Chat
      ChatRoute.page,
      ChatConversationRoute.page,

      // Cart & Checkout
      AddAddressRoute.page,
      EditAddressRoute.page,
      AvailableCouponsRoute.page,

      // Notifications
      NotificationsRoute.page,

      // Empty widget screens
      WishlistRoute.page,
      ServerErrorRoute.page,
      NoInternetRoute.page,
      UnderMaintenanceRoute.page,
      MyOrdersRoute.page,
      SavedCardRoute.page,
      EmptyViewsRoute.page,
      //Image view
      NetworkImageRoute.page,

      //Settings
      SettingsRoute.page,

      //Delete Account
      DeleteAccountRoute.page,
      AccountDeleteSuccessRoute.page,
    ]
        .map(
          (page) => AutoRoute(
            page: page,
            path: '/${page.name}',
          ),
        )
        .toList();

    final List<AutoRoute> noTransitionRoutes = [
      LoginRoute.page,
      SignUpRoute.page,

      // Home page
      HomeRoute.page,
    ]
        .map(
          (page) => CustomRoute(
            page: page,
            transitionsBuilder: TransitionsBuilders.noTransition,
            durationInMilliseconds: 2,
          ),
        )
        .toList();

    // final List<AutoRoute> customRoutes = [
    //   CustomRoute(
    //     page: PostsFeedRoute.page,
    //     transitionsBuilder: TransitionsBuilders.noTransition,
    //     durationInMilliseconds: 500,
    //   ),
    // ];

    return [
      initialRoute,
      ...routes,
      ...noTransitionRoutes,
      // ...fullScreenRoutes,
      // ...customRoutes,
    ];
  }
}
