import 'package:get/get.dart';
import '../controllers/kuis_seni_controller.dart';

class KuisSbkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KuisSeniController>(() => KuisSeniController());
  }
}
