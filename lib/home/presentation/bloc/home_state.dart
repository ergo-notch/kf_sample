import 'package:kf_sample/home/domain/entities/dog_entity.dart';

enum HomeStatus { initial, fetching, loaded, error }

class HomeState {
  final List<DogEntity> dogs;
  final HomeStatus status;
  final String? errorMessage;

  HomeState(
      {this.dogs = const [],
      this.status = HomeStatus.initial,
      this.errorMessage});

  HomeState copyWith(
      {List<DogEntity>? dogs, HomeStatus? status, String? errorMessage}) {
    return HomeState(
        dogs: dogs ?? this.dogs,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
