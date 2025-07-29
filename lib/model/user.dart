import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  factory User({
    String? userId,
    String? userPw
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}

// migrate from the old User class to the new User class
// class User {
//   final String? _userId;
//   final String? _userPw;
//
//   const User({String? userId = '', String? userPw = ''}) : _userPw = userPw, _userId = userId;
//
//   String? get userId => _userId;
//   String? get userPw => _userPw;
//
//   User copyWith({
//     String? userId,
//     String? userPw,
//   }) {
//     return User(
//       userId: userId ?? _userId,
//       userPw: userPw ?? _userPw,
//     );
//   }
// }