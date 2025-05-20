import 'package:get/get.dart';

import '../controllers/puisi_pantun_controller.dart';

class PuisiPantunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PuisiPantunController>(
      () => PuisiPantunController(),
    );
  }
}
