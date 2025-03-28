// 사용자 상태를 나타내는 클래스
class User {
  final String? _userId;
  final String? _userPw;

  const User({String? userId = '', String? userPw = ''}) : _userPw = userPw, _userId = userId;

  String? get userId => _userId;
  String? get userPw => _userPw;

  User copyWith({
    String? userId,
    String? userPw,
  }) {
    return User(
      userId: userId ?? _userId,
      userPw: userPw ?? _userPw,
    );
  }
}