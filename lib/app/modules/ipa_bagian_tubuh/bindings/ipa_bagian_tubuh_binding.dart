import 'package:get/get.dart';

import '../controllers/ipa_bagian_tubuh_controller.dart';

class IpaBagianTubuhBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IpaBagianTubuhController>(
      () => IpaBagianTubuhController(),
    );
  }
}
