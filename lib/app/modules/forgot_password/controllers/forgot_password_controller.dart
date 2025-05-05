import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();

  void sendResetLink() {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      Get.snackbar("Error", "Email tidak boleh kosong");
    } else {
      // Simulasikan pengiriman email reset
      Get.snackbar("Sukses", "Link reset password telah dikirim ke $email");
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
