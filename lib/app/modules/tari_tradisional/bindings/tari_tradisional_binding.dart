import 'package:get/get.dart';

import '../controllers/tari_tradisional_controller.dart';

class TariTradisionalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TariTradisionalController>(
      () => TariTradisionalController(),
    );
  }
}
