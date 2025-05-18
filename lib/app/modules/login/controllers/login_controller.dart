import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer'; // Untuk menggantikan print

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Email dan kata sandi tidak boleh kosong.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Contoh implementasi login sederhana
    if (email == 'admin@example.com' && password == 'admin123') {
      log('Login berhasil'); // gunakan log() bukan print
      Get.offAllNamed('/dashboard');
    } else {
      Get.snackbar(
        'Login Gagal',
        'Email atau kata sandi salah.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
