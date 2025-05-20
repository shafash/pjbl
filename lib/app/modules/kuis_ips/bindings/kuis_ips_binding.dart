import 'package:get/get.dart';

import '../controllers/kuis_ips_controller.dart';

class KuisIpsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KuisIpsController>(
      () => KuisIpsController(),
    );
  }
}
