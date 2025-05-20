// Semua halaman IPA dibuat lebih menarik dan interaktif, dengan penjelasan singkat di atas kartu
// dan struktur navigasi tetap menggunakan GetX

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class IpaBendaSifatView extends StatelessWidget {
  const IpaBendaSifatView({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      'title': 'Benda Padat',
      'desc': 'Benda padat memiliki bentuk dan volume tetap.',
      'image': 'assets/padat.png',
      'route': '/ipa-benda-padat',
      'color': Color(0xFFF8BBD0),
    },
    {
      'title': 'Benda Cair',
      'desc': 'Benda cair mengalir dan mengikuti bentuk wadahnya.',
      'image': 'assets/cair.png',
      'route': '/ipa-benda-cair',
      'color': Color(0xFFB3E5FC),
    },
    {
      'title': 'Benda Gas',
      'desc': 'Gas menyebar memenuhi ruang dan tidak memiliki bentuk tetap.',
      'image': 'assets/gas.png',
      'route': '/ipa-benda-gas',
      'color': Color(0xFFFFF9C4),
    },
    {
      'title': 'Sifat Benda',
      'desc': 'Sifat benda mencakup bentuk, ukuran, berat, dan lain-lain.',
      'image': 'assets/sifat.png',
      'route': '/ipa-sifat-benda',
      'color': Color(0xFFC8E6C9),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Benda & Sifatnya',
          style: GoogleFonts.mochiyPopOne(),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: items.map((item) {
              return GestureDetector(
                onTap: () => Get.toNamed(item['route']),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: item['color'],
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 6,
                        color: Colors.black26,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            item['image'],
                            height: 80,
                            width: 80,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              item['title'],
                              style: GoogleFonts.mochiyPopOne(
                                fontSize: 22,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item['desc'],
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
