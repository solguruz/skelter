import 'package:auto_route/auto_route.dart';
import 'package:skelter/main.dart';
import 'package:skelter/routes.gr.dart';

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
      duration: const Duration(milliseconds: 2),
    );

    final List<AutoRoute> routes = [
      // Login
      LoginWithPhoneNumberRoute.page,
      PhoneNumberOTPRoute.page,
      LoginWithEmailPasswordRoute.page,
      ForgotPasswordRoute.page,
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

      // Feedback
      FeedbackRoute.page,

      // Chat
      ChatRoute.page,
      ChatConversationRoute.page,

      // Cart & Checkout
      AddAddressRoute.page,
      EditAddressRoute.page,
      AvailableCouponsRoute.page,
      InvoicePreviewRoute.page,

      // Notifications
      NotificationsRoute.page,

      OrderDetailRoute.page,

      // Product Detail
      ProductDetailRoute.page,

      // Empty widget screens
      WishlistRoute.page,
      ServerErrorRoute.page,
      NoInternetRoute.page,
      UnderMaintenanceRoute.page,
      MyOrdersRoute.page,
      EmptyOrdersViewRoute.page,
      EmptySavedCardRoute.page,
      EmptyViewsRoute.page,
      ReminderRoute.page,

      //Image view
      NetworkImageRoute.page,

      //Settings
      SettingsRoute.page,

      // Subscription
      SubscriptionRoute.page,
      ManageSubscriptionRoute.page,
      //Delete Account
      DeleteAccountRoute.page,
      AccountDeleteSuccessRoute.page,

      //Force Update
      ForceUpdateRoute.page,

      //SSL Connection Failed
      SslConnectionFailedRoute.page,

      //Change Theme
      ChangeThemeRoute.page,

      // Biometrics authentication
      BiometricAuthRoute.page,
    ].map((page) => AutoRoute(page: page, path: '/${page.name}')).toList();

    final List<AutoRoute> noTransitionRoutes =
        [
              // Home page
              HomeRoute.page,
            ]
            .map(
              (page) => CustomRoute(
                page: page,
                transitionsBuilder: TransitionsBuilders.noTransition,
                duration: const Duration(milliseconds: 2),
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
