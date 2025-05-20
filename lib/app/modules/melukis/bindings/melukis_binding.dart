import 'package:get/get.dart';

import '../controllers/melukis_controller.dart';

class MelukisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MelukisController>(
      () => MelukisController(),
    );
  }
}
