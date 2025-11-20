import 'package:flutter/material.dart';

import '../widget/platformResponsiveWidget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformResponsiveWidget(
      iosWidget: Scaffold(
        body: Center(
          child: Text('iOS 로그인 페이지입니다.'),
        ),
      ),
      androidWidget: Scaffold(
        body: Center(
          child: Text('Android 로그인 페이지입니다.'),
        ),
      ),
    );
  }
}