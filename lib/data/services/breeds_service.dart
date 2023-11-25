import 'package:app_nation_case_study/data/constants/api_constants.dart';
import 'package:app_nation_case_study/data/models/breed_image_response_model.dart';
import 'package:app_nation_case_study/data/models/breeds_response_model.dart';
import 'package:app_nation_case_study/data/services/base_service.dart';

class BreedsService extends BaseService {
  BreedsService() : super();

  Future<BreedsResponseModel> getBreeds() async {
    final response = await request(path: ApiConstants.breeds, httpMethod: Method.get);
    return BreedsResponseModel.fromJson(response.data);
  }

  Future<BreedImageResponseModel> getBreedImages(String breedName) async {
    final response = await request(path: ApiConstants.breedImages(breedName), httpMethod: Method.get);
    return BreedImageResponseModel.fromJson(response.data);
  }
}
