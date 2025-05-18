import 'package:get/get.dart';

import '../controllers/vegetables_controller.dart';

class VegetablesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VegetablesController>(
      () => VegetablesController(),
    );
  }
}
