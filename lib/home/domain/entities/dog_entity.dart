import 'package:isar/isar.dart';

part 'dog_entity.g.dart';

@collection
class DogEntity {
  final Id? id;
  final String? name;
  final String? photoUrl;
  final String? description;
  final int? age;

  DogEntity({
    this.id,
    this.name,
    this.photoUrl,
    this.description,
    this.age,
  });
}
