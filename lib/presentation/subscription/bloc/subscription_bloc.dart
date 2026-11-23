import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_event.dart';
import 'package:skelter/presentation/subscription/bloc/subscription_state.dart';
import 'package:skelter/services/performance_monitoring_service.dart';
import 'package:skelter/services/subscription_service.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  final AppLocalizations _localization;
  final SubscriptionService _subscriptionService;
  final PerformanceMonitoringService _performanceService = sl();

  SubscriptionBloc({
    required this._localization,
    required this._subscriptionService,
  }) : super(FetchSubscriptionPlanLoadingState()) {
    on<FetchSubscriptionPackagesEvent>(_onFetchSubscriptionPackagesEvent);
    on<PurchaseSubscriptionEvent>(_onPurchaseSubscriptionEvent);
    on<SelectSubscriptionPlanEvent>(_onSelectSubscriptionPlanEvent);
    on<RestoreSubscriptionEvent>(_onRestoreSubscriptionEvent);
    on<ClearSnackBarMessageEvent>(_onClearSnackBarMessageEvent);
  }

  Future<void> _onFetchSubscriptionPackagesEvent(
    FetchSubscriptionPackagesEvent event,
    Emitter<SubscriptionState> emit,
  ) async {
    _performanceService.startTrace(kTraceFetchSubscriptionPackages);
    emit(FetchSubscriptionPlanLoadingState());

    try {
      final availablePackages = await _subscriptionService.getPackages();

      if (availablePackages.isEmpty) {
        _performanceService.putAttribute(
          kTraceFetchSubscriptionPackages,
          kTraceAttrError,
          'no_packages_available',
        );
        emit(
          FetchSubscriptionPlanFailureState(
            state,
            error: _localization.no_subscription_available,
          ),
        );
        return;
      }

      final selectedPackage = availablePackages.firstWhere(
        (pkg) => pkg.identifier == revenueCatMonthly,
      );

      _performanceService.putAttribute(
        kTraceFetchSubscriptionPackages,
        kTraceAttrSuccess,
        true,
      );
      emit(
        FetchSubscriptionPlanLoadedState(
          state.copyWith(
            packages: availablePackages,
            selectedPackage: selectedPackage,
            isLoadingPackages: false,
          ),
        ),
      );
    } on Exception catch (e) {
      _performanceService.putAttribute(
        kTraceFetchSubscriptionPackages,
        kTraceAttrError,
        e.toString().truncate(100),
      );
      emit(
        FetchSubscriptionPlanFailureState(
          state,
          error: _localization.failed_to_load_subscriptions,
        ),
      );
    } finally {
      _performanceService.stopTrace(kTraceFetchSubscriptionPackages);
    }
  }

  Future<void> _onPurchaseSubscriptionEvent(
    PurchaseSubscriptionEvent event,
    Emitter<SubscriptionState> emit,
  ) async {
    _performanceService.startTrace(kTracePurchaseSubscription);
    emit(SubscriptionPaymentProcessingState(state));

    final success = await _subscriptionService.purchasePackage(
      event.package,
      onError: (errorMessage, {stackTrace}) {
        _performanceService.putAttribute(
          kTracePurchaseSubscription,
          kTraceAttrError,
          errorMessage.truncate(100),
        );
        emit(SubscriptionPaymentFailureState(state, error: errorMessage));
      },
    );

    if (success) {
      _performanceService.putAttribute(
        kTracePurchaseSubscription,
        kTraceAttrSuccess,
        true,
      );
      emit(SubscriptionPaymentSuccessState(state));
    }
    _performanceService.stopTrace(kTracePurchaseSubscription);
  }

  Future<void> _onSelectSubscriptionPlanEvent(
    SelectSubscriptionPlanEvent event,
    Emitter<SubscriptionState> emit,
  ) async {
    emit(
      FetchSubscriptionPlanLoadedState(
        state.copyWith(
          packages: event.packages,
          selectedPackage: event.selectedPackage,
        ),
      ),
    );
  }

  Future<void> _onRestoreSubscriptionEvent(
    RestoreSubscriptionEvent event,
    Emitter<SubscriptionState> emit,
  ) async {
    _performanceService.startTrace(kTraceRestoreSubscription);
    emit(FetchSubscriptionPlanLoadedState(state.copyWith(isRestoring: true)));

    try {
      final isRestored = await _subscriptionService.restorePurchases();
      final message = isRestored
          ? _localization.restore_success
          : _localization.no_active_subscriptions;

      _performanceService.putAttribute(
        kTraceRestoreSubscription,
        kTraceAttrSuccess,
        isRestored,
      );
      emit(
        FetchSubscriptionPlanLoadedState(
          state.copyWith(isRestoring: false, restoreStatusMessage: message),
        ),
      );
    } on PlatformException catch (e) {
      _performanceService.putAttribute(
        kTraceRestoreSubscription,
        kTraceAttrError,
        (e.message ?? e.toString()).truncate(100),
      );
      emit(
        FetchSubscriptionPlanLoadedState(
          state.copyWith(
            isRestoring: false,
            restoreStatusMessage: '${_localization.restore_error} ${e.message}',
          ),
        ),
      );
    } finally {
      _performanceService.stopTrace(kTraceRestoreSubscription);
    }
  }

  void _onClearSnackBarMessageEvent(
    ClearSnackBarMessageEvent event,
    Emitter<SubscriptionState> emit,
  ) {
    emit(FetchSubscriptionPlanLoadedState(state.copyWith(clearSnackBar: true)));
  }
}
