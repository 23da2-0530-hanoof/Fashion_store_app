import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String _name = 'Guest';
  String _email = 'guest@example.com';
  bool _isLoggedIn = false;

  String get name => _name;
  String get email => _email;
  bool get isLoggedIn => _isLoggedIn;

  void login(String email, String password) {
    _email = email.isNotEmpty ? email : 'user@example.com';
    _name = email.split('@').first;
    _name = _name.isNotEmpty ? _name[0].toUpperCase() + _name.substring(1) : 'User';
    _isLoggedIn = true;
    notifyListeners();
  }

  void register(String name, String email, String password) {
    _name = name.isNotEmpty ? name : 'User';
    _email = email.isNotEmpty ? email : 'user@example.com';
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _name = 'Guest';
    _email = 'guest@example.com';
    _isLoggedIn = false;
    notifyListeners();
  }
}
