import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; // tambahkan ini
import 'package:kelas_pintar/app/routes/app_pages.dart';

class MateriView extends StatelessWidget {
  const MateriView({super.key});

  @override
  Widget build(BuildContext context) {
    final materiList = [
      {
        'title': 'Bahasa Inggris',
        'icon': 'assets/english.png',
        'route': Routes.ENGLISH_SUBMATERI,
      },
      {
        'title': 'Math',
        'icon': 'assets/math.png',
        'route': Routes.MATH_SUBMATERI
      },
      {'title': 'IPA', 'icon': 'assets/ipa.png', 'route': Routes.IPA_SUBMATERI},
      {
        'title': 'IPS',
        'icon': 'assets/ips.png',
        'route': Routes.SUB_MATERI_IPS
      },
      {
        'title': 'Bahasa Indonesia',
        'icon': 'assets/bahasa_indonesia.png',
        'route': Routes.SUBMATERI_INDONESIA,
      },
      {
        'title': 'Seni',
        'icon': 'assets/seni.png',
        'route': Routes.SUBMATERI_SENI
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Materi Pembelajaran',
          style: GoogleFonts.mochiyPopOne(
            // pakai MochiyPopOne
            color: Colors.brown,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.brown),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: materiList.map((materi) {
            return GestureDetector(
              onTap: () {
                final route = materi['route'];
                if (route != null) {
                  Get.toNamed(route);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.brown),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(materi['icon']!, height: 80),
                    const SizedBox(height: 10),
                    Text(
                      materi['title']!,
                      style: GoogleFonts.mochiyPopOne(
                        // ganti juga sini
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
