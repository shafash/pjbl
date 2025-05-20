import 'package:get/get.dart';

import '../controllers/teks_naratif_controller.dart';

class TeksNaratifBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeksNaratifController>(
      () => TeksNaratifController(),
    );
  }
}
