import 'package:get/get.dart';

import '../controllers/rumah_adat_controller.dart';

class RumahAdatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RumahAdatController>(
      () => RumahAdatController(),
    );
  }
}
