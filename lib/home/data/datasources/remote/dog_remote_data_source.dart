import 'package:kf_sample/home/data/models/dog_dto.dart';

abstract class DogRemoteDataSource {
  Future<List<DogDto>> getDogs();
}
