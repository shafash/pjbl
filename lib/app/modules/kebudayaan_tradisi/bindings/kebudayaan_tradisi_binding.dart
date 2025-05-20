import 'package:get/get.dart';

import '../controllers/kebudayaan_tradisi_controller.dart';

class KebudayaanTradisiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KebudayaanTradisiController>(
      () => KebudayaanTradisiController(),
    );
  }
}
