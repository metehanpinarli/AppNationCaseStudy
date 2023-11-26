import 'package:app_nation_case_study/data/services/breeds_service.dart';
import 'package:get_it/get_it.dart';
import 'domain/bloc/dialog/dialog_bloc.dart';
import 'domain/bloc/home/home_bloc.dart';
import 'domain/bloc/Settings/settings_bloc.dart';
import 'domain/manager/platform_info_manager.dart';
import 'domain/repository/breends/breeds_repository.dart';
import 'domain/repository/breends/i_breends_repository.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
   // Services
  locator.registerLazySingleton<BreedsService>(() => BreedsService());

  // Repositories
  final breedsRepository = BreedsRepository(locator<BreedsService>());

  // Interfaces Repositories
  locator.registerLazySingleton<IBreedsRepository>(() => breedsRepository);

  //Managers
  locator.registerLazySingleton<PlatformInfoManager>(() => PlatformInfoManager());

  //Blocs
  locator.registerFactory<HomeBloc>(() => HomeBloc(locator<IBreedsRepository>()));
  locator.registerFactory<DialogBloc>(() => DialogBloc(locator<IBreedsRepository>()));
  locator.registerFactory<SettingsBloc>(() => SettingsBloc(locator<PlatformInfoManager>()));
}
