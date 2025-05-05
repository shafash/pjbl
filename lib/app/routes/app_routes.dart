part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const WELCOME = _Paths.WELCOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const DASHBOARD = _Paths.DASHBOARD;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const WELCOME = '/welcome';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const DASHBOARD = '/dashboard';
}
