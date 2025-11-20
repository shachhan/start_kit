import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/designSize.dart';

/// 플랫폼에 따라 다른 뷰를 보여주는 공통 위젯
/// iOS와 Android에서 각각 다른 위젯을 렌더링할 수 있습니다.
class PlatformResponsiveWidget extends StatelessWidget {
  /// iOS에서 보여질 위젯
  final Widget iosWidget;

  /// Android에서 보여질 위젯
  final Widget androidWidget;

  /// 기본 위젯 (다른 플랫폼이나 fallback용)
  final Widget? defaultWidget;

  const PlatformResponsiveWidget({
    super.key,
    required this.iosWidget,
    required this.androidWidget,
    this.defaultWidget,
  });

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        ScreenUtil.init(context, designSize: minIOS);
        return iosWidget;

      case TargetPlatform.android:
        ScreenUtil.init(context, designSize: minAndroid);
        return androidWidget;

      default:
        return defaultWidget ?? Scaffold(
          body: Center(child: Text('지원하지 않는 플랫폼입니다.')),
        ); // Android를 기본값으로 사용
    }
  }
}

/// Builder 패턴을 사용하여 플랫폼별로 다른 위젯을 빌드하는 위젯
/// 좀 더 유연한 사용이 가능합니다.
class PlatformResponsiveBuilder extends StatelessWidget {
  /// iOS 위젯 빌더
  final Widget Function(BuildContext context) iosBuilder;

  /// Android 위젯 빌더
  final Widget Function(BuildContext context) androidBuilder;

  /// 기본 위젯 빌더
  final Widget Function(BuildContext context)? defaultBuilder;

  const PlatformResponsiveBuilder({
    super.key,
    required this.iosBuilder,
    required this.androidBuilder,
    this.defaultBuilder,
  });

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        ScreenUtil.init(context, designSize: minIOS);
        return iosBuilder(context);

      case TargetPlatform.android:
        ScreenUtil.init(context, designSize: minAndroid);
        return androidBuilder(context);

      default:
        return defaultBuilder?.call(context) ?? androidBuilder(context);
    }
  }
}

/// 플랫폼별 조건부 위젯 렌더링을 위한 유틸리티 클래스
class PlatformUtils {
  /// 현재 플랫폼이 iOS인지 확인
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  /// 현재 플랫폼이 Android인지 확인
  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  /// 플랫폼에 따른 값을 반환하는 헬퍼 메서드
  static T platformValue<T>({
    required T ios,
    required T android,
    T? defaultValue,
  }) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.android:
        return android;
      default:
        return defaultValue ?? android;
    }
  }

  /// 플랫폼에 따른 디자인 사이즈를 반환
  static Size getDesignSize({Size? iosSize, Size? androidSize}) {
    return platformValue(
      ios: iosSize ?? minIOS,
      android: androidSize ?? minAndroid,
    );
  }
}