import 'package:get/get.dart';

import '../controllers/animals_controller.dart';

class AnimalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimalsController>(
      () => AnimalsController(),
    );
  }
}
