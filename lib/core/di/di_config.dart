import 'package:get_it/get_it.dart';
import 'package:sport_app/core/network/dio_config.dart';
import 'package:sport_app/core/network/internet_checker.dart';
import 'package:sport_app/core/routes/go_router_config.dart';
import 'package:sport_app/features/home/data/home_provider/home_provider.dart';
import 'package:sport_app/features/home/data/repo/home_repo.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Registering singleton instances
  getIt.registerLazySingleton(() => GoRouterConfig());
  getIt.registerLazySingleton(() => DioConfig());
  getIt.registerLazySingleton(() => InternetChecker());
  
  getIt.registerLazySingleton(() => HomeProvider());
  getIt.registerLazySingleton(() => HomeRepo(provider: getIt<HomeProvider>()));
  // getIt.registerLazySingleton(() => HomeBloc( getIt<HomeRepo>()));

}
