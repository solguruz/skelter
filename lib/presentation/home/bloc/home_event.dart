import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton/presentation/home/domain/entities/product.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class BottomNavBarIndexChangedEvent extends HomeEvent {
  final int index;

  const BottomNavBarIndexChangedEvent({required this.index});

  @override
  List<Object> get props => [index];
}

class GetTopProductDataEvent extends HomeEvent {
  const GetTopProductDataEvent();

  @override
  List<Object> get props => [];
}

class FilterProductsEvent extends HomeEvent {
  final String searchQuery;

  const FilterProductsEvent({required this.searchQuery});

  @override
  List<Object> get props => [searchQuery];
}

class ToggleSpeechAnimationEvent extends HomeEvent {
  final bool shouldAnimateListenIcon;

  const ToggleSpeechAnimationEvent({required this.shouldAnimateListenIcon});

  @override
  List<Object> get props => [shouldAnimateListenIcon];
}

class StartSpeechToTextEvent extends HomeEvent {
  const StartSpeechToTextEvent();

  @override
  List<Object> get props => [];
}

class StopSpeechToTextEvent extends HomeEvent {
  const StopSpeechToTextEvent();

  @override
  List<Object> get props => [];
}

class MicrophoneVoiceInputCompleteEvent extends HomeEvent {
  final String searchQuery;
  final List<Product> filteredProducts;

  const MicrophoneVoiceInputCompleteEvent({
    required this.filteredProducts,
    required this.searchQuery,
  });

  @override
  List<Object> get props => [searchQuery, filteredProducts];
}
