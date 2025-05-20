import 'package:get/get.dart';

import '../controllers/peta_arah_mata_angin_controller.dart';

class PetaArahMataAnginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PetaArahMataAnginController>(
      () => PetaArahMataAnginController(),
    );
  }
}
