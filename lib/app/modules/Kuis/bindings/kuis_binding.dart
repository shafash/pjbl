import 'package:get/get.dart';

import '../controllers/kuis_controller.dart';

class KuisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KuisController>(
      () => KuisController(),
    );
  }
}
