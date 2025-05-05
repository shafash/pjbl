import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Delay sebentar lalu pindah ke halaman Welcome
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed('/welcome');
    });
  }
}
