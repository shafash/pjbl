import 'package:get/get.dart';

import '../controllers/kuis_ipa_controller.dart';

class KuisIpaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KuisIpaController>(
      () => KuisIpaController(),
    );
  }
}
