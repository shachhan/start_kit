import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/user.dart';

part 'userProvider.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  User build() {
    return const User();
  }

  void clearUser() {
    state = const User();
  }

  void setUser({
    required String userId,
    required String userPw,
  }) {
    state = User(userId: userId, userPw: userPw);
  }
}

// class UserProvider with ChangeNotifier {
//   String? _userId = '';
//   String? _userPw = '';
//
//
//   String? get userId => _userId;
//   String? get userPw => _userPw;
//
//   void clearUser() {
//     _userId = '';
//     _userPw = '';
//     notifyListeners();
//   }
//
//   void setUser({
//     required String userId,
//     required String userPw,}) {
//     _userId = userId;
//     _userPw = userPw;
//     notifyListeners();
//   }
//
//   UserProvider getUser() {
//     return this;
//   }
// }