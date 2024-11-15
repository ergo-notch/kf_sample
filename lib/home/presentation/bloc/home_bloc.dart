import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kf_sample/core/use_case.dart';
import 'package:kf_sample/home/domain/use_cases/fetch_dogs_use_case.dart';
import 'package:kf_sample/home/domain/use_cases/load_dogs_use_case.dart';
import 'package:kf_sample/home/domain/use_cases/save_dogs_use_case.dart';
import 'package:kf_sample/home/presentation/bloc/home_events.dart';
import 'package:kf_sample/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SaveDogsUseCase saveDogsUseCase;
  final FetchDogsUseCase fetchDogsUseCase;
  final LoadDogsUseCase loadDogsUseCase;

  HomeBloc(
      {required this.saveDogsUseCase,
      required this.fetchDogsUseCase,
      required this.loadDogsUseCase})
      : super(HomeState()) {
    on<FetchDogsEvent>(_fetchingDogsEvent);
    on<SaveDogsEvent>(_saveDogsEvent);
    on<LoadDogsEvent>(_loadDogsEvent);
    on<LoadedDogsEvent>(_loadedDogsEvent);
    on<ErrorEvent>(_errorEvent);
  }

  Future<void> _fetchingDogsEvent(FetchDogsEvent event, emit) async {
    emit(state.copyWith(status: HomeStatus.fetching));
    final result = await fetchDogsUseCase.call(NoParams());
    result.fold((failure) => add(ErrorEvent(errorMessage: failure.message)),
        (success) => add(SaveDogsEvent(dogs: success)));
  }

  Future<void> _saveDogsEvent(SaveDogsEvent event, emit) async {
    final result = await saveDogsUseCase.call(event.dogs);
    result.fold((failure) => add(ErrorEvent(errorMessage: failure.message)),
        (success) => add(LoadDogsEvent()));
  }

  Future<void> _loadDogsEvent(LoadDogsEvent event, emit) async {
    final result = await loadDogsUseCase.call(NoParams());
    result.fold(
        (failure) => emit(ErrorEvent(errorMessage: failure.message)),

        /// if local db is empty... Fetch dogs from network
        (success) => success.isEmpty
            ? add(const FetchDogsEvent())
            : add(LoadedDogsEvent(dogs: success)));
  }

  void _loadedDogsEvent(LoadedDogsEvent event, emit) {
    emit(state.copyWith(status: HomeStatus.loaded, dogs: event.dogs));
  }

  void _errorEvent(ErrorEvent event, emit) {
    emit(state.copyWith(
        status: HomeStatus.error, errorMessage: event.errorMessage));
  }
}
