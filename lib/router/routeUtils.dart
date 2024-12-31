class RouteUtil {
  static RoutePath path = RoutePath();
  static RouteName name = RouteName();
}

class RoutePath {
  String get temp => '/temp';
  String get error => '/error';
  String get init => '/init';
  String get login => '/login';
  String get home => '/';
}

class RouteName {
  String get temp => 'Temp';
  String get error => 'Error';
  String get init => 'Init';
  String get login => 'Login';
  String get home => 'Home';
}