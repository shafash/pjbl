import 'package:get/get.dart';
import '../controllers/game_monopoli_controller.dart';

class GameMonopoliBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameMonopoliController>(() => GameMonopoliController());
  }
}
