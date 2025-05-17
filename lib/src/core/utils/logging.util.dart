import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class GraylogOutput extends LogOutput {
  final String graylogUrl;
  final String source;
  final Map<String, dynamic> additionalFields;

  GraylogOutput({
    required this.graylogUrl,
    required this.source,
    this.additionalFields = const {},
  });

  @override
  void output(OutputEvent event) async {
    for (final line in event.lines) {
      await _sendToGraylog(line, event.level);
    }
  }

  Future<void> _sendToGraylog(String message, Level level) async {
    final gelfMessage = {
      'version': '1.1',
      'host': source,
      'short_message': message,
      'level': _getLevelNumber(level),
      'timestamp': DateTime.now().millisecondsSinceEpoch / 1000.0,
      '_app_version': additionalFields['appVersion'] ?? 'unknown',
      '_device_info': additionalFields['deviceInfo'] ?? 'unknown',
      '_package_info': additionalFields['packageInfo'] ?? 'unknown',
      '_device_name': additionalFields['deviceName'] ?? 'unknown',
      '_build_number': additionalFields['buildNumber'] ?? 'unknown',
      // Ajoutez d'autres champs personnalisés ici
    };

    try {
      final response = await http.post(
        Uri.parse(graylogUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(gelfMessage),
      );

      if (response.statusCode != 202) {
        debugPrint(
          'Erreur lors de l\'envoi du log à Graylog: ${response.statusCode}',
        );
      }
    } catch (e) {
      debugPrint('Exception lors de l\'envoi du log à Graylog: $e');
    }
  }

  int _getLevelNumber(Level level) {
    switch (level) {
      case Level.trace:
        return 7;
      case Level.debug:
        return 7;
      case Level.info:
        return 6;
      case Level.warning:
        return 4;
      case Level.error:
        return 3;
      case Level.fatal:
        return 2;
      default:
        return 7;
    }
  }
}
