import 'dart:developer';

import 'package:app_nation_case_study/data/models/breeds_response_model.dart';
import 'package:app_nation_case_study/data/models/failure_model.dart';
import 'package:app_nation_case_study/repository/base_repository.dart';
import 'package:app_nation_case_study/repository/breends/i_breends_repository.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/breed_image_response_model.dart';
import '../../data/services/breeds_service.dart';

class BreedsRepository extends BaseRepository implements IBreedsRepository {
  BreedsRepository(
    this._breedsService,
  );

  final BreedsService _breedsService;

  @override
  Future<Either<FailureModel, BreedsResponseModel>> getBreeds() {
    Future<BreedsResponseModel> getBreedsFunc() async {
      final result = await _breedsService.getBreeds();
      log(result.toString());
      return result;
    }

    return serviceResponseHandler<BreedsResponseModel>(getBreedsFunc);
  }

  @override
  Future<Either<FailureModel, BreedImageResponseModel>> getBreedsImages({required String breedName}) {
    Future<BreedImageResponseModel> getBreedsImagesFunc() async {
      final result = await _breedsService.getBreedImages(breedName);
      log(result.toString());
      return result;
    }

    return serviceResponseHandler<BreedImageResponseModel>(getBreedsImagesFunc);
  }
}
