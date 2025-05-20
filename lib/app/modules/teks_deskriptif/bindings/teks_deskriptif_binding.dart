import 'package:get/get.dart';

import '../controllers/teks_deskriptif_controller.dart';

class TeksDeskriptifBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeksDeskriptifController>(
      () => TeksDeskriptifController(),
    );
  }
}
