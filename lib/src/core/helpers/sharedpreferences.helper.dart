// ignore_for_file: file_names, avoid_print

import 'package:flutter_gemini_demo/src/core/services/log.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final LogService _logger = LogService();
  final String _isFirstOpen = "firstOpen";
  final String _token = "token";

  Future<bool> setIsFirstOpen(bool first) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setBool(_isFirstOpen, first);
    _logger.info('First Open $res');
    print('First Open $res');
    return res;
  }

  Future<bool> getIsFirstOpen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = prefs.getBool(_isFirstOpen) ?? true;
    _logger.info('First Open $res');
    print('First Open $res');
    return res;
  }

  Future<bool> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setString(_token, "Bearer $token");
    _logger.info('Token $res');
    print('Token $res');
    return res;
  }

  Future<bool> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = await prefs.remove(_token);
    _logger.info('Token $res');
    print('Token $res');
    return res;
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? res = prefs.getString(_token);
    _logger.info('Token $res');
    print('Token $res');
    return res;
  }
}
