import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../routes/app_pages.dart'; // pastikan ini diimpor

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void register() {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Registrasi Gagal", "Email dan Password wajib diisi");
      return;
    }

    Get.snackbar("Registrasi Berhasil", "Silakan login dengan akun Anda");

    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
