import 'package:get/get.dart';

import '../controllers/ipa_benda_padat_controller.dart';

class IpaBendaPadatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IpaBendaPadatController>(
      () => IpaBendaPadatController(),
    );
  }
}
