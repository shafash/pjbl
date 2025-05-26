import 'package:get/get.dart';

import '../controllers/alat_musik_adat_controller.dart';

class AlatMusikAdatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlatMusikAdatController>(
      () => AlatMusikAdatController(),
    );
  }
}
