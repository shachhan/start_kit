import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/designSize.dart';
import '../style/style.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      ScreenUtil.init(context, designSize: minIOS);
      return Scaffold(
        body: Center(
          child: Text(
            'iOS 홈페이지입니다.',
            style: TextGuide.notoRegular16.copyWith(fontSize: 16.sp),
          ),
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      ScreenUtil.init(context, designSize: minAndroid);
      return Scaffold(
        body: Center(
          child: Text(
            'Android 홈페이지입니다.',
            style: TextGuide.notoRegular16.copyWith(fontSize: 16.sp),
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: Text('Home Page'),
        ),
      );
    }
  }
}