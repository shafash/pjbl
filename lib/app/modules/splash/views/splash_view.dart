import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelas_pintar/app/services/audio_services.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // Play background audio
    AudioService().play();

    // Navigate to Welcome page after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed('/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color bgColor = const Color(0xFFFFF8E1);
    final Color textColor = const Color(0xFF6D4C41);
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/splash.png',
                width: screenWidth * 0.7,
              ),
              const SizedBox(height: 12), // ✅ Ubah dari 24 jadi 12
              Text(
                'Kelas Pintar',
                style: GoogleFonts.mochiyPopOne(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 4), // Lebih rapat antar teks
              Text(
                'Belajar jadi menyenangkan!',
                style: GoogleFonts.mochiyPopOne(
                  fontSize: 16,
                  color: textColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
