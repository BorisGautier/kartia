// ignore_for_file: avoid_print

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartia/blocobserver.dart';
import 'package:kartia/firebase_options.dart';
import 'package:kartia/src/app.dart';
import 'package:kartia/src/core/di/di.dart' as di;
import 'package:kartia/src/core/services/log.service.dart';
import 'package:kartia/src/modules/app/bloc/app_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await runZonedGuarded(
    () async {
      // Initialisation de tous les widgets
      WidgetsFlutterBinding.ensureInitialized();

      // Initialiser le service de logs
      await LogService().initialize();

      // Initialisation des variables d'environement
      await dotenv.load(fileName: ".env");
      // Initialisation des dependences via getIt
      await di.init();

      // Initialisation de Firebase
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      FirebasePerformance.instance;

      // Configuration de HydratedBloc pour la persistance de l'état
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: HydratedStorageDirectory(
          (await getTemporaryDirectory()).path,
        ),
      );
      // Configuration de l'observateur de BLoC
      Bloc.observer = SimpleBlocObserver();

      // Logger le démarrage de l'application
      LogService().info('Application démarrée');

      // Lancement de l'application
      runApp(
        BlocProvider(create: (_) => di.getIt<AppBloc>(), child: const MyApp()),
      );
    },
    (error, stackTrace) {
      // Enregistrement de l'erreur dans le service de logs
      LogService().error('runZonedGuarded: Caught error in my root zone.');
      LogService().error("Error", error, stackTrace);
      // Gestion des erreurs avec Firebase Crashlytics
      print('runZonedGuarded: Caught error in my root zone.');
      print(stackTrace);
      print(error);
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    },
  );
}
