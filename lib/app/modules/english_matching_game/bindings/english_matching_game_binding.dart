import 'package:get/get.dart';

import '../controllers/english_matching_game_controller.dart';

class EnglishMatchingGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnglishMatchingGameController>(
      () => EnglishMatchingGameController(),
    );
  }
}
