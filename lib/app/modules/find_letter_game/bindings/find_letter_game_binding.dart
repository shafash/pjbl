import 'package:get/get.dart';
import 'package:kelas_pintar/app/modules/find_letter_game/controllers/find_letter_game_controller.dart';

class FindMissingLetterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindMissingLetterController>(
        () => FindMissingLetterController());
  }
}
