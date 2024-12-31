import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String? _userId = '';
  String? _userPw = '';


  String? get userId => _userId;
  String? get userPw => _userPw;

  void clearUser() {
    _userId = '';
    _userPw = '';
    notifyListeners();
  }

  void setUser({
    required String userId,
    required String userPw,}) {
    _userId = userId;
    _userPw = userPw;
    notifyListeners();
  }

  UserProvider getUser() {
    return this;
  }
}