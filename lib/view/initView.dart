import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constant/designSize.dart';
import '../model/appState.dart';
import '../service/appService.dart';
import '../service/sharedService.dart';
import '../style/style.dart';

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
  Future<void> onAppStartNew(BuildContext context, WidgetRef ref, AppState appState) async {
    final isAutoLogin = await _checkAutoLogin();
    if (isAutoLogin) {
      if (context.mounted) {
        setState(() {
          label = '..자동로그인중..';
        });
      }

      // todo: get login info from SharedService
    } else {
      // if (context.mounted) {
      //   setState(() {
      //     label = '..실행중..';
      //   });
      // }
      // init success
      if (!appState.initialized) {
        await Future.delayed(const Duration(milliseconds: 200));
        final appService = ref.read(appServiceProvider.notifier);
        appService.onInitSuccess();

        // if (context.mounted) {
        //   setState(() {
        //     label = '완료';
        //   });
        // }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(appServiceProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await onAppStartNew(context, ref, appState);
    });

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      ScreenUtil.init(context, designSize: minIOS);
      return Scaffold(
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
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      ScreenUtil.init(context, designSize: minAndroid);
      return Scaffold(
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
      );
    } else {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitFadingCircle(color: Colors.orange),
              SizedBox(height: 10),
              Text(label,
                style: TextGuide.notoRegular16,
              ),
            ],
          ),
        ),
      );
    }
  }
}