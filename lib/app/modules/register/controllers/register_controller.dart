import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void register() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    print("Registering $name with $email and $password");

    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      Get.offNamed('/dashboard');
    } else {
      Get.snackbar("Error", "Semua field wajib diisi");
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
