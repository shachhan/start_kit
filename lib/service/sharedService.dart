import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  // if auto login is available, true;
  static Future<bool> checkAutoLogin() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('autoLogin') ?? false){
      return true;
    } else {
      return false;
    }
  }

  static Future<void> setAutoLoginInfo(bool autoLogin, String id, String pw) async {
    final prefs = await SharedPreferences.getInstance();

    // 캐시에 저장
    prefs.setBool('autoLogin', autoLogin);
    prefs.setString('userid', id);
    prefs.setString('userPw', pw);
  }

  // auto Login func
  static Future<bool> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();

    // API call here
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
}