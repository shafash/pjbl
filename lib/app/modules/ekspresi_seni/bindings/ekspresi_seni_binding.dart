import 'package:get/get.dart';

import '../controllers/ekspresi_seni_controller.dart';

class EkspresiSeniBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EkspresiSeniController>(
      () => EkspresiSeniController(),
    );
  }
}
