import 'package:equatable/equatable.dart';
import 'package:kf_sample/home/domain/entities/dog_entity.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchDogsEvent extends HomeEvent {
  const FetchDogsEvent();
  @override
  List<Object> get props => [];
}

class SaveDogsEvent extends HomeEvent {
  final List<DogEntity> dogs;

  const SaveDogsEvent({required this.dogs});

  @override
  List<Object> get props => [dogs];
}

class LoadDogsEvent extends HomeEvent {
  const LoadDogsEvent();

  @override
  List<Object> get props => [];
}

class LoadedDogsEvent extends HomeEvent {
  final List<DogEntity> dogs;

  const LoadedDogsEvent({required this.dogs});

  @override
  List<Object> get props => [dogs];
}

class ErrorEvent extends HomeEvent {
  final String? errorMessage;

  const ErrorEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
