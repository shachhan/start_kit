
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../service/appService.dart';
import '../view/errorView.dart';
import '../view/homeView.dart';
import '../view/initView.dart';
import '../view/loginView.dart';
import '../view/tempView.dart';
import 'routeUtils.dart';

part 'appRouter.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final initialRoute = RouteUtil.path.init;   // 초기 경로 설정
  return AppRouter(ref, initialRoute).router;
}

class AppRouter {
  final Ref _ref;
  final String _initialRoute;
  final _parentKey = GlobalKey<NavigatorState>();
  late final AppStateListenable _appStateListenable;

  AppRouter(this._ref, this._initialRoute) {
    _appStateListenable = AppStateListenable(_ref);
  }

  GoRouter get router => _goRouter;
  late final GoRouter _goRouter = GoRouter(
    navigatorKey: _parentKey,
    initialLocation: _initialRoute,
    routes: [
      GoRoute(path: RouteUtil.path.error, builder: (context, state) => const ErrorView()),
      GoRoute(path: RouteUtil.path.temp, builder: (context, state) => const TempView()),
      GoRoute(path: RouteUtil.path.init, builder: (context, state) => const InitView()),
      GoRoute(path: RouteUtil.path.login, builder: (context, state) => const LoginView()),
      GoRoute(path: RouteUtil.path.home, builder: (context, state) => const HomeView()),
    ],
    errorBuilder: (context, state) => const ErrorView(),
    refreshListenable: _appStateListenable,
    redirect: (context, state) {
      // 앱 상태를 항상 listen 하기 위해 watch 사용
      final appState = _ref.watch(appServiceProvider);
      final isInit = appState.initialized;
      final isLogin = appState.loginState;

      // 초기화 되지 않았을 경우 init 페이지로 이동
      if (!isInit && !isLogin) {
        return RouteUtil.path.init;
      } else if (isInit && !isLogin) {
        return RouteUtil.path.login;
      } else {
        // 초기화가 완료되고 로그인 상태일 경우 홈 페이지로 이동
        return null;
      }
    },
  );
}
