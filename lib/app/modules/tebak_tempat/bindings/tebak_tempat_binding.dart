import 'package:get/get.dart';

import '../controllers/tebak_tempat_controller.dart';

class TebakTempatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TebakTempatController>(
      () => TebakTempatController(),
    );
  }
}
