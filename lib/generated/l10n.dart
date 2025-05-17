// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class FlutterGeminiLocalizations {
  FlutterGeminiLocalizations();

  static FlutterGeminiLocalizations? _current;

  static FlutterGeminiLocalizations get current {
    assert(
      _current != null,
      'No instance of FlutterGeminiLocalizations was loaded. Try to initialize the FlutterGeminiLocalizations delegate before accessing FlutterGeminiLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<FlutterGeminiLocalizations> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = FlutterGeminiLocalizations();
      FlutterGeminiLocalizations._current = instance;

      return instance;
    });
  }

  static FlutterGeminiLocalizations of(BuildContext context) {
    final instance = FlutterGeminiLocalizations.maybeOf(context);
    assert(
      instance != null,
      'No instance of FlutterGeminiLocalizations present in the widget tree. Did you add FlutterGeminiLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static FlutterGeminiLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<FlutterGeminiLocalizations>(
      context,
      FlutterGeminiLocalizations,
    );
  }

  /// `Gemini Demo`
  String get appname {
    return Intl.message('Gemini Demo', name: 'appname', desc: '', args: []);
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<FlutterGeminiLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<FlutterGeminiLocalizations> load(Locale locale) =>
      FlutterGeminiLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
