import '../model/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'userNotifier.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  User build() {
    return User();
  }

  void clearUser() {
    state = User();
  }

  void setUser({
    required String userId,
    required String userPw,
  }) {
    state = User(userId: userId, userPw: userPw);
  }
}
