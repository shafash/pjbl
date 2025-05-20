import 'package:get/get.dart';

import '../controllers/ipa_tumbuhan_hewan_controller.dart';

class IpaTumbuhanHewanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IpaTumbuhanHewanController>(
      () => IpaTumbuhanHewanController(),
    );
  }
}
