import 'package:dartz/dartz.dart';
import '../../entities/dog_entity.dart';
import '../../entities/failure_model.dart';
import '../../../data/services/breeds_service.dart';
import '../base_repository.dart';
import 'i_breends_repository.dart';

class BreedsRepository extends BaseRepository implements IBreedsRepository {
  BreedsRepository(
    this._breedsService,
  );

  final BreedsService _breedsService;

  @override
  Future<Either<FailureModel, List<DogEntity>>> getDogList() {
    Future<List<DogEntity>> getBreedsFunc() async {
      final result = await _breedsService.getBreeds();
      List<DogEntity> list = [];

      result.message.forEach((key, value) {
        final result = DogEntity(breed: key, subBreeds: value, imageUrl: "");
        list.add(result);
      });

      return list;
    }

    return serviceResponseHandler<List<DogEntity>>(getBreedsFunc);
  }

  @override
  Future<Either<FailureModel, String>> getDogeImage({required String breedName}) {
    Future<String> getBreedsImagesFunc() async {
      final result = await _breedsService.getBreedImages(breedName);
      return result.message;
    }

    return serviceResponseHandler<String>(getBreedsImagesFunc);
  }
}
