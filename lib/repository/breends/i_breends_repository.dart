import 'package:app_nation_case_study/data/models/breeds_response_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/breed_image_response_model.dart';
import '../../data/models/failure_model.dart';

abstract class IBreedsRepository {
  Future<Either<FailureModel, BreedsResponseModel>> getBreeds();

  Future<Either<FailureModel, BreedImageResponseModel>> getBreedsImages({required String breedName});
}
