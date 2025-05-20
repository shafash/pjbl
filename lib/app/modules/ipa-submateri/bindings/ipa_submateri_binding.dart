import 'package:get/get.dart';

import '../controllers/ipa_submateri_controller.dart';

class IpaSubmateriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IpaSubmateriController>(
      () => IpaSubmateriController(),
    );
  }
}
