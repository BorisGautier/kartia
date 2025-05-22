import 'package:kartia/src/core/database/db.dart';
import 'package:kartia/src/core/helpers/network.helper.dart';
import 'package:kartia/src/core/helpers/sharedpreferences.helper.dart';
import 'package:kartia/src/core/services/log.service.dart';
import 'package:kartia/src/modules/app/bloc/app_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kartia/src/modules/splash/bloc/splash_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  //Utils
  // Enregistrement des instances des différents helpers
  getIt.registerLazySingleton<NetworkInfoHelper>(() => NetworkInfoHelper());
  getIt.registerLazySingleton<SharedPreferencesHelper>(
    () => SharedPreferencesHelper(),
  );
  getIt.registerLazySingleton<LogService>(() => LogService());

  // Database
  // Enregistrement des instances des DAO pour accéder à la base de données
  getIt.registerLazySingleton<MyDatabase>(() => MyDatabase());

  //Bloc
  // Enregistrement des instances des différents blocs
  getIt.registerFactory<AppBloc>(() => AppBloc(logger: getIt()));
  getIt.registerFactory<SplashBloc>(() => SplashBloc());
}
