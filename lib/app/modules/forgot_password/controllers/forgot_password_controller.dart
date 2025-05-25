import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  void sendResetLink(String email) {
    if (!email.contains('@') || !email.contains('.')) {
      Get.snackbar(
        'Error',
        'Email tidak valid',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      Get.snackbar(
        'Sukses',
        'Link reset telah dikirim ke $email',
        backgroundColor: Colors.green.shade100,
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
