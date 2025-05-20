import 'package:get/get.dart';

import '../controllers/ipa_tumbuhan_contoh_controller.dart';

class IpaTumbuhanContohBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IpaTumbuhanContohController>(
      () => IpaTumbuhanContohController(),
    );
  }
}
