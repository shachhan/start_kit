import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:start_kit01/constant/designSize.dart';
import 'package:start_kit01/provider/userProvider.dart';
import 'package:start_kit01/router/routeUtils.dart';
import 'package:start_kit01/service/appService.dart';
import 'package:start_kit01/service/sharedService.dart';
import 'package:start_kit01/style/style.dart';
import 'package:start_kit01/widget/myDialog.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  String label1 = '준비중';
  late AppService appService;
  late UserProvider authUser;

  // FCM token init
  String? _token;
  late Stream<String> _tokenStream;

  @override
  void initState() {
    authUser = context.read<UserProvider>();
    var appService = context.read<AppService>();
    _onAppStart(appService);
    super.initState();
  }

  /// auto login check in a cache storage.
  /// if set it check on the login page, it will be true.
  Future<bool> _checkAutoLogin() async {
    setState(() {
      label1 = '확인중..';
    });
    final res = await SharedService.checkAutoLogin();
    return res;
  }

  void _onAppStart(AppService appService) {
    _checkAutoLogin().then((value1) {
      if (value1) {
        setState(() {
          label1 = '자동로그인중...';
        });
        SharedService.autoLogin().then((value2) {
          if (value2) {
            // get login acct and set authUser here
            if (mounted) {
              showDialog(context: context,
                builder: (_) => ErrDialog(content: '자동로그인에 성공했습니다.',
                  onPressed: () {
                    context.pop();
                    context.go(RouteUtil.path.home);
                  },
                ),
              );
            }

            appService.onAutoLoginSuccess();
          } else {
            appService.onInitSuccess();
          }
        });
      } else {
        appService.onInitSuccess();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      ScreenUtil.init(context, designSize: minIOS);
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitFadingCircle(color: Colors.orange, size: 50.w,),
              SizedBox(height: 20.h),
              Text(label1,
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
              Text(label1,
                style: TextGuide.notoRegular16.copyWith(fontSize: 16.sp),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: Text('Init Page'),
        ),
      );
    }
  }
}