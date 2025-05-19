import 'package:get/get.dart';

import '../controllers/flags_controller.dart';

class FlagsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlagsController>(
      () => FlagsController(),
    );
  }
}
