import 'package:get/get.dart';

import '../controllers/pattern_controller.dart';

class PatternBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PatternController>(
      () => PatternController(),
    );
  }
}
