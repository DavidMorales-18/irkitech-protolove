import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AppService extends ChangeNotifier {
  final PreferencesService _prefs;

  AppService(this._prefs);

  bool _isLogged = false;
  bool get isLogged => _isLogged;

  Future<void> init() async {
    _isLogged = await _prefs.getIsLogged();
    print('AppService: isLogged=$_isLogged');
    notifyListeners();
  }

  Future<void> login() async {
    _isLogged = true;
    await _prefs.setIsLogged(true);
    print('AppService: isLogged=$_isLogged');
    notifyListeners();
  }
}
