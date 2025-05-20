import 'package:get/get.dart';

import '../controllers/kolase_controller.dart';

class KolaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KolaseController>(
      () => KolaseController(),
    );
  }
}
