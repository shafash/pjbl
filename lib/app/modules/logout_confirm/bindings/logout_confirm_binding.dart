import 'package:get/get.dart';

import '../controllers/logout_confirm_controller.dart';

class LogoutConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogoutConfirmController>(
      () => LogoutConfirmController(),
    );
  }
}
