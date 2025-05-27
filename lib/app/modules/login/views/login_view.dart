import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelas_pintar/app/routes/app_pages.dart';
import 'package:kelas_pintar/app/services/auth_service.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Color bgColor = const Color(0xFFFFFBF3);
  final Color accentColor = Colors.deepOrangeAccent;
  final Color textColor = Colors.brown.shade800;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.login,
                      size: 80, color: Colors.deepOrangeAccent),
                  const SizedBox(height: 24),
                  Text(
                    'Masuk',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mochiyPopOne(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined,
                          color: Colors.deepOrangeAccent),
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: GoogleFonts.mochiyPopOne(
                          color: Colors.brown.shade600),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.deepOrangeAccent),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    style:
                        GoogleFonts.mochiyPopOne(color: Colors.brown.shade800),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Email tidak valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      prefixIcon: const Icon(Icons.lock_outline,
                          color: Colors.deepOrangeAccent),
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: GoogleFonts.mochiyPopOne(
                          color: Colors.brown.shade600),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.deepOrangeAccent),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    style:
                        GoogleFonts.mochiyPopOne(color: Colors.brown.shade800),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kata sandi tidak boleh kosong';
                      }
                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            await AuthService.to.login(
                              emailController.text,
                              passwordController.text,
                            );
                            Get.offNamed(Routes.DASHBOARD);
                          } catch (e) {
                            Get.snackbar(
                              'Login Gagal',
                              e.toString().replaceAll('Exception: ', ''),
                              backgroundColor: Colors.deepOrangeAccent,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.TOP,
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        'Masuk',
                        style: GoogleFonts.mochiyPopOne(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.FORGOT_PASSWORD);
                    },
                    child: Text(
                      'Lupa kata sandi?',
                      style: GoogleFonts.mochiyPopOne(
                          color: Colors.deepOrangeAccent),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: Text(
                      'Belum punya akun? Daftar di sini',
                      style: GoogleFonts.mochiyPopOne(
                          color: Colors.deepOrangeAccent),
                    ),
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
