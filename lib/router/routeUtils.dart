class RouteUtil {
  const RouteUtil._();

  static RoutePath path = RoutePath.instance;
  static RouteName name = RouteName.instance;
}

class RoutePath {
  const RoutePath._();
  static final RoutePath instance = RoutePath._();


  String get temp => '/temp';
  String get error => '/error';
  String get init => '/init';
  String get login => '/login';
  String get home => '/';
}

class RouteName {
  const RouteName._();
  static final RouteName instance = RouteName._();

  String get temp => 'Temp';
  String get error => 'Error';
  String get init => 'Init';
  String get login => 'Login';
  String get home => 'Home';
}