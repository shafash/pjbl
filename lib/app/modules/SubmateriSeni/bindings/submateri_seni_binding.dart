import 'package:get/get.dart';

import '../controllers/submateri_seni_controller.dart';

class SubmateriSeniBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubmateriSeniController>(
      () => SubmateriSeniController(),
    );
  }
}
