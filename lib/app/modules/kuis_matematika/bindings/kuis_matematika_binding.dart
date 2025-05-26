import 'package:get/get.dart';
import '../controllers/kuis_matematika_controller.dart';

class KuisMathBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KuisMatematikaController());
  }
}
