import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Lupa Password",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: "Masukkan email kamu",
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: controller.sendResetLink,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFFB00000),
                foregroundColor:
                    Colors.white, // <-- ini bikin tulisan jadi putih
              ),
              child: const Text("Kirim Link Reset"),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Kembali ke Login"),
            ),
          ],
        ),
      ),
    );
  }
}
