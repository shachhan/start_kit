import 'package:start_kit/widget/platformResponsiveWidget.dart';

import '../constant/designSize.dart';
import '../style/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TempView extends StatelessWidget {
  const TempView({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformResponsiveWidget(
      iosWidget: Scaffold(
        body: Center(
          child: Text('iOS 임시페이지입니다.'),
        ),
      ),
      androidWidget: Scaffold(
        body: Center(
          child: Text('Android 임시페이지입니다.'),
        ),
      ),
    );
  }
}