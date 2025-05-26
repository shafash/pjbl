import 'package:get/get.dart';
import '../controllers/flags_game_controller.dart';

class FlagsGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlagsGameController>(() => FlagsGameController());
  }
}
