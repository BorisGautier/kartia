// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_gemini_demo/src/splash.screen.dart';

class InitPage extends StatelessWidget {
  // Constructeur de la classe InitPage
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Utilisation d'un BlocBuilder pour écouter les changements d'état du AuthBloc
    // Par défaut, afficher l'écran de chargement
    return const SplashScreen();
  }
}
