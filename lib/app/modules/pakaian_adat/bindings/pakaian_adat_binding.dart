import 'package:get/get.dart';

import '../controllers/pakaian_adat_controller.dart';

class PakaianAdatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PakaianAdatController>(
      () => PakaianAdatController(),
    );
  }
}
