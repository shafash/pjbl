import 'package:get/get.dart';

import '../controllers/ubah_username_controller.dart';

class UbahUsernameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UbahUsernameController>(
      () => UbahUsernameController(),
    );
  }
}
