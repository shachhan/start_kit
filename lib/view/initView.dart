import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../model/appState.dart';
import '../router/routeUtils.dart';
import '../service/appService.dart';
import '../service/sharedService.dart';
import '../style/style.dart';
import '../util/logger.dart';
import '../widget/platformResponsiveWidget.dart';

class InitView extends ConsumerStatefulWidget {
  const InitView({super.key});

  @override
  ConsumerState<InitView> createState() => _InitViewState();
}

class _InitViewState extends ConsumerState<InitView> {
  String label = '..준비중..';

  SharedService sharedService = SharedService();

  // FCM token init
  String? _token;
  late Stream<String> _tokenStream;

  /// auto login check in a cache storage.
  /// if set it check on the login page, it will be true.
  Future<bool> _checkAutoLogin() async {
    // setState(() {
    //   label = '..확인중..';
    // });
    final res = await sharedService.checkAndGetAutoLogin();
    return res;
  }

  /// check autoLogin
  /// if true, call autoLogin
  /// if false, call initSuccess
  Future<void> onAppStart(BuildContext context, WidgetRef ref, AppState appState) async {
    final isAutoLogin = await _checkAutoLogin();
    final appService = ref.read(appServiceProvider.notifier);
    if (isAutoLogin) {
      if (context.mounted) {
        setState(() {
          label = '..자동로그인중..';
        });
      }

      final res = await sharedService.autoLogin(ref);
      if (res) {
        logger.i('Auto login success!');
        appService.onAutoLoginSuccess();

        /// 4 홈 화면으로 이동
        if (context.mounted) {
          context.go(RouteUtil.path.home);
        }
      } else {
        await Future.delayed(const Duration(milliseconds: 200));
        appService.onInitSuccess();
      }

    } else {
      if (!appState.initialized) {
        await Future.delayed(const Duration(milliseconds: 200));
        appService.onInitSuccess();
      }
    }
  }

  Future<void> _startApp() async {
    final appState = ref.read(appServiceProvider);
    await onAppStart(context, ref, appState);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _startApp();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return PlatformResponsiveWidget(
      iosWidget: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitFadingCircle(color: Colors.orange, size: 50.w,),
              SizedBox(height: 20.h),
              Text(label,
                style: TextGuide.notoRegular16.copyWith(fontSize: 16.sp),
              ),
            ],
          ),
        ),
      ),
      androidWidget: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitFadingCircle(color: Colors.orange, size: 50.w,),
              SizedBox(height: 20.h),
              Text(label,
                style: TextGuide.notoRegular16.copyWith(fontSize: 16.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}