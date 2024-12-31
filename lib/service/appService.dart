import 'package:flutter/foundation.dart';

class AppService with ChangeNotifier {
  bool _loginState = false;
  bool _initialized = false;

  bool get loginState => _loginState;
  bool get initialized => _initialized;

  Future<void> onAppStart() async {
    _initialized = true;
    notifyListeners();
  }

  void onLoginSuccess() {
    _loginState = true;
    notifyListeners();
  }

  void onLogout() {
    _loginState = false;
    notifyListeners();
  }

  void onInitSuccess() {
    _initialized = true;
    notifyListeners();
  }

  void onAutoLoginSuccess() {
    _initialized = true;
    _loginState = true;
    notifyListeners();
  }
}