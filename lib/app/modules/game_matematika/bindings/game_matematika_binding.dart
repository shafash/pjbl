import 'package:get/get.dart';

import '../controllers/game_matematika_controller.dart';

class GameMatematikaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MathGameController>(
      () => MathGameController(),
    );
  }
}
