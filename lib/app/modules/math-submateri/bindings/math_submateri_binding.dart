import 'package:get/get.dart';

import '../controllers/math_submateri_controller.dart';

class MathSubmateriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MathSubmateriController>(
      () => MathSubmateriController(),
    );
  }
}
