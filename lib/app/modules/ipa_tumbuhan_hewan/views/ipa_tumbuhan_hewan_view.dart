import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class IpaTumbuhanHewanView extends StatelessWidget {
  const IpaTumbuhanHewanView({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      'title': 'Tumbuhan',
      'route': '/ipa-tumbuhan-contoh',
      'image': 'assets/plants.png',
      'color': Color(0xFFA5D6A7),
    },
    {
      'title': 'Hewan',
      'route': '/ipa-hewan-contoh',
      'image': 'assets/animals.png',
      'color': Color(0xFFFFF59D),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tumbuhan & Hewan',
          style: GoogleFonts.mochiyPopOne(),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: items.map((item) {
            return GestureDetector(
              onTap: () => Get.toNamed(item['route']),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(16),
                height: 150,
                decoration: BoxDecoration(
                  color: item['color'],
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.black26,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      item['image'],
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        item['title'],
                        style: GoogleFonts.mochiyPopOne(
                          fontSize: 24,
                          color: Colors.black87,
                        ),
                      ),
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
