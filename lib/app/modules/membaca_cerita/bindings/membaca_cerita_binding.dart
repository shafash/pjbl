import 'package:get/get.dart';

import '../controllers/membaca_cerita_controller.dart';

class MembacaCeritaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MembacaCeritaController>(
      () => MembacaCeritaController(),
    );
  }
}
