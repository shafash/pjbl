import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas_pintar/app/routes/app_pages.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    print('>>> SplashView loaded');

    // Delay 3 detik, lalu pindah ke halaman Welcome
    Future.delayed(const Duration(seconds: 3), () {
      print('>>> Redirecting to Welcome...');
      Get.offAllNamed(Routes.WELCOME);
    });

    return Scaffold(
      backgroundColor: const Color(0xFF7A1212),
      body: Center(
        child: Image.asset(
          'assets/splash.png',
          height: 250,
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              'Splash image not found!',
              style: TextStyle(color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}
