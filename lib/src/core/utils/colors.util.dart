import 'package:flutter/material.dart';

/// Classe utilitaire contenant toutes les couleurs de l'application KartIA
class AppColors {
  AppColors._(); // Constructeur privé pour empêcher l'instanciation

  // Couleurs Primaires
  static const Color primary = Color(0xFF2D9CDB); // Bleu KartIA
  static const Color primaryOrange = Color(0xFFF2994A); // Orange KartIA
  static const Color primaryPurple = Color(0xFF9B51E0); // Violet KartIA
  static const int primaryValue =
      0xFF2D9CDB; // Valeur hexadécimale de la couleur primaire

  // Couleurs Secondaires
  static const Color secondary = Color(
    0xFFF2994A,
  ); // Orange comme couleur secondaire
  static const Color secondaryYellow = Color(0xFFF2C94C); // Jaune KartIA
  static const Color secondaryDarkBlue = Color(0xFF2F80ED); // Bleu foncé
  static const Color secondaryRedOrange = Color(0xFFEB5757); // Rouge-Orangé

  // Couleurs Neutres
  static const Color black = Color(0xFF1A1A1A);
  static const Color darkGrey = Color(0xFF4F4F4F);
  static const Color mediumGrey = Color(0xFF828282);
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Colors.transparent;

  // Couleurs d'état
  static const Color success = Color(0xFF27AE60); // Succès (vert)
  static const Color warning = Color(0xFFF2994A); // Avertissement (orange)
  static const Color error = Color(0xFFEB5757); // Erreur (rouge)
  static const Color info = Color(0xFF2D9CDB); // Information (bleu)

  // Ombres
  static const Color shadow1 = Color(0x33000000); // Ombre 20%
  static const Color shadow2 = Color(0x1E000000); // Ombre 12%
  static const Color shadow3 = Color(0x14000000); // Ombre 8%

  // Couleurs de fond
  static const Color lightBackground = Color(0xFFFCFCFC);
  static const Color darkBackground = Color(0xFF121212);

  // Couleurs par module
  static const Color civactModuleColor = primaryOrange;
  static const Color cityAiGuideModuleColor = primary;
  static const Color santeMapModuleColor = success;
  static const Color osmHelperModuleColor = primaryPurple;
  static const Color cartoPrixModuleColor = secondaryYellow;

  // Dégradés
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryOrange, primary],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondaryYellow, primaryPurple],
  );

  static const LinearGradient kartiaLogoGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondaryYellow, primaryOrange, primaryPurple, primary],
    stops: [0.0, 0.3, 0.7, 1.0],
  );

  // MaterialColor pour primarySwatch
  static const MaterialColor primarySwatch = MaterialColor(
    primaryValue,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF2D9CDB), // primary
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );

  // MaterialColor pour secondarySwatch
  static const MaterialColor secondarySwatch = MaterialColor(
    0xFFF2994A, // primaryOrange
    <int, Color>{
      50: Color(0xFFFFF3E0),
      100: Color(0xFFFFE0B2),
      200: Color(0xFFFFCC80),
      300: Color(0xFFFFB74D),
      400: Color(0xFFFFA726),
      500: Color(0xFFF2994A), // primaryOrange
      600: Color(0xFFFB8C00),
      700: Color(0xFFF57C00),
      800: Color(0xFFEF6C00),
      900: Color(0xFFE65100),
    },
  );
}
