import 'package:get/get.dart';

import '../controllers/berbicara_depan_umum_controller.dart';

class BerbicaraDepanUmumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BerbicaraDepanUmumController>(
      () => BerbicaraDepanUmumController(),
    );
  }
}
