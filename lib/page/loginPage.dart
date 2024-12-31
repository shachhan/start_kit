import 'package:start_kit01/constant/designSize.dart';
import 'package:start_kit01/style/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      ScreenUtil.init(context, designSize: minIOS);
      return Scaffold(
        body: Center(
          child: Text(
            'iOS 로그인페이지입니다.',
            style: TextGuide.notoRegular16.copyWith(fontSize: 16.sp),
          ),
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      ScreenUtil.init(context, designSize: minAndroid);
      return Scaffold(
        body: Center(
          child: Text(
            'Android 로그인페이지입니다.',
            style: TextGuide.notoRegular16.copyWith(fontSize: 16.sp),
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: Text('Login Page'),
        ),
      );
    }
  }
}