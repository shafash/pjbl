import 'package:get/get.dart';

import '../controllers/shape2_controller.dart';

class Shape2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Shape2Controller>(
      () => Shape2Controller(),
    );
  }
}
