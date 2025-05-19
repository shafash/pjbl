import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final RxBool isLoggedIn = false.obs;

  Future<void> login(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      isLoggedIn.value = true;
    } else {
      throw Exception('Email dan password tidak boleh kosong');
    }
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
