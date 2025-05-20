import 'package:get/get.dart';

import '../controllers/ipa_benda_cair_controller.dart';

class IpaBendaCairBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IpaBendaCairController>(
      () => IpaBendaCairController(),
    );
  }
}
