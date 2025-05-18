import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final RxBool isLoggedIn = false.obs;

  Future<void> login(String email, String password) async {
    // Simulasi login sukses
    if (email == 'user@example.com' && password == 'password') {
      isLoggedIn.value = true;
    } else {
      throw Exception('Email atau password salah');
    }
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
