import 'package:get/get.dart';

import '../controllers/colors_controller.dart';

class ColorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ColorsController>(
      () => ColorsController(),
    );
  }
}
