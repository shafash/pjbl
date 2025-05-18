import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key}); // ✔️ Menggunakan super parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A1212), // ✔️ const untuk warna tetap
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/splash.png',
                  height: 250), // tidak perlu const
              const SizedBox(height: 16),
              const Text(
                "Belajar menjadi lebih menyenangkan",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                onPressed: () => Get.offNamed('/login'),
                child: const Text(
                  "Masuk untuk memulai",
                  style: TextStyle(fontSize: 16, color: Color(0xFF7A1212)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
