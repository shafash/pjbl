import 'package:get/get.dart';

import '../middleware/auth_middleware.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/english-alphabet/bindings/english_alphabet_binding.dart';
import '../modules/english-alphabet/views/english_alphabet_view.dart';
import '../modules/english-submateri/bindings/english_submateri_binding.dart';
import '../modules/english-submateri/views/english_submateri_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/logout_confirm/bindings/logout_confirm_binding.dart';
import '../modules/logout_confirm/views/logout_confirm_view.dart';
import '../modules/materi/views/materi_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/ubah_kata_sandi/bindings/ubah_kata_sandi_binding.dart';
import '../modules/ubah_kata_sandi/views/ubah_kata_sandi_view.dart';
import '../modules/vegetables/bindings/vegetables_binding.dart';
import '../modules/vegetables/views/vegetables_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.SPLASH; // ✅ Gunakan camelCase

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(), // ditambah const
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(), // ditambah const
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.MATERI,
      page: () => const MateriView(), // ditambah const
    ),
    GetPage(
      name: _Paths.ENGLISH_SUBMATERI,
      page: () => const EnglishSubmateriView(),
      binding: EnglishSubmateriBinding(),
    ),
    GetPage(
      name: _Paths.ENGLISH_ALPHABET,
      page: () => const EnglishAlphabetSwiperView(),
      binding: EnglishAlphabetBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => const ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.LOGOUT_CONFIRM,
      page: () => const LogoutConfirmView(),
      binding: LogoutConfirmBinding(),
    ),
    GetPage(
      name: _Paths.UBAH_KATA_SANDI,
      page: () => UbahKataSandiView(), // ditambah const
      binding: UbahKataSandiBinding(),
    ),
    GetPage(
      name: _Paths.VEGETABLES,
      page: () => const VegetablesView(), // ditambah const
      binding: VegetablesBinding(),
    ),
  ];
}
