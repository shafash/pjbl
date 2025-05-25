import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final RxBool isLoggedIn = false.obs;

  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email.trim() == 'user@example.com' && password == 'password123') {
      isLoggedIn.value = true;
    } else {
      isLoggedIn.value = false;
      throw Exception('Email atau password salah');
    }
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
