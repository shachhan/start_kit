import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  /// SharedService singleton and private constructor
  static final SharedService _sharedService = SharedService._init();
  factory SharedService() => _sharedService;

  SharedService._init() {
    _prefs = SharedPreferencesAsync();
  }
  // static final SharedService instance = SharedService._();

  /// SharedPreferences instance and initialized flag
  late SharedPreferencesAsync _prefs;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();


  static const String _keyAutoLogin = 'autoLogin';
  static const String _keyUserId = 'userid';
  static const String _keyUserPw = 'userPw';

  /// set bool of [autoLogin]. [SharedPreferences] 에 아이디 저장, secure storage 에 비밀번호 저장
  /// [autoLogin] : true -> 로그인정보 저장
  /// [autoLogin] : false -> 로그인정보 삭제
  Future<void> setAutoLoginInfo(bool autoLogin, String id, String pw) async {
    // 캐시에 저장
    if (autoLogin) {
      _prefs.setBool(_keyAutoLogin, autoLogin);
      _prefs.setString(_keyUserId, id);
      await _secureStorage.write(key: _keyUserPw, value: pw);
    } else {
      _prefs.remove(_keyUserId);
      await _secureStorage.delete(key: _keyUserPw);
    }
  }

  /// check if auto login is true or false
  Future<bool> checkAndGetAutoLogin() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return await _prefs.getBool(_keyAutoLogin) ?? false;
  }

  /// get user id
  Future<String> getUserId() async {
    return await _prefs.getString(_keyUserId) ?? '';
  }

  /// get password from secure storage
  Future<String> getUserPassword() async {
    return (await _secureStorage.read(key: _keyUserPw)) ?? '';
  }

  /// auto Login method
  Future<bool> autoLogin(WidgetRef ref) async {

    final userId = await getUserId();
    final userPw = await getUserPassword();

    // todo : API call here
    // final res = await http.post(
    //   Uri.parse('https://api.example.com/login'),
    //   body: jsonEncode(<String, String>{
    //     'userid': prefs.getString('userid')!,
    //     'userPw': prefs.getString('userPw')!,
    //   }),
    // );
    //
    // if (res.statusCode == 200) {
    //   // AppService(prefs).onLoginSuccess();
    //   // logger.i('login success!');
    //
    //   final data = json.decode(res.body);
    //   return data.toList();
    // }
    // throw Exception('no internet available!');

    return false;
  }

  /// 모든 저장 데이터 삭제
  Future<void> clearAll() async {
    await _prefs.clear();
    await _secureStorage.deleteAll();
  }
}