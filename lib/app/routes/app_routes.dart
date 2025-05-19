part of 'app_pages.dart';

/// All route names
abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const WELCOME = _Paths.WELCOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const MATERI = _Paths.MATERI;
  static const ENGLISH_SUBMATERI = _Paths.ENGLISH_SUBMATERI;
  static const ENGLISH_ALPHABET = _Paths.ENGLISH_ALPHABET;
  static const PROFIL = _Paths.PROFIL;
  static const LOGOUT = _Paths.LOGOUT;
  static const LOGOUT_CONFIRM = _Paths.LOGOUT_CONFIRM;
  static const UBAH_KATA_SANDI = _Paths.UBAH_KATA_SANDI;
  static const VEGETABLES = _Paths.VEGETABLES;
  static const FLAGS = _Paths.FLAGS;
  static const ANIMALS = _Paths.ANIMALS;
  static const FRUITS = _Paths.FRUITS;
  static const CLOTHES = _Paths.CLOTHES;
  static const COLORS = _Paths.COLORS;
  static const SHAPES = _Paths.SHAPES;
  static const MATH_SUBMATERI = _Paths.MATH_SUBMATERI;
  static const ADDITION = _Paths.ADDITION;
}

/// Internal paths used in routing
abstract class _Paths {
  _Paths._();

  static const SPLASH = '/splash';
  static const WELCOME = '/welcome';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const DASHBOARD = '/dashboard';
  static const MATERI = '/materi';
  static const ENGLISH_SUBMATERI = '/english-submateri';
  static const ENGLISH_ALPHABET = '/english-alphabet';
  static const PROFIL = '/profil';
  static const LOGOUT = '/logout';
  static const LOGOUT_CONFIRM = '/logout-confirm';
  static const UBAH_KATA_SANDI = '/ubah-kata-sandi';
  static const VEGETABLES = '/vegetables';
  static const FLAGS = '/flags';
  static const ANIMALS = '/animals';
  static const FRUITS = '/fruits';
  static const CLOTHES = '/clothes';
  static const COLORS = '/colors';
  static const SHAPES = '/shapes';
  static const MATH_SUBMATERI = '/math-submateri';
  static const ADDITION = '/addition';
}
