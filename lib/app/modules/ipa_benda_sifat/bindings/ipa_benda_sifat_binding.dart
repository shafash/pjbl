import 'package:get/get.dart';

import '../controllers/ipa_benda_sifat_controller.dart';

class IpaBendaSifatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IpaBendaSifatController>(
      () => IpaBendaSifatController(),
    );
  }
}
