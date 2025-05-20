import 'package:get/get.dart';

import '../controllers/tanggung_jawab_sekolah_controller.dart';

class TanggungJawabSekolahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TanggungJawabSekolahController>(
      () => TanggungJawabSekolahController(),
    );
  }
}
