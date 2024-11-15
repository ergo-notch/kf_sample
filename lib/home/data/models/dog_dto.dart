import 'package:equatable/equatable.dart';
import 'package:kf_sample/core/convertible.dart';
import 'package:kf_sample/home/domain/entities/dog_entity.dart';

class DogDto extends Equatable with EntityConvertible<DogDto, DogEntity> {
  final String? name;
  final String? description;
  final int? age;
  final String? photoUrl;

  DogDto({this.name, this.description, this.age, this.photoUrl});

  factory DogDto.fromJson(Map<String, dynamic> json) {
    return DogDto(
      name: json['dogName'],
      description: json['description'],
      age: json['age'],
      photoUrl: json['image'],
    );
  }

  @override
  List<Object?> get props => [name, description, age, photoUrl];

  @override
  DogEntity toEntity() => DogEntity(
        name: name,
        description: description,
        age: age,
        photoUrl: photoUrl,
      );
}
