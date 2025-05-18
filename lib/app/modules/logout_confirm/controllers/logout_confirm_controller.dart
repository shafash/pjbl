import 'package:get/get.dart';

class LogoutConfirmController extends GetxController {
  void logoutUser() {
    // Contoh: panggil AuthService untuk logout
    // AuthService().logout();
    Get.offAllNamed('/login'); // Navigasi ke login
  }
}
