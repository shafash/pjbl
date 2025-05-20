import 'package:get/get.dart';

import '../controllers/ipa_hewan_contoh_controller.dart';

class IpaHewanContohBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IpaHewanContohController>(
      () => IpaHewanContohController(),
    );
  }
}
