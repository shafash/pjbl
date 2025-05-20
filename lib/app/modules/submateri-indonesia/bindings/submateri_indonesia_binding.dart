import 'package:get/get.dart';

import '../controllers/submateri_indonesia_controller.dart';

class SubmateriIndonesiaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubmateriIndonesiaController>(
      () => SubmateriIndonesiaController(),
    );
  }
}
