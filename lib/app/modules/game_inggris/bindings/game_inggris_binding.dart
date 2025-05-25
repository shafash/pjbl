import 'package:get/get.dart';

import '../controllers/game_inggris_controller.dart';

class GameInggrisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameInggrisController>(
      () => GameInggrisController(),
    );
  }
}
