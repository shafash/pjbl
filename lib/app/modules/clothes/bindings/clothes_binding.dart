import 'package:get/get.dart';

import '../controllers/clothes_controller.dart';

class ClothesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClothesController>(
      () => ClothesController(),
    );
  }
}
