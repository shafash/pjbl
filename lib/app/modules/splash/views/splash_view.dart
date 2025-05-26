import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed('/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color bgColor = const Color(0xFFFFF8E1);
    final Color textColor = const Color(0xFF6D4C41);

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash.png', width: 200),
            const SizedBox(height: 50),
            Text(
              'Kelas Pintar',
              style: GoogleFonts.mochiyPopOne(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Belajar jadi menyenangkan!',
              style: GoogleFonts.mochiyPopOne(
                fontSize: 18,
                color: textColor.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
