import 'package:get/get.dart';

import '../controllers/match_word_picture_controller.dart';

class MatchWordPictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatchWordPictureController>(
      () => MatchWordPictureController(),
    );
  }
}
