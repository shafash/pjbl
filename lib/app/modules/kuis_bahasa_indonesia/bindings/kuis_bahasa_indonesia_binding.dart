import 'package:get/get.dart';

import '../controllers/kuis_bahasa_indonesia_controller.dart';

class KuisBahasaIndonesiaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KuisBahasaIndonesiaController>(
      () => KuisBahasaIndonesiaController(),
    );
  }
}
