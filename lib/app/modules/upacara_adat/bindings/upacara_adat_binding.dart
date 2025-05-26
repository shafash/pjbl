import 'package:get/get.dart';

import '../controllers/upacara_adat_controller.dart';

class UpacaraAdatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpacaraAdatController>(
      () => UpacaraAdatController(),
    );
  }
}
