import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7A1212),
                  ),
                ),
                const SizedBox(height: 24),

                // Email Field
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 12),

                // Password Field
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),

                // Forgot Password Link
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Get.toNamed('/forgot-password'),
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color(0xFF7A1212),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Login Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7A1212),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    final email = emailController.text.trim();
                    final name = email.split('@').first.capitalizeFirst!;
                    Get.toNamed('/dashboard', arguments: name);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 16),

                // Register Link
                TextButton(
                  onPressed: () => Get.toNamed('/register'),
                  child: const Text("Belum punya akun? Daftar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
