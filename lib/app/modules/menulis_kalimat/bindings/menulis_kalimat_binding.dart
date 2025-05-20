import 'package:get/get.dart';

import '../controllers/menulis_kalimat_controller.dart';

class MenulisKalimatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenulisKalimatController>(
      () => MenulisKalimatController(),
    );
  }
}
