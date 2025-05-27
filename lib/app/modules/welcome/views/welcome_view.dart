import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color bgColor = const Color(0xFFFFF8E1);
    final Color textColor = const Color(0xFF6D4C41);
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash.png',
              width: screenWidth * 0.65,
            ),
            const SizedBox(height: 28),
            Text(
              'Selamat Datang di Kelas Pintar!',
              textAlign: TextAlign.center,
              style: GoogleFonts.mochiyPopOne(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Tempat terbaik untuk belajar dan bermain.',
              textAlign: TextAlign.center,
              style: GoogleFonts.mochiyPopOne(
                fontSize: 15,
                color: textColor.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Get.toNamed('/login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFBC02D),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Text(
                'Mulai',
                style: GoogleFonts.mochiyPopOne(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.brown.shade900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
