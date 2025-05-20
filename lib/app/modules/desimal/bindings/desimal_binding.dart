import 'package:get/get.dart';

import '../controllers/desimal_controller.dart';

class DesimalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DesimalController>(
      () => DesimalController(),
    );
  }
}
