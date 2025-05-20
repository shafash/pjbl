import 'package:get/get.dart';

import '../controllers/pekerjaan_sekitar_controller.dart';

class PekerjaanSekitarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PekerjaanSekitarController>(
      () => PekerjaanSekitarController(),
    );
  }
}
