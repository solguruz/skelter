import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/presentation/subscription/model/subscription_package_model.dart';

class SubscriptionService {
  static const String subscriptionEntitlement = 'Skelter Pro';

  factory SubscriptionService() => _instance;

  SubscriptionService._internal() {
    _init();
  }

  static final _instance = SubscriptionService._internal();

  final ValueNotifier<bool> isUserSubscribed = ValueNotifier<bool>(false);
  late AppLocalizations _localization;

  final Map<String, Package> _packageMap = {};
  bool _isPurchaseConfigured = false;

  void setLocalization(AppLocalizations localization) {
    _localization = localization;
  }

  Future<void> _init() async {
    await _initPurchasesConfiguration();
    await _checkSubscriptionStatus();
    Purchases.addCustomerInfoUpdateListener(_updateSubscriptionStatus);
  }

  /// Initialize RevenueCat purchases configuration (called only once)
  Future<void> _initPurchasesConfiguration() async {
    if (_isPurchaseConfigured) {
      debugPrint('Purchase configuration already initialized, skipping...');
      return;
    }

    try {
      await Purchases.setLogLevel(LogLevel.debug);
      // Note: Release builds require a separate RevenueCat API key.
      // Ensure the release API key is configured before app publishing.
      final revenueCatApiKey = kReleaseMode
          ? dotenv.env[revenueCatGoogleReleaseApiKey]
          : dotenv.env[revenueCatGoogleApiKey];
      if (revenueCatApiKey == null || revenueCatApiKey.isEmpty) {
        debugPrint('RevenueCat API key is missing!');
        return;
      }
      await Purchases.configure(PurchasesConfiguration(revenueCatApiKey));
      _isPurchaseConfigured = true;
      debugPrint('Purchase configuration initialized successfully');
    } catch (e) {
      debugPrint('Error initializing purchase configuration: $e');
      rethrow;
    }
  }

  Future<void> _checkSubscriptionStatus() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      _updateSubscriptionStatus(customerInfo);
    } on PlatformException catch (e) {
      isUserSubscribed.value = false;
      debugPrint('Error fetching subscription status: $e');
    }
  }

  Future<List<SubscriptionPackageModel>> getPackages() async {
    try {
      final offerings = await Purchases.getOfferings();
      final availablePackages = offerings.current?.availablePackages ?? [];

      _packageMap.clear();
      return availablePackages.map((package) {
        final model = _convertToModel(package);
        _packageMap[model.identifier] = package;
        return model;
      }).toList();
    } on PlatformException catch (e) {
      debugPrint('Error fetching offerings: $e');
      rethrow;
    }
  }

  SubscriptionPackageModel _convertToModel(Package package) {
    final product = package.storeProduct;
    return SubscriptionPackageModel(
      identifier: product.identifier,
      price: product.priceString,
      title: product.title,
      description: product.description,
    );
  }

  Future<bool> restorePurchases() async {
    final customerInfo = await Purchases.restorePurchases();
    _updateSubscriptionStatus(customerInfo);
    return isUserSubscribed.value;
  }

  Future<bool> purchasePackage(
    SubscriptionPackageModel packageModel, {
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    final package = _packageMap[packageModel.identifier];
    if (package == null) {
      onError(_localization.something_went_wrong);
      return false;
    }

    try {
      await Purchases.purchasePackage(package);
      return true;
    } on PurchasesError catch (e, stack) {
      _handlePurchaseError(e, onError, stackTrace: stack);
      return false;
    } on PlatformException catch (e, stack) {
      debugPrint('Platform exception during purchase: $e');
      final message = e.message ?? _localization.something_went_wrong;
      onError(message, stackTrace: stack);
      return false;
    } on Exception catch (e, stack) {
      debugPrint('Unexpected exception during purchase: $e');
      final errorMsg = _localization.something_went_wrong;
      onError(errorMsg, stackTrace: stack);
      return false;
    }
  }

  Future<String?> getUserManagementUrl() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      return customerInfo.managementURL;
    } catch (e) {
      debugPrint('Error getting management URL: $e');
      return null;
    }
  }

  void _updateSubscriptionStatus(CustomerInfo customerInfo) {
    isUserSubscribed.value = customerInfo.entitlements.active.containsKey(
      subscriptionEntitlement,
    );
    debugPrint('Subscription status updated: ${isUserSubscribed.value}');
  }

  void _handlePurchaseError(
    PurchasesError e,
    Function(String, {StackTrace? stackTrace}) onError, {
    StackTrace? stackTrace,
  }) {
    final errorMessage = switch (e.code) {
      PurchasesErrorCode.storeProblemError =>
        _localization.store_login_required,
      PurchasesErrorCode.purchaseCancelledError =>
        _localization.purchase_cancelled,
      PurchasesErrorCode.networkError => _localization.no_internet_connection,
      PurchasesErrorCode.productAlreadyPurchasedError =>
        _localization.already_subscribed,
      PurchasesErrorCode.receiptAlreadyInUseError =>
        _localization.receipt_already_in_use,
      _ => _localization.something_went_wrong,
    };

    debugPrint('Purchase error: ${e.code} - $errorMessage');
    onError(errorMessage, stackTrace: stackTrace);
  }
}
