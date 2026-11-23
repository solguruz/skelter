import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/home/bloc/home_event.dart';
import 'package:skelter/presentation/home/bloc/home_state.dart';
import 'package:skelter/presentation/home/domain/usecases/get_products.dart';
import 'package:skelter/services/performance_monitoring_service.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this._getProducts}) : super(HomeState.initial()) {
    _setupEventListener();
  }

  final SpeechToText _speech = SpeechToText();

  final GetProducts _getProducts;
  final PerformanceMonitoringService _performanceService = sl();

  void _setupEventListener() {
    on<BottomNavBarIndexChangedEvent>(_onBottomNavBarIndexChangedEvent);
    on<GetTopProductDataEvent>(_onGetTopProductDataEvent);
    on<FilterProductsEvent>(_onFilterProductsEvent);
    on<ToggleSpeechAnimationEvent>(_onToggleSpeechAnimationEvent);
    on<StartSpeechToTextEvent>(_onStartSpeechToTextEvent);
    on<StopSpeechToTextEvent>(_onStopSpeechToTextEvent);
    on<MicrophoneVoiceInputCompleteEvent>(_onMicrophoneVoiceInputCompleteEvent);
  }

  @override
  Future<void> close() {
    _speech.stop();
    _speech.cancel();
    return super.close();
  }

  void _onBottomNavBarIndexChangedEvent(
    BottomNavBarIndexChangedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(currentBottomNavIndex: event.index));
  }

  void _onGetTopProductDataEvent(
    GetTopProductDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    _performanceService.startTrace(kTraceApiGetProducts);
    emit(ProductLoadingState(state));

    final result = await _getProducts();

    result.fold(
      (failure) {
        _performanceService.putAttribute(
          kTraceApiGetProducts,
          kTraceAttrError,
          failure.errorMessage.truncate(100),
        );
        emit(AuthenticationError(state, errorMessage: failure.errorMessage));
      },
      (topProducts) {
        _performanceService.putAttribute(
          kTraceApiGetProducts,
          kTraceAttrSuccess,
          true,
        );
        emit(TopProductsLoadedState(state, topProducts: topProducts));
      },
    );

    _performanceService.stopTrace(kTraceApiGetProducts);
  }

  void _onFilterProductsEvent(
    FilterProductsEvent event,
    Emitter<HomeState> emit,
  ) {
    final filteredProducts = state.topProducts.where((product) {
      return product.title.trim().toLowerCase().contains(
        event.searchQuery.toLowerCase(),
      );
    }).toList();

    emit(
      state.copyWith(
        filteredProducts: filteredProducts,
        searchQuery: event.searchQuery,
      ),
    );
  }

  void _onToggleSpeechAnimationEvent(
    ToggleSpeechAnimationEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(shouldAnimateListenIcon: event.shouldAnimateListenIcon),
    );
  }

  Future<void> _onStartSpeechToTextEvent(
    StartSpeechToTextEvent event,
    Emitter<HomeState> emit,
  ) async {
    add(const ToggleSpeechAnimationEvent(shouldAnimateListenIcon: true));

    try {
      await _speech.initialize();
      await _speech.listen(
        listenOptions: SpeechListenOptions(
          cancelOnError: true,
          autoPunctuation: true,
          enableHapticFeedback: true,
        ),
        onResult: (result) {
          final filteredProducts = state.topProducts.where((product) {
            return product.title.trim().toLowerCase().contains(
              result.recognizedWords.trim().toLowerCase(),
            );
          }).toList();

          add(
            MicrophoneVoiceInputCompleteEvent(
              searchQuery: result.recognizedWords.trim(),
              filteredProducts: filteredProducts,
            ),
          );
        },
      );
    } catch (_) {
      add(const ToggleSpeechAnimationEvent(shouldAnimateListenIcon: false));
    }
  }

  void _onStopSpeechToTextEvent(
    StopSpeechToTextEvent event,
    Emitter<HomeState> emit,
  ) {
    if (_speech.isListening) {
      _speech.stop();
    }
    emit(state.copyWith(shouldAnimateListenIcon: false));
  }

  void _onMicrophoneVoiceInputCompleteEvent(
    MicrophoneVoiceInputCompleteEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      MicrophoneVoiceInputtedState(
        state,
        searchQuery: event.searchQuery,
        filteredProducts: event.filteredProducts,
      ),
    );
  }
}
