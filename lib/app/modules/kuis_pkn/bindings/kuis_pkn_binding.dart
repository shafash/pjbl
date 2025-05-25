import 'package:get/get.dart';
import '../controllers/kuis_pkn_controller.dart';

class KuisPknBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KuisPknController>(() => KuisPknController());
  }
}
