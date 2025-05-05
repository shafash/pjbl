import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    // TODO: Implement login logic
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    print("Login with $email and $password");

    // Example:
    if (email.isNotEmpty && password.isNotEmpty) {
      Get.offNamed('/dashboard');
    } else {
      Get.snackbar("Error", "Email dan password wajib diisi");
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
