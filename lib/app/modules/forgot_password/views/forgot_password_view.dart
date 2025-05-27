import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final Color bgColor = const Color(0xFFFFFBF3);
  final Color accentColor = Colors.deepOrangeAccent;
  final Color textColor = Colors.brown.shade900;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          // pusatkan konten horizontal & vertical
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 400,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.lock_reset,
                        size: 80, color: Colors.deepOrangeAccent),
                    const SizedBox(height: 24),
                    Text(
                      'Lupa Kata Sandi',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mochiyPopOne(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Masukkan email akunmu. Kami akan mengirimkan tautan untuk reset kata sandi.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mochiyPopOne(
                        fontSize: 14,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 24),
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
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Get.snackbar(
                              'Email Dikirim',
                              'Periksa email untuk reset kata sandi',
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                            Get.back();
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
                          'Kirim Tautan Reset',
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
                      onPressed: () => Get.back(),
                      child: Text(
                        'Kembali ke Login',
                        style: GoogleFonts.mochiyPopOne(color: accentColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
