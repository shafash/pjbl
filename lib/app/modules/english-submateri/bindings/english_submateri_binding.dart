import 'package:get/get.dart';

import '../controllers/english_submateri_controller.dart';

class EnglishSubmateriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnglishSubmateriController>(
      () => EnglishSubmateriController(),
    );
  }
}
