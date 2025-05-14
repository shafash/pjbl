import 'package:get/get.dart';
import '../controllers/english_alphabet_controller.dart';

class EnglishAlphabetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnglishAlphabetController>(() => EnglishAlphabetController());
  }
}
