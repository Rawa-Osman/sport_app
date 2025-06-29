import 'package:get_it/get_it.dart';
import 'package:sport_app/core/network/dio_config.dart';
import 'package:sport_app/core/network/internet_checker.dart';
import 'package:sport_app/core/routes/go_router_config.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Registering singleton instances
  getIt.registerLazySingleton(() => GoRouterConfig());
  getIt.registerLazySingleton(() => DioConfig());
  getIt.registerLazySingleton(() => InternetChecker());
  
}
