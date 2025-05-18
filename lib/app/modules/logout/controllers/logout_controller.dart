import 'package:get/get.dart';
import 'package:kelas_pintar/app/routes/app_pages.dart';

class LogoutController extends GetxController {
  void logout() {
    // Di sini kita bisa hapus data user kalau ada (misalnya SharedPreferences)
    // Lalu redirect ke halaman login
    Get.offAllNamed(Routes.LOGIN);
  }
}
