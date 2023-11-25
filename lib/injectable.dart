import 'package:app_nation_case_study/data/services/breeds_service.dart';
import 'package:app_nation_case_study/repository/breends/breeds_repository.dart';
import 'package:app_nation_case_study/repository/breends/i_breends_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
// Services
  locator.registerLazySingleton<BreedsService>(() => BreedsService());

  // Repositories
  final breedsRepository = BreedsRepository(locator<BreedsService>());

  // Interfaces Repositories
  locator.registerLazySingleton<IBreedsRepository>(() => breedsRepository);

  // Blocs
  // getIt.registerFactory(() => BreedsBloc(getIt()));
}
