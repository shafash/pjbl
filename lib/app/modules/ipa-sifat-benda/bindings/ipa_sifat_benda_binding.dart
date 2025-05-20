import 'package:get/get.dart';

import '../controllers/ipa_sifat_benda_controller.dart';

class IpaSifatBendaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IpaSifatBendaController>(
      () => IpaSifatBendaController(),
    );
  }
}
