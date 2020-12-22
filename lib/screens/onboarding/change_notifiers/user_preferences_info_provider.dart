import 'package:flutter/material.dart';

class UserPreferencesInfoProvider extends ChangeNotifier {
  String _username;

  void setUserName(String name) {
    _username = name ?? "";
    notifyListeners();
  }

  String get username => _username;
}
