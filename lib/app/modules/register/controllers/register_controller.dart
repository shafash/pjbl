import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void register() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Registrasi Gagal", "Email dan Password wajib diisi");
      return;
    }

    // Simulasi delay registrasi sukses
    Future.delayed(const Duration(seconds: 1), () {
      Get.snackbar("Registrasi Berhasil", "Silakan login dengan akun Anda");
      Get.offAllNamed('/login');
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
