import 'package:get/get.dart';
import 'package:kelas_pintar/app/routes/app_pages.dart';

class LogoutController extends GetxController {
  void logout() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
