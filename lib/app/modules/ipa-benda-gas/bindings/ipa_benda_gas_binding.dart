import 'package:get/get.dart';

import '../controllers/ipa_benda_gas_controller.dart';

class IpaBendaGasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IpaBendaGasController>(
      () => IpaBendaGasController(),
    );
  }
}
