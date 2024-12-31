import 'package:start_kit01/function/logger.dart';
import 'package:start_kit01/page/errorPage.dart';
import 'package:start_kit01/page/homePage.dart';
import 'package:start_kit01/page/initPage.dart';
import 'package:start_kit01/page/loginPage.dart';
import 'package:start_kit01/page/tempPage.dart';
import 'package:start_kit01/router/routeUtils.dart';
import 'package:start_kit01/service/appService.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late AppService appService;
  GoRouter get router => _goRouter;
  final _parentKey = GlobalKey<NavigatorState>();
  final _mainShellKey = GlobalKey<NavigatorState>();

  AppRouter(this.appService);
  late final GoRouter _goRouter = GoRouter(
    // initialLocation: '/init',
    navigatorKey: _parentKey,
    routes: [
      GoRoute(path: RouteUtil.path.temp, builder: (context, state) => const TempPage()),
      GoRoute(path: RouteUtil.path.error, builder: (context, state) => const ErrorPage()),
      GoRoute(path: RouteUtil.path.init, builder: (context, state) => const InitPage()),
      GoRoute(path: RouteUtil.path.login, builder: (context, state) => const LoginPage()),
      GoRoute(path: RouteUtil.path.home, builder: (context, state) => const HomePage()),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
    refreshListenable: appService,
    redirect: (context, state) {
      // ! you have to use AppRouter(appService) in main.dart precisely
      final isInitialized = appService.initialized;
      final isLoggedIn = appService.loginState;

      if (!isInitialized && !isLoggedIn) {
        // logger.i('not initialized 1');
        return RouteUtil.path.init;
      } else if (isInitialized && !isLoggedIn) {
        // logger.i('not logged in');
        return RouteUtil.path.login;
      } else if (isInitialized && isLoggedIn) {
        // logger.i('logged in');
        return null;
      } else {
        logger.i('not initialized : never happen');
        return RouteUtil.path.init;
      }
    },
  );
}