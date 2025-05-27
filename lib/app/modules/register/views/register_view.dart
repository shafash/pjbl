import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelas_pintar/app/routes/app_pages.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final Color bgColor = const Color(0xFFFFFBF3);
  final Color accentColor = Colors.deepOrangeAccent;
  final Color textColor = Colors.brown.shade900;

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
                  const Icon(Icons.app_registration,
                      size: 80, color: Colors.deepOrangeAccent),
                  const SizedBox(height: 24),
                  Text(
                    'Daftar',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mochiyPopOne(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon:
                          Icon(Icons.email_outlined, color: accentColor),
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: GoogleFonts.mochiyPopOne(
                          color: Colors.brown.shade700),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: accentColor),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    style: GoogleFonts.mochiyPopOne(color: textColor),
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
                      prefixIcon: Icon(Icons.lock_outline, color: accentColor),
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: GoogleFonts.mochiyPopOne(
                          color: Colors.brown.shade700),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: accentColor),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    style: GoogleFonts.mochiyPopOne(color: textColor),
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
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Konfirmasi Kata Sandi',
                      prefixIcon: Icon(Icons.lock_outline, color: accentColor),
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: GoogleFonts.mochiyPopOne(
                          color: Colors.brown.shade700),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: accentColor),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    style: GoogleFonts.mochiyPopOne(color: textColor),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Konfirmasi kata sandi tidak boleh kosong';
                      }
                      if (value != passwordController.text) {
                        return 'Kata sandi tidak cocok';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Proses registrasi sukses, lanjut ke login
                          Get.snackbar(
                            'Registrasi',
                            'Berhasil daftar',
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          // Navigasi ke halaman login
                          Get.offNamed(Routes.LOGIN);
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
                        'Daftar',
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
                    onPressed: () => Get.offNamed(Routes.LOGIN),
                    child: Text(
                      'Sudah punya akun? Masuk di sini',
                      style: GoogleFonts.mochiyPopOne(color: accentColor),
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
