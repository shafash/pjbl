import 'package:get/get.dart';

import '../controllers/game_hub_controller.dart';

class GameHubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameHubController>(
      () => GameHubController(),
    );
  }
}
