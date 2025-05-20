import 'package:get/get.dart';

import '../controllers/subtraction_controller.dart';

class SubtractionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubtractionController>(
      () => SubtractionController(),
    );
  }
}
