import 'package:get/get.dart';

import '../controllers/ipa_indera_manusia_controller.dart';

class IpaInderaManusiaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IpaInderaManusiaController>(
      () => IpaInderaManusiaController(),
    );
  }
}
