import 'package:get/get.dart';
import '../controllers/kuis_bahasa_inggris_controller.dart';

class KuisInggrisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KuisInggrisController>(() => KuisInggrisController());
  }
}
