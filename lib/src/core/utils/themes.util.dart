import 'package:flutter/material.dart';
import 'package:flutter_gemini_demo/src/core/utils/colors.util.dart';
import 'package:flutter_gemini_demo/src/core/utils/sizes.util.dart';

class AppThemes {
  // Définit les styles de texte partagés entre les thèmes clair et foncé
  static const _textTheme = TextTheme(
    bodyLarge: TextStyle(fontFamily: "OpenSans-Bold", fontSize: textSizeLarge),
    bodyMedium: TextStyle(fontFamily: "OpenSans", fontSize: textSizeMedium),
    bodySmall: TextStyle(fontFamily: "OpenSans", fontSize: textSizeSmall),
  );

  // Définit les objets ThemeData pour les thèmes clair et foncé
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: whiteColor,
        foregroundColor: whiteColor,
        shadowColor: whiteColor,
        surfaceTintColor: whiteColor,
        elevation: 0,
        iconTheme: IconThemeData(color: blackColor),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        outlineBorder: BorderSide.none,
        hintStyle: TextStyle(color: blackColor),
      ),
      scaffoldBackgroundColor: whiteColor,
      primaryColor: primaryColor,
      canvasColor: whiteColor,
      primaryIconTheme: const IconThemeData(color: blackColor),
      // Utilise les styles de texte partagés et définit les couleurs de texte
      textTheme: _textTheme.copyWith(
        bodyLarge: _textTheme.bodyLarge?.copyWith(color: blackColor),
        bodyMedium: _textTheme.bodyMedium?.copyWith(color: blackColor),
        bodySmall: _textTheme.bodySmall?.copyWith(color: blackColor),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: accentColor,
      ),
      // Définit le schéma de couleurs pour le thème clair
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: accentColor,
      ).copyWith(surface: whiteColor),
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: blackColor,
      primaryColor: primaryDarkColor,
      canvasColor: blackColor,
      primaryIconTheme: const IconThemeData(color: whiteColor),
      // Utilise les styles de texte partagés et définit les couleurs de texte
      textTheme: _textTheme.copyWith(
        bodyLarge: _textTheme.bodyLarge?.copyWith(color: whiteColor),
        bodyMedium: _textTheme.bodyMedium?.copyWith(color: whiteColor),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: accentColor,
      ),
      // Définit le schéma de couleurs pour le thème foncé
      colorScheme: const ColorScheme.light(
        primary: primaryDarkColor,
        secondary: accentColor,
      ).copyWith(surface: blackColor),
    ),
  };
}

// Énumération pour représenter les deux thèmes disponibles
enum AppTheme { lightTheme, darkTheme }
