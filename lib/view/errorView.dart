import 'package:flutter/material.dart';

import '../widget/platformResponsiveWidget.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformResponsiveWidget(
      iosWidget: Scaffold(
        body: Center(
          child: Text('iOS 오류페이지입니다.'),
        ),
      ),
      androidWidget: Scaffold(
        body: Center(
          child: Text('Android 오류페이지입니다.'),
        ),
      ),
    );
  }
}