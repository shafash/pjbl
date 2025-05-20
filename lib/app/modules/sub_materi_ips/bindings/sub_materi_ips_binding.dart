import 'package:get/get.dart';

import '../controllers/sub_materi_ips_controller.dart';

class SubMateriIpsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubMateriIpsController>(
      () => SubMateriIpsController(),
    );
  }
}
