import 'package:get/get.dart';

import '../controllers/ipa_tata_surya_controller.dart';

class IpaTataSuryaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IpaTataSuryaController>(
      () => IpaTataSuryaController(),
    );
  }
}
