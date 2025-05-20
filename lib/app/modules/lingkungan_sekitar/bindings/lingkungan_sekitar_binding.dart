import 'package:get/get.dart';
import '../controllers/lingkungan_sekitar_controller.dart';

class LingkunganSekitarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LingkunganSekitarController>(
      () => LingkunganSekitarController(),
    );
  }
}
