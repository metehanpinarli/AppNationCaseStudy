import 'package:app_nation_case_study/domain/entities/dog_entity.dart';
import 'package:dartz/dartz.dart';
import '../../entities/failure_model.dart';


abstract class IBreedsRepository {
  Future<Either<FailureModel, List<DogEntity>>> getDogList();

  Future<Either<FailureModel, String>> getDogeImage({required String breedName});
}
