import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required bool isDark,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: TextStyle(color: isDark ? Colors.white : Colors.black87),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
        filled: true,
        fillColor:
            isDark ? Colors.red.shade900.withOpacity(0.2) : Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:
              BorderSide(color: isDark ? Colors.white : Colors.red.shade900),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label tidak boleh kosong';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF8B0000) : Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.red.shade900,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildTextField(
                    controller: controller.emailController,
                    label: 'Email',
                    isDark: isDark,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: controller.passwordController,
                    label: 'Password',
                    isDark: isDark,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.login();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isDark ? Colors.red.shade900 : Colors.red.shade700,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('Masuk'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () => Get.toNamed('/forgot-password'),
                    style: TextButton.styleFrom(
                      foregroundColor:
                          isDark ? Colors.white : Colors.red.shade900,
                    ),
                    child: const Text('Lupa Kata Sandi?'),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () => Get.toNamed('/register'),
                    style: TextButton.styleFrom(
                      foregroundColor:
                          isDark ? Colors.white : Colors.red.shade900,
                    ),
                    child: const Text('Belum punya akun? Daftar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
