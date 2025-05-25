import 'package:get/get.dart';
import '../../../controllers/theme_controller.dart';
import '../controllers/profil_controller.dart';
import '../../tugas/controllers/tugas_controller.dart';

class ProfilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilController>(() => ProfilController());
    Get.lazyPut<TugasController>(() => TugasController());
    Get.lazyPut<ThemeController>(() => ThemeController());
  }
}
