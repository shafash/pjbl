import 'package:get/get.dart';

import '../controllers/kriya_controller.dart';

class KriyaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KriyaController>(
      () => KriyaController(),
    );
  }
}
